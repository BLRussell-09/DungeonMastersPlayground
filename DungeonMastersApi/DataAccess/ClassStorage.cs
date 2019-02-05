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

    public IEnumerable<Class> GetClass(int index)
    {
      using (var connection = new SqlConnection(conString))
      {
        connection.Open();
        var result = connection.Query<Class>(@"Select * from Class as c Where c.[index] = @index", new { index = index });

        return result;
      }
    }
  }
}
