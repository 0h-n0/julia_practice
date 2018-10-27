using LinearAlgebra

function fib_producer(c::Channel)
    a, b = (0, 1)
    for i = 1:10
        put!(c, b)
        a, b = (b, a+b)
    end
end

chnl = Channel(fib_producer)

try
    println(take!(chnl))
    println(take!(chnl))
    println(take!(chnl))
    println(take!(chnl))
    println(take!(chnl))
    println(take!(chnl))
    println(take!(chnl))
    println(take!(chnl))
    println(take!(chnl))
    println(take!(chnl))
    println(take!(chnl))
catch ex
    println(ex)

end

for n in chnl
    println(n)
end

chnl = @task Channel(fib_producer)

fac(i::Integer) = (i > 1) ? i*fac(i - 1) : 1 
c = Channel(0) 
task = @async foreach(i->put!(c,fac(i)), 1:5) 
bind(c,task) 
for i in c 
   @show i 
end


a = [1, 2, 3]  # column vector
b = [1 2 3]  # row vector

println(b * a)

## multi-dimensional array

a = Array{Int64, 1}

mal = rand(3, 5)
println(mal)

println(ndims(mal))
println(size(mal))
println(size(mal, 1))
println(size(mal, 2))
println(length(mal))

idm = Matrix(1.0*I, 3, 3)
println(idm)
println(idm[1:end, 2])
println(idm[2, :])
idc = idm[2:end, 2:end]
idc .= 0
println(idm)

a = [1 2;3 4]

println(a)
println(a[:]) # matrix to 1-d array
println(a') # transpose
println(a * a') # multiplication
println(inv(a)) # inverase
println(a * inv(a)) # inverase

a = [1 0;1 0]
try
    inv(a)
catch ex
    println(ex)
end

v = [1.,2.,3.]
w = [2.,4.,6.]
println(hcat(v, w))
println([v; w])
println([v w])

jarr = (Array{Int64, 1})[] # jagged array

push!(jarr, [1, 2])
push!(jarr, [1, 2, 3, 4])
push!(jarr, [1, 2, 3])
println(jarr)

println(reshape(1:12, 3, 4))

x = Array{Any}(undef, 2)
x[1] = ones(2)
x[2] = trues(3)
println(x)

d1 = Dict{Int64, Float64}(1 => 4.2, 2 => 5.3)
let
    a1::Int64 = 3
    d1 = Dict{Int64, Float64}(1 => 4.2, 2 => 5.3)
    println(d1)
end

d2 = Dict{Any, Any}("a" => 1, (2, 3) => true)
d3 = Dict(:A => 1, :B => true)
println(d2)
println(d3)

println(d3[:A])
println(d2[(2, 3)])

for k in keys(d3)
    println("$k => $(d3[k])")
end


println(:A in keys(d3))
println(collect(keys(d3)))

