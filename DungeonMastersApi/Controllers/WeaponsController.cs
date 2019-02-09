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
    public class WeaponsController : ControllerBase
    {
        private readonly WeaponStorage _wpStorage;
        private readonly BaseStorage _baseStorage;

        public WeaponsController(IConfiguration configuration)
        {
            _wpStorage = new WeaponStorage(configuration);
            _baseStorage = new BaseStorage(configuration);
        }

        [HttpGet("{id}")]
        public IActionResult GetWeapon(int id)
        {
            if (id > 0)
            {
                return Ok(_wpStorage.GetWeapon(id));
            }
            else
            {
                string message = "Id must be greater than 0";
                return BadRequest(message);
            }
        }

        [HttpPost("add")]
        public IActionResult AddWeapon(Weapons weapon)
        {
            return Ok(_wpStorage.AddWeapon(weapon));
        }

        [HttpPut("{id}")]
        public IActionResult UpdateWeapon(int id, Weapons weapon)
        {
            if (id == weapon.id)
            {
                return Ok(_wpStorage.UpdateWeapon(weapon));
            }
            else
            {
                return BadRequest();
            }
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteWeapon(int id)
        {
            if (id > 0)
            {
                return Ok(_wpStorage.DeleteWeapon(id));
            }
            else
            {
                string message = "Id must be greater than 0";
                return BadRequest(message);
            }
        }
    }
}