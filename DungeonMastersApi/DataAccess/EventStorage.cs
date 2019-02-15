using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DungeonMastersApi.DataAccess
{
  public class EventStorage
  {
    static Random _random = new Random();

    public string randEvent()
    {
      string[] eventList =
      {
        "A door opens", "A fire starts", "A meteor shoots across the sky", "A monster appears", "A screech pierces the air",
        "A storm begins", "A strange star appears in the sky", "A strong gust of wind blows through", "A tremor shakes the ground",
        "Someone experienced deja vu", "Someone gets angry", "Someone glimpses the future", "Someone has a sense of foreboding",
        "Someone has to go to the bathroom", "Something spills or falls to the ground", "Something isn't where it's supposed be",
        "The lights go out", "The sun comes out", "There's a foul smell in the air", "Unexplained magic occurs"
      };

      int eventDex = _random.Next(eventList.Length);

      return eventList[eventDex];
    }
  }
}
