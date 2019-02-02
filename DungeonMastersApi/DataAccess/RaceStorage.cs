using _5eScraper.Models;
using Dapper;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace DungeonMastersApi.DataAccess
{
  public class RaceStorage
  {
    private readonly string conString;

    public RaceStorage(IConfiguration configuration)
    {
      conString = configuration.GetSection("ConnectionString").Value;
    }

    public bool AddRace(Race race)
    {
      using (var connection = new SqlConnection(conString))
      {
        connection.Open();
        var result = connection.Execute(@"INSERT INTO [dbo].[Race]([index],[name],[speed],[alignment],[age],[size],[size_description],[language_description],[url])
                                            VALUES (@index,@name,@speed,@alignment,@age,@size,@size_description,@language_description,@url)", race);

        return result == 1;
      }
    }

    public IEnumerable<Race> GetRace(int raceId, string race)
    {
      var raceString = $"stockData{race}";
      using (var connection = new SqlConnection(conString))
      {
        connection.Open();
        var result = connection.Query<Race>(@"Select * 
                                            from Race as r
                                            where r.race_id = @id  and r.firebaseId = @raceString ", new { id = raceId, raceString = raceString});

        var languages = connection.Query<Language>(@"Select * 
                                               from Language as l
                                               where l.firebaseId = @raceString", new { raceString = raceString});

        var traits = connection.Query<Trait>(@"Select * 
                                            from Trait as t
                                            where t.firebaseId = @raceString", new { raceString = raceString});

        var subraces = connection.Query<Subrace>(@"Select *
                                                 from Subrace as sb
                                                 where sb.firebaseId = @raceString", new { raceString = raceString});

        var proficiencies = connection.Query<StartingProficiency>(@"Select *
                                                                  from Starting_proficiency as sp
                                                                  where sp.firebaseId = @raceString", new { raceString = raceString});

        result.ElementAt(0).languages = languages.ToList();
        result.ElementAt(0).traits = traits.ToList();
        result.ElementAt(0).subraces = subraces.ToList();
        result.ElementAt(0).starting_proficiencies = proficiencies.ToList();

        return result;
      }
    }

    public bool UpdateRace(string firebaseId, Race race)
    {
      var languages =  race.languages;
      var traits = race.traits;
      var subraces = race.subraces;
      var starting_proficiencies = race.starting_proficiencies;

      using (var connection = new SqlConnection(conString))
      {
        connection.Open();
        var result = connection.Execute(@"UPDATE [dbo].[Race]
                                        SET [index] = @index,[name] = @name,[speed] = @speed,[alignment] = @alignment,[age] = @age,
                                        [size] = @size,[size_description] = @size_description,[language_description] = @language_description,
                                        [url] = @url
                                        WHERE Race.firebaseId = @firebaseId", new
        {
          firebaseId,
          index = race.index,
          name = race.name,
          speed = race.speed,
          alignment = race.alignment,
          age = race.age,
          size = race.size,
          size_description = race.size_description,
          language_description = race.language_description,
          url = race.url
        });

        foreach (Language language in languages)
        {
          connection.Execute(@"UPDATE [dbo].[Language]
                             SET [name] = @name,[url] = @url
                             WHERE Language.firebaseId = @firebaseId and Language.id = @id", new { name = language.name, url = language.url, firebaseId = firebaseId, id = language.id });
        }

        foreach (Trait trait in traits)
        {
          connection.Execute(@"UPDATE [dbo].[Trait]
                             SET [name] = @name,[url] = @url
                             WHERE Trait.firebaseId = @firebaseId", new { name = trait.name, url = trait.url, firebaseId = firebaseId, id = trait.id });
        }

        foreach (Subrace subrace in subraces)
        {
          connection.Execute(@"UPDATE [dbo].[Subrace]
                             SET [name] = @name,[url] = @url
                             WHERE Subrace.firebaseId = @firebaseId", new { name = subrace.name, url = subrace.url, firebaseId = firebaseId, id = subrace.id });
        }

        foreach (StartingProficiency startingProficiency in starting_proficiencies)
        {
          connection.Execute(@"UPDATE [dbo].[Starting_proficiency]
                             SET [name] = @name,[url] = @url
                             WHERE Starting_proficiency.firebaseId = @firebaseId", new { name = startingProficiency.name, url = startingProficiency.url, firebaseId = firebaseId, id = startingProficiency.id });
        }

        return result == 1;
      }
    }
  }
}
