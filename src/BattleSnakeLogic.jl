module BattleSnakeLogic
using HTTP, JSON3, Crayons.Box

function get_info(req::HTTP.Request)
    # This controls your Battlesnake appearance and author permissions.
    # For customization options, see https://docs.battlesnake.com/references/personalization
    # TIP: If you open your Battlesnake URL in browser you should see this data.

    info = Dict(
        "apiversion" => "1",
        "author" => "",  # TODO: Your Battlesnake Username
        "color" => "#888888",  # TODO: Personalize
        "head" => "default",  # TODO: Personalize
        "tail" => "default",  # TODO: Personalize
        "version" => "0.1",  # TODO: Personalize
    )
    println("INFO")
    return HTTP.Response(200, JSON3.write(info))
end

function handle_start(req::HTTP.Request)
    # This function is called everytime your Battlesnake enters a game.
    # It's purely for informational purposes, you don't have to make any decisions here.
    # req.body contains information about the game that's about to be played.

    data = JSON3.read(req.body, Dict)
    println(BOLD(RED_FG("GAME $(data["game"]["id"]) STARTS, game mode: $(data["game"]["ruleset"]["name"])")))
    return HTTP.Response(200, "ok")
end

function handle_move(req::HTTP.Request)
    # This function is called on every turn and is how your Battlesnake decides where to move.
    # Valid moves are "up", "down", "left", or "right".
    # Use the information in 'data' to decide your next move. The 'data' variable can be interacted
    # with as a Julia Dictionary, and contains all of the information about the Battlesnake board
    # for each move of the game.

    data = JSON3.read(req.body, Dict)

    my_snake = data["you"]  # A dictionary describing your snake's position on the board
    my_head = my_snake["head"]  # A dictionary of coordinates like {"x": 0, "y": 0}
    my_body = my_snake["body"]  # A list of coordinate dictionaries like [{"x": 0, "y": 0}, {"x": 1, "y": 0}, {"x": 2, "y": 0}]

    # Uncomment the lines below to see what this data looks like in your output!
    println(GREEN_FG("~~~ Turn: $(data["turn"]) ~~~"))
    # println("All board data this turn: $data")
    # println("My Battlesnake this turn is: $my_snake")
    println("My Battlesnakes head this turn is: $my_head")
    println("My Battlesnakes body this turn is: $my_body")

    # Step 0: Don't allow your Battlesnake to move back on it's own neck.
    possible_moves = ["up", "down", "left", "right"]
    possible_moves = avoid_my_neck(my_body, possible_moves)

    # TODO: Step 1 - Don't hit walls.
    # Use information from `data` and `my_head` to not move beyond the game board.
    # board = data["board"]
    # board_height = ?
    # board_width = ?

    # TODO: Step 2 - Don't hit yourself.
    # Use information from `my_body` to avoid moves that would collide with yourself.

    # TODO: Step 3 - Don't collide with others.
    # Use information from `data` to prevent your Battlesnake from colliding with others.

    # TODO: Step 4 - Find food.
    # Use information in `data` to seek out and find food.
    # food = data["board"]["food"]

    # Choose a random direction from the remaining possible_moves to move in, and then return that move
    move = rand(possible_moves)
    shout = "moving" * move
    # TODO: Explore new strategies for picking a move that are better than random


    response = Dict(
        "move" => move,
        "shout" => shout
    )
    println(YELLOW_FG("..possible moves: $possible_moves"))
    println(YELLOW_FG("..chosen move: $move"))
    return HTTP.Response(200, JSON3.write(response))
end

function handle_end(req::HTTP.Request)
    # This function is called when a game your Battlesnake was in has ended.
    # It's purely for informational purposes, you don't have to make any decisions here.

    data = JSON3.read(req.body, Dict)
    println(BOLD(RED_FG("GAME $(data["game"]["id"]) ENDS")))
    return HTTP.Response(200, "gg")
end


function avoid_my_neck(my_body, possible_moves)
    # my_body: List of dictionaries of x/y coordinates for every segment of a Battlesnake.
    #         e.g. [{"x": 0, "y": 0}, {"x": 1, "y": 0}, {"x": 2, "y": 0}]
    # possible_moves: List of strings. Moves to pick from.
    #         e.g. ["up", "down", "left", "right"]

    # return: The list of remaining possible_moves, with the 'neck' direction removed

    my_head = my_body[1]  # The first body coordinate is always the head
    my_neck = my_body[2]  # The segment of body right after the head is the 'neck'

    if my_neck["x"] < my_head["x"]  # my neck is left of my head
        setdiff!(possible_moves, ["left"])
    elseif my_neck["x"] > my_head["x"]  # my neck is right of my head
        setdiff!(possible_moves, ["right"])
    elseif my_neck["y"] < my_head["y"]  # my neck is below my head
        setdiff!(possible_moves, ["down"])
    elseif my_neck["y"] > my_head["y"]  # my neck is above my head
        setdiff!(possible_moves, ["up"])
    end

    return possible_moves
end

end
