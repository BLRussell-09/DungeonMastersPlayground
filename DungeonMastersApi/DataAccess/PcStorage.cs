using _5eScraper.Models;
using Dapper;
using DungeonMastersApi.Models;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace DungeonMastersApi.DataAccess
{
    public class PcStorage : BaseStorage
    {
        private readonly string conString;
        private BaseStorage _baseStorage;
        private WeaponStorage _weaponStorage;
        private ItemStorage _itemStorage;

        public PcStorage(IConfiguration configuration) : base(configuration)
        {
            conString = configuration.GetSection("ConnectionString").Value;
            _baseStorage = new BaseStorage(configuration);
            _weaponStorage = new WeaponStorage(configuration);
            _itemStorage = new ItemStorage(configuration);
        }

        public bool AddPc(Pc pc)
        {
            using (var connection = new SqlConnection(conString))
            {
                connection.Open();
                var ability_scores = pc.abilityScores;
                
                var result = connection.Execute(@"INSERT INTO [dbo].[Pc]([name],[characteristics],[description],[hit_points],[proficiency_score]
                                                ,[experience],[level],[is_active],[race_name],[firebase_id],[type])
                                                VALUES(@name,@characteristics,@description,@hit_points,@proficiency_score,@experience,@level
                                                ,@is_active,@race_name,@firebase_id,@type)", pc);

                var thisPc = connection.Query<Pc>(@"select *  from Pc as p
                                                   where p.name = @name and p.firebase_id = @firebase_id and p.type = @type", new { name = pc.name, firebase_id = pc.firebase_id, type = pc.type });
                var character = thisPc.ElementAt(0);
                ability_scores.owner_id = character.id;
                foreach (var playerClass in pc.playerClasses)
                {
                     var className = playerClass.class_name;
                     var addClass = connection.Execute(@"INSERT INTO [dbo].[Class_Name]([class_name],[owner_id],[class_level])
                                                           VALUES (@class_name,@owner_id,@class_level)", new { class_name = className, owner_id = character.id, class_level = playerClass.class_level});
                }

                _baseStorage.AddAbilityScores(ability_scores);
                pc.weapons = new List<Weapons>();
                pc.items = new List<Item>();
                foreach (var weapon in pc.weapons)
                {
                    _weaponStorage.AddWeapon(weapon);
                }
                foreach (var item in pc.items)
                {
                    _itemStorage.AddItem(item);
                }
                return result == 1;
            }
        }

        public bool UpdatePc(Pc pc)
        {
            using (var connection = new SqlConnection(conString))
            {
              connection.Open();

                var pcUpdate = connection.Execute(@"UPDATE [dbo].[Pc] SET [name] = @name,[characteristics] = @characteristics
                                                  ,[description] = @description,[hit_points] = @hit_points ,[proficiency_score] = @proficiency_score
                                                  ,[experience] = @experience,[level] = @level,[is_active] = @is_active
                                                  ,[race_name] = @race_name
                                                  WHERE Pc.id = @id", new
                {
                    id = pc.id,
                    name = pc.name,
                    characteristics = pc.characteristics,
                    description = pc.description,
                    hit_points = pc.hit_points,
                    proficiency_score = pc.proficiency_score,
                    experience = pc.experience,
                    level = pc.level,
                    is_active = pc.is_active,
                    race_name = pc.race_name
                });
              
                _baseStorage.UpdateAbilityScores(pc.abilityScores);
                foreach (var item in pc.items)
                {
                    _itemStorage.UpdateItem(item);
                }
                foreach (var weapon in pc.weapons)
                {
                    _weaponStorage.UpdateWeapon(weapon);
                }
              return pcUpdate == 1;
            }
        }

        private ABS GetAbilityScores (Pc pc)
        {
            using (var connection = new SqlConnection(conString)) 
            {
                connection.Open();
                var abilityScores = connection.Query<ABS>(@"Select * from PcAs as p 
                                                          Where p.owner_id = @id", new { id = pc.id});
                var pcAbs = abilityScores.ElementAt(0);
                return  pcAbs;
            }
        }

        public IEnumerable<Pc> GetPc(int id)
        {
            using (var connection = new SqlConnection(conString)) 
            {
                connection.Open();
                var result = connection.Query<Pc>(@"Select * from Pc as p 
                                                  Where p.id = @id", new { id = id});
                var pc = result.ElementAt(0);
                var classes = connection.Query<PcClass>(@"Select * from Class_Name as c
                                                       Where c.owner_id = @id", new { id = pc.id});
                pc.classes = new List<Class>();
                pc.playerClasses = classes.ToList();
                pc.race = _baseStorage.GetRace(pc.race_name);
                pc.abilityScores = _baseStorage.GetAbilityScores(pc.id);
                foreach(var pcClass in pc.playerClasses)
                {
                    pc.classes.Add( _baseStorage.GetClass(pcClass.class_name));
                }
                pc.weapons = _baseStorage.GetWeapons(pc.id);
                pc.items = _baseStorage.GetItems(pc.id);
                return result;
            }
        }

        public List<Pc> GetUserPcList(string firebaseId)
        {
            using (var connection = new SqlConnection(conString)) 
            {
                var pcs = connection.Query<Pc>(@"Select * from Pc as p Where p.firebase_id = @id and p.type = 'pc'", new { id = firebaseId});
                var pcList = pcs.ToList();
                return pcList;
            }
        }

    }
}
