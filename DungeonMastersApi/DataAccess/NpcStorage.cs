﻿using _5eScraper.Models;
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
  public class NpcStorage : BaseStorage
  {
    private readonly string conString;
    private BaseStorage _baseStorage;
    private ItemStorage _itemStorage;
    private WeaponStorage _weaponStorage;
    private Random _random = new Random();

    public NpcStorage(IConfiguration config) : base(config)
    {
      conString = config.GetSection("ConnectionString").Value;
      _baseStorage = new BaseStorage(config);
      _itemStorage = new ItemStorage(config);
      _weaponStorage = new WeaponStorage(config);
    }

    public List<Pc> GetUserNpcList(string firebaseId)
    {
      using (var connection = new SqlConnection(conString))
      {
        var npcs = connection.Query<Pc>(@"Select * from Pc as p Where p.firebase_id = @id and p.type = 'npc'", new { id = firebaseId });
        var npcList = npcs.ToList();
        return npcList;
      }
    }

    public Pc CreateRandomNPC()
    {
      Pc npc = new Pc();
      ABS abs = new ABS();
      npc.name = npc.randName();
      npc.characteristics = npc.randCharacteristics();
      npc.abilityScores = abs.randomABS();
      npc.race_name = npc.randRace();
      npc.items = _itemStorage.GetRandomItems();
      npc.weapons = _weaponStorage.GetRandomWeapons();
      npc.skills = _baseStorage.GetRandomSkills();
      npc.experience = _random.Next(2000);
      npc.level = _random.Next(20);
      npc.hit_points = _random.Next(95);
      npc.proficiency_score = _random.Next(5);
      npc.playerClasses = _baseStorage.GetRandomClass();
      return npc;
    }

    public bool UpdateNpc(int id, Pc npc)
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
          id = npc.id,
          name = npc.name,
          characteristics = npc.characteristics,
          description = npc.description,
          hit_points = npc.hit_points,
          proficiency_score = npc.proficiency_score,
          experience = npc.experience,
          level = npc.level,
          is_active = npc.is_active,
          race_name = npc.race_name
        });

        _baseStorage.UpdateAbilityScores(npc.abilityScores);

        return pcUpdate == 1;
      }
    }

  }
}
