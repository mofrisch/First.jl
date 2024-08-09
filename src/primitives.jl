

struct Code
    name::String
    xt::Function
    immediate::Bool
end

function doplus()
    pushs!(pops!() + pops!())
end

function doplus1()
    pushs!(pops!() + pops!())
end

function dobye()
    println("Bye!")
end

function dodot()
    if is_empty()
        println("Stack is empty")
        return nothing
    else
        println(top())
        return pops!()
    end
end

function dodotS()
    println(Stack)
end

function dodup()
    pushs!(top())
end

function doColon()
    println("Colon")
    new_entry = word()
    Words[new_entry] = nothing
    last = new_entry
    compile = true
end

function doSemiColon()
    println("SemiColon")
    compile = false
end

Primitives = Dict(
    "+" => Code("doplus", doplus, false),
    "bye" => Code("dobye", dobye, false),
    #"+" => Code("doplus", doplus1, false),
    "." => Code("dodot", dodot, false),
    ".S" => Code("dodotS", dodotS, false),
    "dup" => Code("dodup", dodup, false),
    ":" => Code("doColon", doColon, false),
    ";" => Code("doSemiColon", doSemiColon, true),
    "dbl" => [Code("dup", dodup, false), Code("+", doplus, false)],
)

last = "dbl"

