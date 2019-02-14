using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DungeonMastersApi.Models
{
  public class ProficiencySkills
  {
    public bool acrobatics { get; set; }
    public bool animal_handling { get; set; }
    public bool arcana { get; set; }
    public bool athletics { get; set; }
    public bool deception { get; set; }
    public bool history { get; set; }
    public bool insight { get; set; }
    public bool intimidation { get; set; }
    public bool investigation { get; set; }
    public bool medicine { get; set; }
    public bool nature { get; set; }
    public bool perception { get; set; }
    public bool performance { get; set; }
    public bool persuasion { get; set; }
    public bool religion { get; set; }
    public bool sleight_of_hand { get; set; }
    public bool stealth { get; set; }
    public bool survival { get; set; }
    public int owner_id { get; set; }
  }
}
