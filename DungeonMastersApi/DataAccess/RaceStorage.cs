using _5eScraper.Models;
using Dapper;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace DungeonMastersApi.DataAccess
{
  public class RaceStorage
  {
    private readonly string conString;

    public RaceStorage(IConfiguration configuration)
    {
      conString = configuration.GetSection("ConnectionString").Value;
    }

    public bool AddRace(Race race)
    {
      using (var connection = new SqlConnection(conString))
      {
        connection.Open();
        var result = connection.Execute(@"INSERT INTO [dbo].[Race]([index],[name],[speed],[alignment],[age],[size],[size_description],[language_description],[url])
                                            VALUES (@index,@name,@speed,@alignment,@age,@size,@size_description,@language_description,@url)", race);

        return result == 1;
      }
    }
  }
}
