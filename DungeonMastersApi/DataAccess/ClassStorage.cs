using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using _5eScraper.Models;
using System.Data.SqlClient;
using Dapper;

namespace DungeonMastersApi.DataAccess
{
  public class ClassStorage
  {
    private readonly string conString;

    public ClassStorage(IConfiguration configuration)
    {
      conString = configuration.GetSection("ConnectionString").Value;
    }

    public List<Class> GetClasses()
    {
      using (var connection = new SqlConnection(conString))
      {
        connection.Open();
        var result = connection.Query<Class>(@"Select * from Class as c");
        return result.ToList();
      }
    }

    public IEnumerable<Class> GetClass(int index)
    {
      using (var connection = new SqlConnection(conString))
      {
        connection.Open();
        var result = connection.Query<Class>(@"Select * from Class as c Where c.[index] = @index", new { index = index });

        var classId = result.ElementAt(0)._id;
        var proficiencies = connection.Query<Proficiency>(@"Select * from Proficiencies as p Where p.class_id = @classId", new { classId = classId});
        var savingThrows = connection.Query<Saving_Throws>(@"Select * from Saving_Throws as st Where st.class_id = @classId", new { classId = classId});
        var proChoices = connection.Query<ProficiencyChoice>(@"Select * from Proficiency_Choices as pc Where pc.class_id = @classId", new { classId = classId });
        var pros = connection.Query<From>(@"Select * from FromP as f Where f.class_id = @classId", new { classId = classId });

        result.ElementAt(0).proficiencies = proficiencies.ToList();
        result.ElementAt(0).saving_throws = savingThrows.ToList();
        result.ElementAt(0).proficiency_choices = proChoices.ToList();

        foreach (var choice in result.ElementAt(0).proficiency_choices)
        {
          choice.from = pros.ToList();
        }

        return result;
      }
    }
  }
}
