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
 
        private readonly BaseStorage _baseStorage;
        public RaceController(IConfiguration config)
        {
          _baseStorage = new BaseStorage(config);
        }

        [HttpGet("{race}")]
        public IActionResult GetRaceByName(string race)
        {
        
            race.ToLower();
            return Ok( _baseStorage.GetRace(race));
        }
    }
}
