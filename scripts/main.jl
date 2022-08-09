using Pkg
Pkg.activate("..")

using Revise
using HTTP, Crayons.Box
include("../src/BattleSnakeLogic.jl")

const host = "0.0.0.0"
const port = 8179

const r = HTTP.Router()
HTTP.register!(r, "GET", "/", BattleSnakeLogic.get_info)
HTTP.register!(r, "POST", "/start", BattleSnakeLogic.handle_start)
HTTP.register!(r, "POST", "/move", BattleSnakeLogic.handle_move)
HTTP.register!(r, "POST", "/end", BattleSnakeLogic.handle_end)

println(RED_FG("battlesnake up at http://$host:$port"))
HTTP.serve(r, host, port)
