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
      
      public RaceController(IConfiguration config)
      {
        _raceStorage = new RaceStorage(config);
      }

      [HttpPost("add")]
      public IActionResult AddRace(Race race)
      {
        return Ok(_raceStorage.AddRace(race));
      }
    }
}