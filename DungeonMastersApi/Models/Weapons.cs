using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DungeonMastersApi.Models
{
    public class Weapons
    {
        public int id { get; set; }
        public string name { get; set; }
        public int damage_dice { get; set; }
        public string description { get; set; }
        public int owner_id { get; set; }
    }
}
