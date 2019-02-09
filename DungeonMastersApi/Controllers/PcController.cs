﻿using System;
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

        [HttpGet("{id}")]
        public IActionResult GetPc(int id)
        {
            if (id > 0)
            {
                return Ok(_pcStorage.GetPc(id));
            }
            else
            {
                string message = "Please include an id that is greater than 0";
                return BadRequest(message);
            }
        }

        [HttpPost("add")]
        public IActionResult AddPc(Pc pc)
        {
            if (pc != null && pc.type == "pc")
            {
              return Ok(_pcStorage.AddPc(pc));
            }
            else
            {
              string message = "Please use a valid character with type: pc";
              return BadRequest(message);
            }
        }

        [HttpPut]
        public IActionResult UpdatePc(Pc pc)
        {
            if (pc != null)
            {
                return Ok(_pcStorage.UpdatePc(pc));
            }
            else
            {
                return BadRequest();
            }
        }
    }
}