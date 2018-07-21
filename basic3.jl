# Defining functions

function plus(x, y)
    return x + y
end

println(plus(1, 3))

# you can write 'return'.

function puls2(x, y)
    x+y
end

println(puls2(1, 3))

# multi returns

function varargs(n, m, args...)
    println("$n $m $args")
end


varargs(1, 2, 3, 4, 5, 6)
# => 1 2 (3, 4, 5, 6)

function varargs2(args...)
    println("$args")
end

### "..." is splat operator

x = (3, 4)
varargs2(1, 2, x...)
# => (1, 2, 3, 4)

function floatmult(x::Float64, y::Float64)
    x * y
end

# println(floatmult(3, 4))
# error

println(floatmult(3.0, 4.0))

function multireturn(n, m)
    n*m, div(n, m), n%m
end

x, y, z = multireturn(12, 4)
println("$x, $y, $z")


shortmult(x, y) = x * y
println(shortmult(3.0, 4.0))

# optional positional arguments
f(a, b = 5) = a + b
println(f(3))
# println(f(3, b=3))
# => error
# function f does not accept keyword arguments

# optional keyword arguments
function func1(x; a=1, b=2)
    x + a + b
end

println(func1(1))

# println(func1(1, 2))
# MethodError: no method matching func1(::Int64, ::Int64)

println(func1(1, a=4))

function varargs2(;args...)
    println(args)
end

println(varargs2(3))
# No Error => return nothing

println(varargs2(a=3))
# return Any[(:a, 3)]

# Anonymus functions

function (x)
    x + 2
end

println(x -> x + 2)

function mult(x, y)
    x * y
end

println(typeof(mult))
m = mult
println(m(6, 6))

plus2 = 
    function (x)
        x + 2
    end

println(plus2(2))

plusplus =  (x, y)  -> x + y + 2

println(plusplus(10, 10))

# operator is also a function.
f -> (x,y) = +(x, y)

println(f(3, 4))

# A function can take a function as its argument

function derivative(f, x, dx=0.01)
    d = (f(x + dx) - f(x - dx)) / (2 * dx)
    return d
end

f2 = x -> 2x^2 + 30x + 9

println(derivative(f2, 1, 0.001))

function derivative2(f)
    return function (x)
        h = x == 0 ? sqrt(eps(Float64)) : sqrt(eps(Float64)) * x
        xph = x + h
        dx = xph - x
        f1 = f(xph)
        f0 = f(x)
        return (f1 - f0) / dx
    end
end
        

function counter()
    n = 0
    () -> n += 1, () -> n = 0
end
(addOne, reset) = counter()

println(addOne())
println(addOne())
println(addOne())
println(reset())

# reculisve

sum(n) = n > 1 ? sum(n - 1) + n : n
fib(n) = n < 2 ? n : fib(n-1) + fib(n-2)
println(fib(5))
println(sum(10))

# Map, Filter and List comprehesions

println(map(x -> x*10, [1, 2, 3]))

cubes = map(x -> x^3, 1:5)

println(cubes)

println(map(*, [1, 2, 3], [4, 5, 6]))
println([1, 2, 3] .* [4, 5, 6])
println(append!([1, 2, 3], [4, 5, 6]))

println(map( x-> begin
             if x == 0 return 0
             elseif iseven(x) return 2
             elseif isodd(x) return 1
             end
             end, -3:3))

println(map(-3:3) do x
        if x == 0 return 0
        elseif iseven(x) return 2
        elseif isodd(x) return 1
        end
        end)


println(filter(n -> iseven(n), 1:10))

# list comprehession

arr = Float64[x^2  for x in 1:4]
println(arr)

cubes = [x^3 for x in 1:5]
println(cubes)

mat = [x + y for x in 1:2, y in 1:3]
println(mat)

table10 = [x*y for x=1:10, y=1:10]
println(table10)

arrany = Any[i * 2 for i in 1:5]
println(arrany)


# A list of all the methods is stored in a virtual method
# table (vtable) on the function itself;

# When a function is called, Julica will do a lookup in that vtable
# at runtime to file which concrete method it should call based on
# the types of all its arguments; this is Julia's mechanism of
# multiple dispatch, which neither Python, nor C++ or Fortran
# implements.
f(n, m) = "base case"


f(n, m::Number) = "n is a number"
f(n::Integer, m::Integer) = "n and m are both integers"
f(n::Number, m) = "n is a number"
f(n::Number, m::Number) = "n and m are both numbers"

println(f(1.0, 1::Integer))
# n and m are both numbers

f(n::Float64, m::Integer) = "n is a float and m is an integer"
println(f(1.0, 1::Integer))
# n is a float and m is an integer

# you can see the all version of a fnction
# methods(function_name)
# ex) methods(+)

# you can check which the specfic method is used with the following macro
# @which 2 * 2

# you can alse check which methods are defined for a certain type
# methodswith(String)

# time measure macro

# @time fib(35)
# @elapsed fib(35)
