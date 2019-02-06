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
    public string class_name { get; set; }
    public string race_name { get; set; }
    public string firebase_id { get; set; }
    public Race race { get; set; }
    public List<Class> classes { get; set; }
    public List<ABS> abilityScores { get; set; }
  }
}
