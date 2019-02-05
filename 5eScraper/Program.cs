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
        DeleteRace(deserializedJson.firebaseId);
        AddRace(deserializedJson);
        Console.WriteLine($"The {deserializedJson.name} race has been successfully updated!");
      }

      for (int idx = 1; idx < 13; idx++)
      {
        Class classHere = JsonConvert.DeserializeObject<Class>(ClassScraper(idx));
        DeleteClass(classHere._id);
        AddClass(classHere);
        Console.WriteLine(classHere.name);
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

    static string ClassScraper(int classId)
    {
      string html = string.Empty;
      string url = "http://www.dnd5eapi.co/api/classes/" + classId;

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
                                        [size],[size_description],[language_description],[url],[race_id],[firebaseId],[_id])
                                        VALUES (@index,@name,@speed,@alignment,@age,
                                        @size,@size_description,@language_description,@url,@race_id,@firebaseId,@_id)", race);

        foreach (Language language in race.languages)
        {
          language.firebaseId = race.firebaseId;
          language.race_id = race._id;
          connection.Execute(@"INSERT INTO [dbo].[Language]([name],[url],[race_id],[firebaseId])
                                VALUES (@name,@url,@race_id,@firebaseId)", language);
        }

        foreach (StartingProficiency proficiency in race.starting_proficiencies)
        {
          proficiency.firebaseId = race.firebaseId;
          proficiency.race_id = race._id;
          connection.Execute(@"INSERT INTO [dbo].[Starting_proficiency]([name],[url],[race_id],[firebaseId])
                             VALUES (@name,@url,@race_id,@firebaseId)", proficiency);
        }

        foreach (Subrace subrace in race.subraces)
        {
          subrace.firebaseId = race.firebaseId;
          subrace.race_id = race._id;
          connection.Execute(@"INSERT INTO [dbo].[Subrace]([name],[url],[race_id],[firebaseId])
                             VALUES (@name,@url,@race_id,@firebaseId)", subrace);
        }

        foreach (Trait trait in race.traits)
        {
          trait.firebaseId = race.firebaseId;
          trait.race_id = race._id;
          connection.Execute(@"INSERT INTO [dbo].[Trait]([name],[url],[race_id],[firebaseId])
                             VALUES (@name,@url,@race_id,@firebaseId)", trait);
        }

        return result == 1;
      }
    }

    static bool AddClass(Class fiveClass)
    {
      using (var connection = new SqlConnection(conString))
      {
        connection.Open();
        var result = connection.Execute(@"INSERT INTO [dbo].[Class]([_id],[index],[name],[hit_die],[url])
                                        VALUES (@_id,@index,@name,@hit_die,@url)", fiveClass);

        foreach (Proficiency proficiency in fiveClass.proficiencies)
        {
          proficiency.class_id = fiveClass._id;
          connection.Execute(@"INSERT INTO [dbo].[Proficiencies]([name],[url],[class_id])
                             VALUES (@name,@url,@class_id)", proficiency);
        }

        foreach (Saving_Throws savingThrow in fiveClass.saving_throws)
        {
          savingThrow.class_id = fiveClass._id;
          connection.Execute(@"INSERT INTO [dbo].[Saving_Throws]([name],[url],[class_id])
                             VALUES (@name,@url,@class_id)", savingThrow);
        }

        foreach (ProficiencyChoice proficiencyChoice in fiveClass.proficiency_choices)
        {
          proficiencyChoice.class_id = fiveClass._id;
          connection.Execute(@"INSERT INTO [dbo].[Proficiency_Choices]([type],[choose],[class_id])
                             VALUES (@type,@choose,@class_id)", proficiencyChoice);

          foreach (From from in proficiencyChoice.from)
          {
            from.class_id = fiveClass._id;
            
            connection.Execute(@"INSERT INTO [dbo].[FromP]([name],[url],[class_id])
                               VALUES (@name,@url,@class_id)", from);
          }
        }

        return result == 1;
      }
    }

    static bool DeleteRace(string firebaseId)
    {
      using (var connection = new SqlConnection(conString))
      {
        var result = connection.Execute(@"DELETE FROM [dbo].[Race]
                           WHERE Race.firebaseId = @firebaseId", new { firebaseId = firebaseId });

        return result == 1;
      }
    }

    static bool DeleteClass(string classId)
    {
      using (var connection = new SqlConnection(conString))
      {
        var result = connection.Execute(@"DELETE FROM [dbo].[Class]
                                        WHERE Class._id = @id", new { id = classId });

        return result == 1;
      }
    }
  }
}
