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
    public class BaseStorage
    {
        private readonly string conString;
        public BaseStorage(IConfiguration configuration)
        {
            conString = configuration.GetSection("ConnectionString").Value;
        }

        public Race GetRace(string race_name)
        {   using (var connection = new SqlConnection(conString))
            {
                connection.Open();
                var race = connection.Query<Race>(@"Select * from Race as r
                                                Where r.name = @name", new { name = race_name});
                var pcRace = race.ElementAt(0);
                var languages = connection.Query<Language>(@"Select * 
                                                               from Language as l
                                                               where l.race_id = @id", new { id = pcRace._id });
                var traits = connection.Query<Trait>(@"Select * 
                                                       from Trait as t
                                                       where t.race_id = @id", new { id = pcRace._id });
                var subraces = connection.Query<Subrace>(@"Select * 
                                                         from Subrace as s
                                                         where s.race_id = @id", new { id = pcRace._id });
                var proficiencies = connection.Query<StartingProficiency>(@"Select *
                                                                          from Starting_proficiency as sp
                                                                          where sp.race_id = @id", new { id = pcRace._id });
                pcRace.languages = languages.ToList();
                pcRace.traits = traits.ToList();
                pcRace.subraces = subraces.ToList();
                pcRace.starting_proficiencies = proficiencies.ToList();
                return pcRace;
            }
        }

        public Class GetClass (string className)
        {
            using (var connection = new SqlConnection(conString)) 
            {
                connection.Open();
                var pcClass = connection.Query<Class>(@"Select * from Class as c
                                        Where c.name = @name", new { name = className});
                var thisClass = pcClass.ElementAt(0);
                var proficiencyChoices = connection.Query<ProficiencyChoice>(@"Select * from Proficiency_Choices as p
                                                                          Where p.class_id = @id", new { id = thisClass._id});
                var proficiency = connection.Query<Proficiency>(@"Select * from Proficiencies as p
                                                            Where p.class_id = @id", new { id = thisClass._id});
                var savingThrows = connection.Query<Saving_Throws>(@"Select * from Saving_Throws as s 
                                                                Where s.class_id = @id", new { id = thisClass._id});
                var proficiencyOps = connection.Query<From>(@"Select * from FromP as fp
                                                            Where fp.class_id = @id", new { id = thisClass._id});
                thisClass.saving_throws = savingThrows.ToList();
                thisClass.proficiency_choices = proficiencyChoices.ToList();
                thisClass.proficiency_choices.ElementAt(0).from = proficiencyOps.ToList();
                thisClass.proficiencies = proficiency.ToList();

                return thisClass;
            }
        }

        public bool AddAbilityScores (ABS abs)
        {
            using (var connection = new SqlConnection(conString)) 
            {
                connection.Open();
                var addABS = connection.Execute(@"INSERT INTO [dbo].[PcAs]([strength],[dexterity],[constitution],[wisdom],[intelligence],[charisma],[owner_id])
                                                VALUES(@strength,@dexterity,@constitution,@wisdom,@intelligence,@charisma,@owner_id)", abs);
                return addABS == 1;
            }
        }

        public ABS GetAbilityScores (int id)
        {
            using (var connection = new SqlConnection(conString)) 
            {
                connection.Open();
                var abilityScores = connection.Query<ABS>(@"Select * from PcAs as p 
                                                          Where p.owner_id = @id", new { id = id});
                var pcAbs = abilityScores.ElementAt(0);
                return  pcAbs;
            }
        }

        public bool UpdateAbilityScores (ABS abs)
        {
            using(var connection = new SqlConnection(conString)) 
            {
                var result = connection.Execute(@"UPDATE [dbo].[PcAs]
                                                SET [strength] = @strength ,[dexterity] = @dexterity,[constitution] = @constitution,[wisdom] = @wisdom,
                                                    [intelligence] = @intelligence,[charisma] = @charisma
                                                WHERE PcAs.owner_id = @id", new
              {
                id = abs.owner_id,
                strength = abs.strength,
                dexterity = abs.dexterity,
                constitution = abs.constitution,
                wisdom = abs.wisdom,
                intelligence = abs.intelligence,
                charisma = abs.charisma
              });

              return result == 1;
            }
        }

        public List<Weapons> GetWeapons(int pcId)
        {
            using (var connection = new SqlConnection(conString)) 
            {
                connection.Open();
                List<Weapons> weaponsList = new List<Weapons>();
                var weapons = connection.Query<Weapons>(@"Select * from Weapons as w
                                                        Where w.owner_id = @id", new { id = pcId });
                return weaponsList = weapons.ToList();
            }
        }

        public List<Item> GetItems(int pcId)
        {
            using (var connection = new SqlConnection(conString)) 
            {
                connection.Open();
                List<Item> itemsList = new List<Item>();
                var items = connection.Query<Item>(@"Select * from Items as i
                                                        Where i.owner_id = @id", new { id = pcId });
                return itemsList = items.ToList();
            }
        }
    }
}
