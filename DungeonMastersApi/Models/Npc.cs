using _5eScraper.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DungeonMastersApi.Models
{
  public class Npc
  {
    public int id { get; set; }
    public string name { get; set; }
    public string characteristics { get; set; }
    public List<ABS> abilityScores { get; set; }
    public Race race { get; set;}

    private Random _random = new Random();

    public string randName()
    {
      string[] nameStart =
      {
       "A", "Be", "De", "El", "Fa", "Jo", "Ki", "La", "Ma", "Na", "O", "Pa", "Re", "Si", "Ta", "Va"
      };

      string[] nameMidd =
      {
       "bar", "ched", "dell", "far", "gran", "hal", "jen", "kel", "lim", "mor", "net", "penn", "quil", "rond", "sark", "shen", "tur", "vash", "yor", "zen"
      };

      string[] nameEnd =
      {
        "a", "ac", "ai", "al", "am", "an", "ar", "ea", "el", "er", "ess", "ett", "ic", "id", "il", "in", "is", "or", "us"
      };

      int nameStartDex = _random.Next(nameStart.Length);

      int nameMiddDex = _random.Next(nameMidd.Length);

      int nameEndDex = _random.Next(nameEnd.Length);

      string n1 = nameStart[nameStartDex];
      string n2 = nameMidd[nameMiddDex];
      string n3 = nameEnd[nameEndDex];

      return n1 + n2 + n3;
    }

    public string randCharacteristics()
    {
      string[] characteristics =
      {
        "Absentminded", "Arrogant", "Boorish", "Chews Something", "Clumsy", "Dim-witted", "Fiddles and fidgets nervously",
        "Frequently uses the wrong word", "Friendly", "Irritable", "Prone to predictions of certain doom", "Pronounced scar",
        "Slurs words, lisps, or stutters", "Speaks loudly or whispers", "Squints", "Stares into the distance", "Suspicious",
        "Uses colorful oaths and exclamations", "Uses flowery speach or long words"
      };

      int charIndex = _random.Next(characteristics.Length);

      string randomChar = characteristics[charIndex];

      return randomChar;
    }
  }
}
