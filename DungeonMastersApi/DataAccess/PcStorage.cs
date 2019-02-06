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
    public class PcStorage
    {
        private readonly string conString;
        public PcStorage(IConfiguration configuration)
        {
            conString = configuration.GetSection("ConnectionString").Value;
        }

        public bool AddPc(Pc pc)
        {
            using (var connection = new SqlConnection(conString))
            {
                connection.Open();
                var ability_scores = pc.abilityScores;
                
                var result = connection.Execute(@"INSERT INTO [dbo].[Pc]([name],[characteristics],[description],[hit_points],[proficiency_score]
                                                ,[experience],[level],[is_active],[class_name],[race_name],[firebase_id])
                                                VALUES(@name,@characteristics,@description,@hit_points,@proficiency_score,@experience,@level
                                                ,@is_active,@class_name,@race_name,@firebase_id)", pc);

                var thisPc = connection.Query<Pc>(@"select *  from Pc as p
                                                   where p.name = @name and p.firebase_id = @firebase_id", new { name = pc.name, firebase_id = pc.firebase_id });

                ability_scores.ElementAt(0).owner_id = thisPc.ElementAt(0).id;
                ability_scores.ElementAt(0).firebase_id = pc.firebase_id;
                var addABS = connection.Execute(@"INSERT INTO [dbo].[PcAs]([strength],[dexterity],[constitution],[wisdom],[intelligence],[charisma]
                                                ,[owner_id],[firebase_id])
                                                VALUES(@strength,@dexterity,@constitution,@wisdom,@intelligence,@charisma,@owner_id,@firebase_id)"
                                                , ability_scores);
                return result == 1;
            }
        }

        
    }
}
