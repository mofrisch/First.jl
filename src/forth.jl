# 


compile = false
Stack = []
Tib = []

function find(name)
    if name in keys(Words)
        return Words[name]
    else
        return nothing
    end
end

function exec(code)
    if code.xt === nothing
        return
    end
    return code.xt()
end



function forth(Str::String)
    global Tib = split(Str)
    token = word()
    result = nothing
    while token !== nothing
        # search

        # is it a primitive?
        code = find(token)
        if code !== nothing
            if compile && !code.immediate
                Words[last] = code
            else
                result = exec(code)
            end

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
    return result
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



function clearStack()
    global Stack = []
end

forth("1 2 + .")




