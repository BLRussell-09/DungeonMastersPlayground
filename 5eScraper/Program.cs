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

      Race deserializedJson = JsonConvert.DeserializeObject<Race>(WebScraper(2));
      string randId = "joshingMe3";
      Console.WriteLine(deserializedJson.name);

      AddRace(deserializedJson, randId);
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

    static bool AddRace(Race race, string id)
    {
       race.firebaseId = id;
      foreach (var language in race.languages)
      {
        language.firebaseId = id;
      }
      using (var connection = new SqlConnection(conString))
      {
        connection.Open();
        var result = connection.Execute(@"INSERT INTO [dbo].[Race]([index],[name],[speed],[alignment],[age],
                                        [size],[size_description],[language_description],[url],[firebaseId])
                                        VALUES (@index,@name,@speed,@alignment,@age,
                                        @size,@size_description,@language_description,@url,@firebaseId)", race);

        foreach (Language language in race.languages)
        {
          connection.Execute(@"INSERT INTO [dbo].[Language]([name],[url],[firebaseId])
                                VALUES (@name,@url,@firebaseId)", language);
        }
        return result == 1;
      }
    }
  }
}
