using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DungeonMastersApi.Models
{
  public class Item
  {
    public int id { get; set; }
    public string name { get; set; }
    public string description { get; set; }
    public int quantity { get; set; }
    public int owner_id { get; set; }
  }
}
