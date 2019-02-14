using _5eScraper.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DungeonMastersApi.Models
{
  public class Pc
  {
    public int id { get; set; }
    public string name { get; set; }
    public string characteristics { get; set; }
    public string description { get; set; }
    public int hit_points { get; set; }
    public int proficiency_score { get; set; }
    public int experience { get; set; }
    public int level { get; set; }
    public bool is_active { get; set; }
    public List<Weapons> weapons { get; set; }
    public List<Item> items { get; set; }
    public List<PcClass> playerClasses { get; set; }
    public string race_name { get; set; }
    public string firebase_id { get; set; }
    public Race race { get; set; }
    public List<Class> classes { get; set; }
    public ABS abilityScores { get; set; }
    public ProficiencySkills skills { get; set; }
    public string type { get; set; }

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

    public string randRace()
    {
      string[] races = 
      {
        "Dwarf", "Elf", "Halfling", "Human", "Dragonborn", "Gnome", "Half-Elf", "Half-Orc", "Tiefling"
      };

      int raceIndex = _random.Next(races.Length);
      string randomRace = races[raceIndex];
      return randomRace.ToLower();
    }
  }
}
