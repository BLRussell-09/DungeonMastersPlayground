using System;
using System.Collections.Generic;
using System.Text;

namespace _5eScraper.Models
{
  public class Class
  {
    public string _id { get; set; }
    public int index { get; set; }
    public string name { get; set; }
    public int hit_die { get; set; }
    public List<ProficiencyChoice> proficiency_choices{ get; set; }
    public List<Proficiency> proficiencies { get; set; }
    public List<Saving_Throws> saving_throws { get; set; }
    public string url { get; set; }
  }
}
