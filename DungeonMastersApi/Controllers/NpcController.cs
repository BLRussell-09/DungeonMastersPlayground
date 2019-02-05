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
      private readonly RaceStorage _raceStorage;

    public NpcController(IConfiguration config)
    {
      _npcStorage = new NpcStorage(config);
      _raceStorage = new RaceStorage(config);
    }

    [HttpGet]
    public IActionResult GetNpcs()
    {
      return Ok(_npcStorage.GetNpcs());
    }

    [HttpGet("{id}")]
    public IActionResult GetNpc(int id)
    {
      return Ok(_npcStorage.GetNpc(id));
    }

    [HttpGet("random")]
    public Npc GenerateNPC()
    {
      return _npcStorage.CreateRandomNPC();
    }

    [HttpPost("add")]
    public IActionResult AddNpc(Npc npc)
    {
      var race = npc.race;

      return Ok(_npcStorage.AddNPC(npc, race));
    }

    [HttpPost("create_random")]
    public IActionResult CreateRandomNPC()
    {
      Npc npc = _npcStorage.CreateRandomNPC();
      var race = npc.race;
      return Ok(_npcStorage.AddNPC(npc, race));
    }
  }
}