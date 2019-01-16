using System;
using System.Collections.Generic;
using System.Text;

namespace _5eScraper.Models
{
  public class Race
  {
    public string _id { get; set; }
    public int index { get; set; }
    public string name { get; set; }
    public int speed { get; set; }
    public List<int> ability_bonuses { get; set; }
    public string alignment { get; set; }
    public string age { get; set; }
    public string size { get; set; }
    public string size_description { get; set; }
    public List<StartingProficiency> starting_proficiencies { get; set; }
    public StartingProficiencyOptions starting_proficiency_options { get; set; }
    public List<Language> languages { get; set; }
    public string language_desc { get; set; }
    public List<Trait> traits { get; set; }
    public List<Subrace> subraces { get; set; }
    public string url { get; set; }
  }
}
