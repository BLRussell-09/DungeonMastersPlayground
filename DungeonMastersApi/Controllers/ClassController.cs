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
    public class ClassController : ControllerBase
    {

      public readonly ClassStorage _classStorage;
      public ClassController(IConfiguration configuration)
      {
        _classStorage = new ClassStorage(configuration);
      }

      [HttpGet("{index}")]
      public IActionResult GetClass(int index)
      {
        return Ok(_classStorage.GetClass(index));
      }

      [HttpGet]
      public IActionResult GetClasses()
      {
        return Ok(_classStorage.GetClasses());
      }
    }
}