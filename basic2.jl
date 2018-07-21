array = Any[100, 25, "ABC"]

println(array)

array = [0, 1, 3, 4, 5]
println(array)

## Caution! Array's index start from 1, like a fortran.

println(array[1])
# => 0
# println(array[0])
# => Error

arr2 = Array{Int64}(5)
println(arr2)

arr3 = Array{Float64}(0)

println(arr3)
push!(arr3, 1.0)
push!(arr3, 2.0)
push!(arr3, 3.0)
pop!(arr3)
# A function whose name ends in a ! changes its first argument.

println(arr3)

arr4 = [1:7]

println(arr4)
println(length(arr4))
for i in arr4[1]
    println(i)
end


println(length(arr4))
println(length(arr4[1]))
println(eltype(arr4))
println(ndims(arr4))
println(join(arr4[1], ", "))
println(arr4[1][4:end])

println(zeros(10))
println(ones(10))
println(linspace(10, 100, 100))

tensor = Array{Int64}(3, 3, 3)

println(fill!(tensor, 1))

v1 = rand(Int32, 5)
println(v1)

arry = Array{Float32}(10)

fill!(arry, 1)
append!(arry, 10)
println(arry)
shift!(arry)
println(arry)
unshift!(arry, 42)
println(arry)

# to remove an element at a certain index
splice!(arry, 1)
println(arry)

#
println(in(1, arry))

unshift!(arry, 100)
println(sort(arry))
println(arry)
println(sort!(arry))
println(arry)

# elepent wise operation '.'

a = [1, 2, 3]
b = [4, 5, 6]
# concatinate
println(a+b)
# elemetwise
println(a .* b)
println(dot(a, b))
b = copy(a)
c = deepcopy(a)

# how to convert an array of chars to string
str = ['a', 'b', 'c']
println(str...)
# splice operator

