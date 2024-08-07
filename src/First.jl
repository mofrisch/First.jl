module First

export forth
export Stack

include("functions.jl")

using ReplMaker: initrepl
using REPL: active_repl

function parse_to_expr(s)
	quote
		Meta.parse($s)
	end
end

function __init__()
	initrepl(parse_to_expr,
		prompt_text = "Expr> ",
		prompt_color = :blue,
		start_key = ')',
		mode_name = "Expr_mode")
end

__init__()

end # module
