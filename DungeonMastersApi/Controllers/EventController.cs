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
    public class EventController : ControllerBase
    {
      private EventStorage _eventStorage;
      
      [HttpGet]
      public IActionResult GetRandEvent()
      {
         _eventStorage = new EventStorage();
        return Ok(_eventStorage.randEvent());
      }
    }
}