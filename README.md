# Getting started with [Battlesnake](https://play.battlesnake.com) and [Julia](https://julialang.org)

This is a basic implementation of the [Battlesnake API](https://docs.battlesnake.com/references/api) in [Julia](https://julialang.org) based on the official basic implementation in python [starter-snake-python](https://github.com/BattlesnakeOfficial/starter-snake-python). It's a great starting point for anyone wanting to program their first Battlesnake using Julia.

## Quickstart

The [Quick Start Coding Guide](https://docs.battlesnake.com/guides/getting-started) provides the full set of instructions to customize, register, and create your first games with your Battlesnake! 

### Prerequisites

* A free [Battlesnake Account](https://play.battlesnake.com/?utm_source=github&utm_medium=readme&utm_campaign=python_starter&utm_content=homepage)
* [Julia](https://julialang.org)

### Installation and run (locally)

Eventually you might want to run your Battlesnake server locally for faster testing and debugging. You can do this by installing [Julia](https://julialang.org) and running (tested with *julia 1.7.3*):

```shell
git clone https://github.com/luigiannelli/starter-snake-julia.git
cd starter-snake-julia
julia -e 'using Pkg; Pkg.activate("."); Pkg.instantiate'
cd scripts
julia main.jl
```


---

## Customizing Your Battlesnake

Locate the `get_info` function inside [BattleSnakeLogic.jl](./src/BattleSnakeLogic.jl#L4). You should see a line that looks like this:

```julia
info = Dict(
    "apiversion" => "1",
    "author" => "",  # TODO: Your Battlesnake Username
    "color" => "#888888",  # TODO: Personalize
    "head" => "default",  # TODO: Personalize
    "tail" => "default",  # TODO: Personalize
    "version" => "0.1",  # TODO: Personalize
)
```

This function is called by the game engine periodically to make sure your Battlesnake is healthy, responding correctly, and to determine how your Battlesnake will appear on the game board. See [Battlesnake Personalization](https://docs.battlesnake.com/references/personalization) for how to customize your Battlesnake's appearance using these values.

Whenever you update these values, go to the page for your Battlesnake and select 'Refresh Metadata' from the option menu. This will update your Battlesnake to use your latest configuration and those changes should be reflected in the UI as well as any new games created.

## Changing Behavior

On every turn of each game your Battlesnake receives information about the game board and must decide its next move.

Locate the `handle_move` function inside [BattleSnakeLogic.jl](./src/BattleSnakeLogic.jl#L31). Possible moves are "up", "down", "left", or "right" and initially your Battlesnake will choose a move randomly. Your goal as a developer is to read information sent to you about the game (available in the `data` variable) and decide where your Battlesnake should move next. All your Battlesnake logic lives in [BattleSnakeLogic.jl](./src/BattleSnakeLogic.jl), and this is the code you will want to edit.

See the [Battlesnake Game Rules](https://docs.battlesnake.com/references/rules) for more information on playing the game, moving around the board, and improving your algorithm.

## Playing Battlesnake

### Completing Challenges

If you're looking for the Single Player Mode of Battlesnake, or something to practice with between events, check out [Challenges.](https://docs.battlesnake.com/guides/quick-start-challenges-guide)

### Joining a Battlesnake Arena

Once you've made your Battlesnake behave and survive on its own, you can enter it into the [Global Battlesnake Arena](https://play.battlesnake.com/arena/global) to see how it performs against other Battlesnakes worldwide.

Arenas will regularly create new games and rank Battlesnakes based on their results. They're a good way to get regular feedback on how well your Battlesnake is performing, and a fun way to track your progress as you develop your algorithm.

### Joining a Battlesnake League

Want to get out there to compete and win prizes? Check out the [Quick Start League Guide](https://docs.battlesnake.com/guides/quick-start-league-guide) for information on the how and when of our competitive seasons.

---

## Resources

All documentation is available at [docs.battlesnake.com](https://docs.battlesnake.com), including detailed Guides, API References, and Tips.

You can also join the Battlesnake Developer Community on [Discord](https://play.battlesnake.com/discord?utm_source=github&utm_medium=readme&utm_campaign=python_starter&utm_content=discord). There is a growing community of Battlesnake developers of all skill levels wanting to help everyone succeed and have fun with Battlesnake :)

Check out live Battlesnake events on [Twitch](https://www.twitch.tv/battlesnakeofficial) and see what is happening when on the [Calendar.](https://play.battlesnake.com/calendar?utm_source=github&utm_medium=readme&utm_campaign=python_starter&utm_content=calendar)

Want to contribute to Battlesnake? There is a number of open-source codebases and would love for you to get involved! Check out our page on [Contributing.](https://docs.battlesnake.com/guides/contributing)
