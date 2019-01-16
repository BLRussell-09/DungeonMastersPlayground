using _5eScraper.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Http;

namespace _5eScraper
{
  class Program
  {
    static void Main(string[] args)
    {
      Race deserializedJson = JsonConvert.DeserializeObject<Race>(WebScraper(2));

      Console.WriteLine(deserializedJson.name);
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
  }
}
