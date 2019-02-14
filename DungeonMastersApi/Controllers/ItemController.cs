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
    public class ItemController : ControllerBase
    {
        private readonly ItemStorage _itemStorage;
        
        public ItemController(IConfiguration configuration)
        {
            _itemStorage = new ItemStorage(configuration);
        }

        [HttpPost("add")]
        public IActionResult AddItem(Item item)
        {
            return Ok(_itemStorage.AddItem(item));
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteItem(int id)
        {
          if (id > 0)
          {
            return Ok(_itemStorage.DeleteItem(id));
          }
          else
          {
             string message = "Id must be greater than 0";
             return BadRequest(message);
          }
        }
    }
}