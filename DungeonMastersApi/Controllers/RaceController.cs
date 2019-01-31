using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using _5eScraper.Models;
using DungeonMastersApi.DataAccess;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;

namespace DungeonMastersApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RaceController : ControllerBase
    {
      
      public readonly RaceStorage _raceStorage;
      List<string> races = new List<string>()
      {
        "Dwarf", "Elf", "Halfling", "Human", "Dragonborn", "Gnome", "Half-Elf", "Half-Orc", "Tiefling"
      };

      public RaceController(IConfiguration config)
      {
        _raceStorage = new RaceStorage(config);
      }

      [HttpGet("{id}")]
      public IActionResult GetRaceById(int id)
      {
        
        var raceString = races[id - 1];
        return Ok(_raceStorage.GetRace(id, raceString));
      }


      [HttpPost("add")]
      public IActionResult AddRace(Race race)
      {
        return Ok(_raceStorage.AddRace(race));
      }
    }
}
