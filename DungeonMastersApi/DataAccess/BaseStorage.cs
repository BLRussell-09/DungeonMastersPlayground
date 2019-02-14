using _5eScraper.Models;
using Dapper;
using DungeonMastersApi.Models;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace DungeonMastersApi.DataAccess
{
    public class BaseStorage
    {
        private readonly string conString;
        public BaseStorage(IConfiguration configuration)
        {
            conString = configuration.GetSection("ConnectionString").Value;
        }

        public Race GetRace(string race_name)
        {   using (var connection = new SqlConnection(conString))
            {
                connection.Open();
                var race = connection.Query<Race>(@"Select * from Race as r
                                                Where r.name = @name", new { name = race_name});
                if (race.Count() > 0 )
                {
                  var pcRace = race.ElementAt(0);
                  var languages = connection.Query<Language>(@"Select * 
                                                                       from Language as l
                                                                       where l.race_id = @id", new { id = pcRace._id });
                  var traits = connection.Query<Trait>(@"Select * 
                                                               from Trait as t
                                                               where t.race_id = @id", new { id = pcRace._id });
                  var subraces = connection.Query<Subrace>(@"Select * 
                                                                 from Subrace as s
                                                                 where s.race_id = @id", new { id = pcRace._id });
                  var proficiencies = connection.Query<StartingProficiency>(@"Select *
                                                                                  from Starting_proficiency as sp
                                                                                  where sp.race_id = @id", new { id = pcRace._id });
                  pcRace.languages = languages.ToList();
                  pcRace.traits = traits.ToList();
                  pcRace.subraces = subraces.ToList();
                  pcRace.starting_proficiencies = proficiencies.ToList();
                  return pcRace;
                }
                else
                {
                  var pcRace = new Race();
                  return pcRace;
                } 
            }
        }

        public List<Race> GetRaces()
        {   using (var connection = new SqlConnection(conString))
            {
                connection.Open();
                var races = connection.Query<Race>(@"Select * from Race as r");
                return races.ToList(); 
            }
        }

        public Class GetClass (string className)
        {
            using (var connection = new SqlConnection(conString)) 
            {
                connection.Open();
                var pcClass = connection.Query<Class>(@"Select * from Class as c
                                        Where c.name = @name", new { name = className});
                
                if (pcClass.Count() > 0)
                {
                  var thisClass = pcClass.ElementAt(0);
                  var proficiencyChoices = connection.Query<ProficiencyChoice>(@"Select * from Proficiency_Choices as p
                                                                          Where p.class_id = @id", new { id = thisClass._id});
                  var proficiency = connection.Query<Proficiency>(@"Select * from Proficiencies as p
                                                              Where p.class_id = @id", new { id = thisClass._id});
                  var savingThrows = connection.Query<Saving_Throws>(@"Select * from Saving_Throws as s 
                                                                  Where s.class_id = @id", new { id = thisClass._id});
                  var proficiencyOps = connection.Query<From>(@"Select * from FromP as fp
                                                              Where fp.class_id = @id", new { id = thisClass._id});
                  thisClass.saving_throws = savingThrows.ToList();
                  thisClass.proficiency_choices = proficiencyChoices.ToList();
                  thisClass.proficiency_choices.ElementAt(0).from = proficiencyOps.ToList();
                  thisClass.proficiencies = proficiency.ToList();

                  return thisClass;
                }
                else
                {
                  var thisClass = new Class();
                  return thisClass;
                }
            }
        }

        public bool AddAbilityScores (ABS abs)
        {
            using (var connection = new SqlConnection(conString)) 
            {
                connection.Open();
                var addABS = connection.Execute(@"INSERT INTO [dbo].[PcAs]([strength],[dexterity],[constitution],[wisdom],[intelligence],[charisma],[owner_id])
                                                VALUES(@strength,@dexterity,@constitution,@wisdom,@intelligence,@charisma,@owner_id)", abs);
                return addABS == 1;
            }
        }

        public bool AddSkills (ProficiencySkills skills)
        {
            using (var connection = new SqlConnection(conString)) 
            {
                connection.Open();
                var addSkills = connection.Execute(@"INSERT INTO [dbo].[Proficiency_Skills]([athletics],[acrobatics],[arcana],[animal_Handling]
                                                  ,[deception],[history],[insight],[intimidation],[investigation],[medicine],[nature],[perception]
                                                  ,[performance],[persuasion],[religion],[sleight_of_hand],[stealth],[survival],[owner_id])
                                                  VALUES(@athletics,@acrobatics,@arcana,@animal_Handling,@deception,@history,@insight
                                                  ,@intimidation,@investigation,@medicine,@nature,@perception,@performance,@persuasion
                                                  ,@religion,@sleight_of_hand,@stealth,@survival,@owner_id)", skills) ;

              return addSkills == 1;
            }
        }

        public ABS GetAbilityScores (int id)
        {
            using (var connection = new SqlConnection(conString)) 
            {
                connection.Open();
                var abilityScores = connection.Query<ABS>(@"Select * from PcAs as p 
                                                          Where p.owner_id = @id", new { id = id});
                
                if(abilityScores.Count() > 0)
                {
                 var pcAbs = abilityScores.ElementAt(0);
                 return  pcAbs;
                }
                else
                {
                  return new ABS();
                }
            }
        }

        public ProficiencySkills GetSkills(int id)
        {
          using (var connection = new SqlConnection(conString))
          {
            connection.Open();
            var skills = connection.Query<ProficiencySkills>(@"select * from Proficiency_Skills as p 
                                                              Where p.owner_id = @id", new { id = id });
            if (skills.Count() > 0)
            {
              var pcSkills= skills.ElementAt(0);
              return pcSkills;
            }
            else
            {
               var pcSkills = new ProficiencySkills();
              return pcSkills;
            }
          }
        }

        public ProficiencySkills GetRandomSkills()
        {
          using (var connection = new SqlConnection(conString))
          {
            connection.Open();
            var skills = connection.Query<ProficiencySkills>(@"select Top(1) * from Proficiency_Skills as p 
                                                              ORDER BY RAND()");
            if (skills.Count() > 0)
            {
              var pcSkills= skills.ElementAt(0);
              return pcSkills;
            }
            else
            {
               var pcSkills = new ProficiencySkills();
              return pcSkills;
            }
          }
        }

        public List<PcClass> GetRandomClass()
    {
      using (var connection = new SqlConnection(conString))
      {
        connection.Open();
        var classList = connection.Query<PcClass>(@"select Top(1) * from Class_Name 
                                                              ORDER BY RAND()");

        if (classList.Count() > 0)
        {
          var pcClass = classList.ElementAt(0);
          return classList.ToList();
        }
        else
        {
          var pcClass = new List<PcClass>();
          return pcClass;
        }
      }
    }

        public bool UpdateAbilityScores (ABS abs)
        {
            using(var connection = new SqlConnection(conString)) 
            {
                var result = connection.Execute(@"UPDATE [dbo].[PcAs]
                                                SET [strength] = @strength ,[dexterity] = @dexterity,[constitution] = @constitution,[wisdom] = @wisdom,
                                                    [intelligence] = @intelligence,[charisma] = @charisma
                                                WHERE PcAs.owner_id = @id", new
              {
                id = abs.owner_id,
                strength = abs.strength,
                dexterity = abs.dexterity,
                constitution = abs.constitution,
                wisdom = abs.wisdom,
                intelligence = abs.intelligence,
                charisma = abs.charisma
              });

              return result == 1;
            }
        }

        public bool UpdateSkills (ProficiencySkills skills)
        {
            using (var connection = new SqlConnection(conString))
            {
              var result = connection.Execute(@"UPDATE [dbo].[Proficiency_Skills]
                                                SET [athletics] = @athletics,[acrobatics] = @acrobatics,[arcana] = @arcana,[animal_Handling] = @animal_Handling,
                                                [deception] = @deception,[history] = @history,[insight] = @insight,[intimidation] = @intimidation,
                                                [investigation] = @investigation,[medicine] = @medicine,[nature] = @nature,[perception] = @perception,
                                                [performance] = @performance,[persuasion] = @persuasion,[religion] = @religion,[sleight_of_hand] = @sleight_of_hand,
                                                [stealth] = @stealth,[survival] = @survival
                                              WHERE Proficiency_Skills.owner_id = @owner_id", new
              {
                owner_id = skills.owner_id,
                athletics = skills.athletics,
                acrobatics = skills.acrobatics,
                arcana = skills.arcana,
                animal_Handling = skills.animal_handling,
                deception = skills.deception,
                history = skills.history,
                insight = skills.insight,
                intimidation = skills.intimidation,
                investigation = skills.investigation,
                medicine = skills.medicine,
                nature = skills.nature,
                perception = skills.perception,
                performance = skills.performance,
                persuasion = skills.persuasion,
                religion = skills.religion,
                sleight_of_hand = skills.sleight_of_hand,
                stealth = skills.stealth,
                survival = skills.survival,
              });

              return result == 1;
            }
        }

        public List<Weapons> GetWeapons(int pcId)
        {
            using (var connection = new SqlConnection(conString)) 
            {
                connection.Open();
                List<Weapons> weaponsList = new List<Weapons>();
                var weapons = connection.Query<Weapons>(@"Select * from Weapons as w
                                                        Where w.owner_id = @id", new { id = pcId });
                return weaponsList = weapons.ToList();
            }
        }

        public List<Item> GetItems(int pcId)
        {
            using (var connection = new SqlConnection(conString)) 
            {
                connection.Open();
                List<Item> itemsList = new List<Item>();
                var items = connection.Query<Item>(@"Select * from Items as i
                                                        Where i.owner_id = @id", new { id = pcId });
                return itemsList = items.ToList();
            }
        }
    }
}
