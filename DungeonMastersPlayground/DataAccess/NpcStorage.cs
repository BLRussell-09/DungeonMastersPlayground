using Dapper;
using DungeonMastersPlayground.Models;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace DungeonMastersPlayground.DataAccess
{
  public class NpcStorage
  {
    private readonly string conString;

    public NpcStorage(IConfiguration config)
    {
      conString = config.GetSection("ConnectionString").Value;
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
          var npcAbs = connection.Query<ABS>(@"select * 
                      from AbilityScores as a
                       where a.owner_id = @id", new { id = npcId }).ToList();
          npc.abilityScores = npcAbs;
        }

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

    public bool AddNPC(Npc npc)
    {
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
