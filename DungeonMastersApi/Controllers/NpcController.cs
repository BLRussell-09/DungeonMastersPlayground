using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DungeonMastersApi.DataAccess;
using DungeonMastersApi.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;

namespace DungeonMastersApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NpcController : ControllerBase
    {
        private readonly NpcStorage _npcStorage;
        private readonly PcStorage _pcStorage;
        public NpcController(IConfiguration config)
        {
          _npcStorage = new NpcStorage(config);
          _pcStorage = new PcStorage(config);
        }

        [HttpGet("{id}")]
        public IActionResult GetNpc(int id)
        {
          if (id > 0)
            {
              var npc = _pcStorage.GetPc(id).ElementAt(0);
              if (npc.type != "npc")
              {
                var message = "There is no npc with that id";
                return BadRequest(message);
              }
              else
              {
                return Ok(_pcStorage.GetPc(id));
              }
            }
            else
            {
                string message = "Please include an id that is greater than 0";
                return BadRequest(message);
            }
        }

        [HttpGet("random")]
        public Pc GenerateNPC()
        {
          return _npcStorage.CreateRandomNPC();
        }

        [HttpPost("add")]
        public IActionResult AddNpc(Pc npc)
        {
            var race = npc.race;
            if (npc != null && npc.type == "npc")
            {
                return Ok(_pcStorage.AddPc(npc));
            }
            else
            {
                string message = "Please use a valid character with type: npc";
                return BadRequest(message);
            }
        }

        [HttpPut]
        public IActionResult UpdateNpc(Pc npc, int id)
        {
            if (npc != null )
            {
                return Ok(_pcStorage.UpdatePc(npc, id));
            }
            else
            {
                return BadRequest();
            }
        }

        //[HttpPost("create_random")]
        //public IActionResult CreateRandomNPC()
        //{
        //  Npc npc = _npcStorage.CreateRandomNPC();
        //  var race = npc.race;
        //  return Ok(_npcStorage.AddNPC(npc, race));
        //}
    }
}