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
    public class PcController : ControllerBase
    {
        private readonly PcStorage _pcStorage;

        public PcController(IConfiguration configuration)
        {
          _pcStorage = new PcStorage(configuration);
        }

        [HttpPost("add")]
        public IActionResult AddPc (Pc pc)
        {
            if (pc != null)
            {
              return Ok(_pcStorage.AddPc(pc));
            }
            else
            {
              string message = "Please use a valid character";
              return BadRequest(message);
            }
        }
    }
}