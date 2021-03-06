﻿using Dapper;
using DungeonMastersApi.Models;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace DungeonMastersApi.DataAccess
{
    public class WeaponStorage
    {
        private readonly string connectionString;
        
        public WeaponStorage(IConfiguration configuration)
        {
            connectionString = configuration.GetSection("ConnectionString").Value;
        }

        public bool AddWeapon(Weapons weapon)
        {
            using (var connection = new SqlConnection(connectionString)) 
            {
                connection.Open();
                if (weapon.owner_id > 0)
                {
                    var result = connection.Execute(@"INSERT INTO [dbo].[Weapons]([name],[damage_dice],[owner_id],[description],[dice_count])
                                                VALUES (@name,@damage_dice,@owner_id,@description,@dice_count)", weapon);
                    return result == 1;
                }
                else
                {
                    return false;
                }
                
            }
        }

        public Weapons GetWeapon (int id)
        {
            using (var connection = new SqlConnection(connectionString)) 
            {
                connection.Open();
                
                var weapon = connection.Query<Weapons>(@"Select * from Weapons as w
                                                       Where w.id = @id", new { id = id });
                return weapon.ElementAt(0);
            }
        }

    public List<Weapons> GetRandomWeapons()
    {
      using (var connection = new SqlConnection(connectionString))
      {
        connection.Open();

        var weapon = connection.Query<Weapons>(@"Select Top(5) * from Weapons as w
                                                 ORDER BY RAND()");
        if (weapon.Count() > 0)
        {
           return weapon.ToList();
        }
        else
        {
          var weaponList = new List<Weapons>();
          return weaponList;
        }
      }
    }

    public bool UpdateWeapon(Weapons weapon)
        {
            using (var connection = new SqlConnection(connectionString)) 
            {
                connection.Open();
                var result = connection.Execute(@"UPDATE [dbo].[Weapons]
                                                  SET [name] = @name,[damage_dice] = @damage_dice,[description] = @description, [dice_count] = @dice_count
                                                  WHERE Weapons.id = @id", new
                {
                  id = weapon.id,
                  name = weapon.name,
                  damage_dice = weapon.damage_dice,
                  dice_count = weapon.dice_count,
                  description = weapon.description
                });
                return result == 1;
            }
        }

        public bool DeleteWeapon(int id)
        {
            using (var connection = new SqlConnection(connectionString)) 
            {
                connection.Open();
                var result = connection.Execute(@"DELETE FROM [dbo].[Weapons]
                                                  WHERE Weapons.id = @id", new { id = id });
                return result == 1;
            }
        }
    }
}
