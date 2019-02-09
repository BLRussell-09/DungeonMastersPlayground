using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DungeonMastersApi.Models
{
    public class PcClass
    {
        public string class_name { get; set; }
        public string owner_id { get; set; }
        public int class_level { get; set; }
    }
}
