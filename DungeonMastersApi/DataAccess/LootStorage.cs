using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DungeonMastersApi.DataAccess
{
  public class LootStorage
  {
    static Random _random = new Random();

    public string randLoot()
    {
      string[] lootList =
      {
        "A painting worth 50 gold", "On the floor, you find a single pickle wrapped in an oily paper bag. It has a strong distinct smell, but otherwise seems like a normal pickle.",
        "A string of eight beaver pelts", "An old leather belt", "An ornate black velvet mask sitched with silver thread",
        "A blank scroll. It could have any spell in the world on it, eventually. The possibilities are endless.", "A thick woolen blanket. Something like this is perfect for wrapping up during those long cold nights spent staring at a cave wall.", "A strong gust of wind blows through",
        "A finely woven blue wool scarf.", "A butter churn made of bone slats, bound with hoops of silver. A scrimshaw scene depicting a crowd of human villagers beating a Halfling with shovels and hoes wraps around it.",
        "A detailed rose, with petals and thorns, constructed of silver and electrum.", "A collection of six elephant tusks.", "A dwarven holy symbol in silver; shaped into a flaming war-hammer set against an anvil-shaped backdrop.",
        "Utility belt of flasks", "A life sized ivory carving of a chicken.", "A golden signet ring, origin unknown.",
        "Potpourri with demon blood – invigorating & entrancing", "A dozen quality daggers in a rolled up rug.", "Three vials of holy water.", "A broken holy sword, inscribed with the name of a legendary Paladin."
      };

      int lootDex = _random.Next(lootList.Length);

      return lootList[lootDex];
    }
  }
}
