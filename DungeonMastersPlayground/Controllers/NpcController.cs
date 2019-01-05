using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DungeonMastersPlayground.DataAccess;
using DungeonMastersPlayground.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;

namespace DungeonMastersPlayground.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NpcController : ControllerBase
    {
        private readonly NpcStorage _npcStorage;

        public NpcController (IConfiguration config)
        {
          _npcStorage = new NpcStorage(config);
        }
        
        [HttpGet]
        public IActionResult GetNpcs()
        {
          return Ok(_npcStorage.GetNpcs());
        }

        [HttpGet("random")]
        public Npc GenerateNPC()
        {
          return  _npcStorage.CreateRandomNPC();
        }

        [HttpPost("add")]
        public IActionResult AddNpc(Npc npc)
        {
          return Ok(_npcStorage.AddNPC(npc));
        }

        [HttpPost("create_random")]
        public IActionResult CreateRandomNPC()
        {
          Npc npc = _npcStorage.CreateRandomNPC();
          
          return Ok(_npcStorage.AddNPC(npc));
        }
    }
}