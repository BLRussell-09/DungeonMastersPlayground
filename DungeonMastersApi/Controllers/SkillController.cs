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
    public class SkillController : ControllerBase
    {
      private readonly BaseStorage _baseStorage;

      public SkillController(IConfiguration configuration)
      {
        _baseStorage = new BaseStorage(configuration);
      }

      [HttpPut]
      public IActionResult UpdatePc(ProficiencySkills skills)
      {
        if (skills != null)
        {
          return Ok(_baseStorage.UpdateSkills(skills));
        }
        else
        {
          return BadRequest();
        }
      }
  }
}