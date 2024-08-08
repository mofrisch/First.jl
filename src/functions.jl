# 

Stack = []

Primitives = Dict(
	"+" => "doplus!",
	"bye" => "dobye",
	"." => "dodot!",
	".S" => "dodotS",
	"dup" => "dodup!",
	":" => "doColon",
	";" => "doSemiColon",
)

Words = Dict()

Tib = []

function forth(Str::String)
	global Tib = split(Str)
	token = word()
	while token !== nothing
		# search

		# is it a primitive?
		if token in keys(Primitives)
			xt = get_xt(token)
			getfield(First, Symbol(xt))()
			# is it a number?
		else
			# is it an integer?
			num = tryparse(Int, token)
			if num !== nothing
				pushs!(num)
				# is it a float?
			else
				num = tryparse(Float64, token)
				if num !== nothing
					pushs!(num)
					# giving up
				else
					println("Not found: ", token)
				end
			end
		end
		token = word()
	end
end


function word()
	# read a word from the input
	# and return it
	if length(Tib) == 0
		return nothing
	end
	return popfirst!(Tib)
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

function doplus!()
	pushs!(pops!() + pops!())
end

function dobye()
	println("Bye!")
end

function dodot!()
	if is_empty()
		println("Stack is empty")
	else
		println(pops!())
	end
end

function dodotS()
	println(Stack)
end

function dodup!()
	pushs!(top())
end

function doColon()
	println("Colon")
	new_entry = word()
	commands = []
	while true
		if(word() == ";")
			break
		end
		push!(commands, word())
		if commands[end] == ";"
			Words[new_entry] = commands
			break
		end
	end
end

function doSemiColon()
	println("SemiColon")
end

forth("1 2 + .")




