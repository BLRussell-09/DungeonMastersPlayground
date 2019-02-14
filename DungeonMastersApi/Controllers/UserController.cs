using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DungeonMastersApi.DataAccess;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;

namespace DungeonMastersApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly PcStorage _pcStorage;

        public UserController(IConfiguration configuration)
        {
          _pcStorage = new PcStorage(configuration);
        }

      [HttpGet("{firebaseId}/pcs")]
      public IActionResult GetUserPcs (string firebaseId)
      {
        if (firebaseId != null)
        {
          return Ok(_pcStorage.GetUserPcList(firebaseId));
        }
        else
        {
          return BadRequest();
        }
      }
    }
}