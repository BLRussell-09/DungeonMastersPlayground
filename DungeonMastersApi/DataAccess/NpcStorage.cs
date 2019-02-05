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
  public class NpcStorage
  {
    private readonly string conString;
    public  readonly RaceStorage _raceStorage;
    List<string> races = new List<string>()
    {
      "Dwarf", "Elf", "Halfling", "Human", "Dragonborn", "Gnome", "Half-Elf", "Half-Orc", "Tiefling"
    };

    public NpcStorage(IConfiguration config)
    {
      conString = config.GetSection("ConnectionString").Value;
      _raceStorage = new RaceStorage(config);
    }


    public IEnumerable<Npc> GetNpcs()
    {
      using (var connection = new SqlConnection(conString))
      {
        connection.Open();
        var result = connection.Query<Npc>(@"select * from NPC");

        for (int idx = 0; idx < result.Count(); idx++)
        {
          var npc = result.ElementAt(idx);
          int npcId = npc.id;
          string npcFirebase = npc.name;

          var npcAbs = connection.Query<ABS>(@"select * 
                      from AbilityScores as a
                       where a.owner_id = @id", new { id = npcId }).ToList();

          var npcRace = connection.Query<Race>(@"select * 
                                              from Race as r
                                              where r.firebaseId = @id", new { id = npcFirebase }).ToList();

          var languages = connection.Query<Language>(@"Select * 
                                               from Language as l
                                               where l.firebaseId = @id", new { id = npcFirebase });

          var traits = connection.Query<Trait>(@"Select * 
                                            from Trait as t
                                            where t.firebaseId = @id", new { id = npcFirebase });

          var subraces = connection.Query<Subrace>(@"Select *
                                                 from Subrace as sb
                                                 where sb.firebaseId = @id", new { id = npcFirebase });

          var proficiencies = connection.Query<StartingProficiency>(@"Select *
                                                                  from Starting_proficiency as sp
                                                                  where sp.firebaseId = @id", new { id = npcFirebase });

          if (npcRace.Count() > 0)
          {
            npc.race = npcRace[0];
            npc.abilityScores = npcAbs;
            npc.race.languages = languages.ToList();
            npc.race.traits = traits.ToList();
            npc.race.subraces = subraces.ToList();
            npc.race.starting_proficiencies = proficiencies.ToList();
          }
          
        }

        return result;
      }
    }

    public IEnumerable<Npc> GetNpc(int id)
    {
      using (var connection = new SqlConnection(conString))
      {
        connection.Open();
        var result = connection.Query<Npc>(@"Select * from Npc as n
                                          where n.id = @id", new { id = id});
        
        var npc = result.ToList()[0];

        var npcAbs = connection.Query<ABS>(@"select * 
                      from AbilityScores as a
                       where a.owner_id = @id", new { id = npc.id }).ToList();

        var npcRace = connection.Query<Race>(@"select * 
                                              from Race as r
                                              where r.firebaseId = @id", new { id = npc.name }).ToList();

        var languages = connection.Query<Language>(@"Select * 
                                               from Language as l
                                               where l.firebaseId = @id", new { id = npc.name });

        var traits = connection.Query<Trait>(@"Select * 
                                            from Trait as t
                                            where t.firebaseId = @id", new { id = npc.name });

        var subraces = connection.Query<Subrace>(@"Select *
                                                 from Subrace as sb
                                                 where sb.firebaseId = @id", new { id = npc.name });

        var proficiencies = connection.Query<StartingProficiency>(@"Select *
                                                                  from Starting_proficiency as sp
                                                                  where sp.firebaseId = @id", new { id = npc.name });

        npc.race = npcRace[0];
        npc.race.languages = languages.ToList();
        npc.race.traits = traits.ToList();
        npc.race.subraces = subraces.ToList();
        npc.race.starting_proficiencies = proficiencies.ToList();

        return result;
      }
    }

    public Npc CreateRandomNPC()
    {
      Npc npc = new Npc();
      ABS abs = new ABS();
      npc.name = npc.randName();
      npc.characteristics = npc.randCharacteristics();
      npc.abilityScores = abs.randomABS();
      return npc;
    }

    public bool AddNPC(Npc npc, Race race)
    {
      race.firebaseId = npc.name;
      using (var connection = new SqlConnection(conString))
      {
        connection.Open();
        var result = connection.Execute(@"INSERT INTO [dbo].[NPC]([name],[characteristics])
                                            VALUES (@name,@characteristics)", npc);

        var thisNpc = connection.Query<Npc>(@"select * 
                        from NPC as n
                        where n.name = @name
                        and n.characteristics = @characteristics", new { name = npc.name, characteristics = npc.characteristics });
        var abScores = npc.abilityScores.ElementAt(0);
        AddAbilityScore(thisNpc.ElementAt(0), abScores);
        race._id = race._id + npc.name;
        race.firebaseId = npc.name;
        _raceStorage.AddRace(race);
        return result == 1;
      }
    }

    public bool AddAbilityScore(Npc npc, ABS abilityScores)
    {
      using (var connection = new SqlConnection(conString))
      {
        connection.Open();
        abilityScores.owner_id = npc.id;

        var result = connection.Execute(@"INSERT INTO [dbo].[AbilityScores]([strength],[dexterity],[constitution],[wisdom],[intelligence],[charisma],[owner_id],
                                                                            [strMod],[dexMod],[conMod],[wisMod],[intMod],[chaMod])
                                          VALUES (@strength,@dexterity,@constitution,@wisdom,@intelligence,@charisma,@owner_id,
                                                  @strMod,@dexMod,@conMod,@wisMod,@intMod,@chaMod)", abilityScores);

        return result == 1;
      }
    }

    public bool UpdateNpc(int id, Npc npc, ABS abs)
    {
      using (var connection = new SqlConnection(conString))
      {
        connection.Open();
        var result = connection.Execute(@"UPDATE [dbo].[AbilityScores]
                                          SET [strength] = @strength ,[dexterity] = @dexterity,[constitution] = @constitution,[wisdom] = @wisdom,
                                              [intelligence] = @intelligence,[charisma] = @charisma,[owner_id] = @owner_id
                                          WHERE NPC.id = @id", new
        {
          id,
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

  }
}
