using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DungeonMastersPlayground.DataAccess;
using DungeonMastersPlayground.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;

namespace DungeonMastersPlayground.Controllers
{
    public class NpcthingController : Controller
    {
        private readonly NpcStorage _npcStorage;

        public NpcthingController(IConfiguration config)
        {
          _npcStorage = new NpcStorage(config);
        }

        public IActionResult Index()
        {
            var viewModel = _npcStorage.CreateRandomNPC();
            return View(viewModel);
        }

        public IActionResult Random()
        {
          ViewData["Message"] = "Look at this npc right here." ;

          return View();
        }
    }
}