using _5eScraper.Models;
using Dapper;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace _5eScraper
{
  class Program
  {
    private static readonly HttpClient client = new HttpClient();
    private static readonly string conString = "Server=(local);Database=DungeonMaster;Trusted_Connection=True";

    static void Main(string[] args)
    {
      for (int idx = 1; idx < 10; idx++)
      {
        Race deserializedJson = JsonConvert.DeserializeObject<Race>(WebScraper(idx));
        deserializedJson.firebaseId = "stockData" + deserializedJson.name;
        AddRace(deserializedJson);
        Console.WriteLine($"The {deserializedJson.name} race has been successfully added to the database");
      }

      Console.WriteLine("Finished");
      Console.Read();
    }

    static string WebScraper(int raceId)
    {
      string html = string.Empty;
      string url = "http://www.dnd5eapi.co/api/races/" + raceId;


      HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
      request.AutomaticDecompression = DecompressionMethods.GZip;
      using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
      using (Stream stream = response.GetResponseStream())
      using (StreamReader reader = new StreamReader(stream))
      {
        return html = reader.ReadToEnd();
      }
    }

    static bool AddRace(Race race)
    {
       race.race_id = race.index;
      using (var connection = new SqlConnection(conString))
      {
        connection.Open();
        var result = connection.Execute(@"INSERT INTO [dbo].[Race]([index],[name],[speed],[alignment],[age],
                                        [size],[size_description],[language_description],[url],[race_id],[firebaseId])
                                        VALUES (@index,@name,@speed,@alignment,@age,
                                        @size,@size_description,@language_description,@url,@race_id,@firebaseId)", race);

        foreach (Language language in race.languages)
        {
          language.firebaseId = race.firebaseId;
          language.race_id = race.race_id;
          connection.Execute(@"INSERT INTO [dbo].[Language]([name],[url],[race_id],[firebaseId])
                                VALUES (@name,@url,@race_id,@firebaseId)", language);
        }

        foreach (StartingProficiency proficiency in race.starting_proficiencies)
        {
          proficiency.firebaseId = race.firebaseId;
          proficiency.race_id = race.race_id;
          connection.Execute(@"INSERT INTO [dbo].[Starting_proficiency]([name],[url],[race_id],[firebaseId])
                             VALUES (@name,@url,@race_id,@firebaseId)", proficiency);
        }

        foreach (Subrace subrace in race.subraces)
        {
          subrace.firebaseId = race.firebaseId;
          subrace.race_id = race.race_id;
          connection.Execute(@"INSERT INTO [dbo].[Subrace]([name],[url],[race_id],[firebaseId])
                             VALUES (@name,@url,@race_id,@firebaseId)", subrace);
        }

        foreach (Trait trait in race.traits)
        {
          trait.firebaseId = race.firebaseId;
          trait.race_id = race.race_id;
          connection.Execute(@"INSERT INTO [dbo].[Trait]([name],[url],[race_id],[firebaseId])
                             VALUES (@name,@url,@race_id,@firebaseId)", trait);
        }

        return result == 1;
      }
    }
  }
}
