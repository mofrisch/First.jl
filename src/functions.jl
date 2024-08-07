# 

using ReplMaker: initrepl

function parse_to_expr(s)
	quote
		Meta.parse($s)
	end
end

Stack = []

Primitives = Dict(
	"+" => "doplus",
	"bye" => "dobye",
	"." => "dodot",
)

function forth(Str::String)
	tokens = split(Str)
	for token in tokens
		# is it a primitive?
		if token in keys(Primitives)
			xt = get_xt(token)
			getfield(First, Symbol(xt))()
			# is it a number?
		else
			num = tryparse(Int, token)
			if num !== nothing
				pushs!(num)
			else
				num = tryparse(Float64, token)
				if num !== nothing
					pushs!(num)
				else
					println("Not found: ", token)
				end
			end
		end
	end
end



function get_xt(name)
	return Primitives[name]
end

function pushs!(x)
	push!(Stack, x)
end

function pops!()
	pop!(Stack)
end

function top()
	return Stack[end]
end

function is_empty()
	return length(Stack) == 0
end

function doplus()
	pushs!(pops!() + pops!())
end

function dobye()
	println("Bye!")
end

function dodot()
	println(top())
end


function init()
	initrepl(parse_to_expr,
	prompt_text = "Expr> ",
	prompt_color = :blue,
	start_key = ')',
	mode_name = "Expr_mode")
end

# init()

