using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DungeonMastersApi.DataAccess;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DungeonMastersApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LootController : ControllerBase
    {
      private LootStorage _lootStorage;

      [HttpGet]
      public IActionResult GetRandLoot()
      {
        _lootStorage = new LootStorage();
        return Ok(_lootStorage.randLoot());
      }
    }
}