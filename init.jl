
using First
using ReplMaker

function parse_to_expr(s)
	forth(s)
end

initrepl(parse_to_expr,
	prompt_text = "ϕ> ",
	prompt_color = :blue,
	start_key = '!',
	mode_name = "Expr_mode")


