using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

namespace _5eDataScrape
{
  public class Program
  {
    static HttpClient client = new HttpClient();

    public static void Main(string[] args)
    {
      CreateWebHostBuilder(args).Build().Run();
    }

    public static IWebHostBuilder CreateWebHostBuilder(string[] args) =>
        WebHost.CreateDefaultBuilder(args)
            .UseStartup<Startup>();

    static async Task<Object> GetProductAsync()
    {
      Object raceJson = null;

      HttpResponseMessage response = await client.GetAsync("http://www.dnd5eapi.co/api/races/1");
      if (response.IsSuccessStatusCode)
      {
        raceJson = await response.Content.ReadAsAsync<Object>();
      }
      return raceJson;
    }
  }
}
