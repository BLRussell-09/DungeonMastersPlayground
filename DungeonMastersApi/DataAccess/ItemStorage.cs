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
  public class ItemStorage
  {
      private readonly string connectionString;
      public ItemStorage(IConfiguration configuration)
      {
          connectionString = configuration.GetSection("ConnectionString").Value;
      }

      public bool AddItem(Item item)
      {
          using (var connection = new SqlConnection(connectionString)) 
          {
              connection.Open();

              var result = connection.Execute(@"INSERT INTO [dbo].[Items]([name],[description],[quantity],[owner_id])
                                              VALUES(@name,@description,@quantity,@owner_id)", item);

              return result == 1;
          }
      }

      public Weapons GetItem (int id)
        {
            using (var connection = new SqlConnection(connectionString)) 
            {
                connection.Open();
                
                var item = connection.Query<Weapons>(@"Select * from Items as i
                                                       Where i.id = @id", new { id = id });
                return item.ElementAt(0);
            }
      }

        public bool UpdateItem(Item item)
        {
            using (var connection = new SqlConnection(connectionString)) 
            {
                connection.Open();
                var result = connection.Execute(@"UPDATE [dbo].[Items]
                                                SET [name] = @name,[description] = @description,[quantity] = @quantity
                                              WHERE Items.id = @id", new
                {
                  id = item.id,
                  name = item.name,
                  description = item.description,
                  quantity = item.quantity,
                });
                return result == 1;
            }
        }

        public bool DeleteItem(int id)
        {
            using (var connection = new SqlConnection(connectionString)) 
            {
                connection.Open();
                var result = connection.Execute(@"DELETE FROM [dbo].[Items]
                                                  WHERE Items.id = @id", new { id = id });
                return result == 1;
            }
        }
  }
}
