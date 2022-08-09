using Pkg
Pkg.activate("..")

using HTTP, Crayons.Box
include("../src/BattleSnakeLogic.jl")

println(RED_FG("warming up.."))
BattleSnakeLogic.get_info(HTTP.Request("", ""))
json_body = read("./sample_move_request.json")
BattleSnakeLogic.handle_start(HTTP.Request("", "", [], json_body))
BattleSnakeLogic.handle_move(HTTP.Request("", "", [], json_body))
BattleSnakeLogic.handle_end(HTTP.Request("", "", [], json_body))
println(RED_FG("..done"))
