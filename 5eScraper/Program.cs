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
        //AddRace(deserializedJson);
        UpdateRace(deserializedJson.firebaseId, deserializedJson);
        Console.WriteLine($"The {deserializedJson.name} race has been successfully updated!");
      }

      Console.WriteLine("Finished, press enter to exit");
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

    static bool UpdateRace(string firebaseId, Race race)
    {
      var languages = race.languages;
      var traits = race.traits;
      var subraces = race.subraces;
      var starting_proficiencies = race.starting_proficiencies;

      using (var connection = new SqlConnection(conString))
      {
        connection.Open();
        var result = connection.Execute(@"UPDATE [dbo].[Race]
                                        SET [index] = @index,[name] = @name,[speed] = @speed,[alignment] = @alignment,[age] = @age,
                                        [size] = @size,[size_description] = @size_description,[language_description] = @language_description,
                                        [url] = @url
                                        WHERE Race.firebaseId = @firebaseId", new
        {
          firebaseId,
          index = race.index,
          name = race.name,
          speed = race.speed,
          alignment = race.alignment,
          age = race.age,
          size = race.size,
          size_description = race.size_description,
          language_description = race.language_description,
          url = race.url
        });

        foreach (Language language in languages)
        {
          connection.Execute(@"UPDATE [dbo].[Language]
                             SET [name] = @name,[url] = @url
                             WHERE Language.firebaseId = @firebaseId", new { name = language.name, url = language.url, firebaseId = firebaseId });
        }

        foreach (Trait trait in traits)
        {
          connection.Execute(@"UPDATE [dbo].[Trait]
                             SET [name] = @name,[url] = @url
                             WHERE Trait.firebaseId = @firebaseId", new { name = trait.name, url = trait.url, firebaseId = firebaseId });
        }

        foreach (Subrace subrace in subraces)
        {
          connection.Execute(@"UPDATE [dbo].[Subrace]
                             SET [name] = @name,[url] = @url
                             WHERE Subrace.firebaseId = @firebaseId", new { name = subrace.name, url = subrace.url, firebaseId = firebaseId });
        }

        foreach (StartingProficiency startingProficiency in starting_proficiencies)
        {
          connection.Execute(@"UPDATE [dbo].[Starting_proficiency]
                             SET [name] = @name,[url] = @url
                             WHERE Starting_proficiency.firebaseId = @firebaseId", new { name = startingProficiency.name, url = startingProficiency.url, firebaseId = firebaseId });
        }

        return result == 1;
      }
    }
  }
}
