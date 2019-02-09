using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DungeonMastersApi.Models
{
  public class ABS
  {
    public int strength { get; set; }
    public int dexterity { get; set; }
    public int constitution { get; set; }
    public int intelligence { get; set; }
    public int wisdom { get; set; }
    public int charisma { get; set; } 
    public int owner_id { get; set; }
    public int pc_id { get; set; }
    public string firebase_id { get; set; }

    private Random _random = new Random();

    private int randNum(int start, int end)
    {
      int number = _random.Next(start, end);

      return number;
    }

    public ABS randomABS()
    {

      ABS abilityScores = new ABS();
      List<ABS> abList = new List<ABS>();

      abilityScores.strength = randNum(6, 18);
      abilityScores.dexterity = randNum(6, 18);
      abilityScores.constitution = randNum(6, 18);
      abilityScores.intelligence = randNum(6, 18);
      abilityScores.wisdom = randNum(6, 18);
      abilityScores.charisma = randNum(6, 18); 

      abList.Add(abilityScores);

      return abilityScores;
    }
  }
}
