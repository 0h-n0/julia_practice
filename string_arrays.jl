using Statistics

str = "The Gold and Blue Loses a Bit of Its Luster"


nchars = length(str)

println("The headline counts $nchars characters")
str2 = replace(str, "Blue" => "Red")
println(str)
println(str2)

println("Here are the characters at position 25 to 50:")
subs = str[25:30]
println("-$(lowercase(subs))-")
println("Here are the characters:")

for c in str
    println(c)
end

arr = split(str, ' ')
show(arr)

nwords = length(arr)
println("The headline counts $nwords words")

println("Here are all the words:")
for word in arr
    println(word)
end

arr[4] = "Red"
show(arr)
println("Convert back to sentence:")
nstr = join(arr, ' ')
println(nstr)
println("arrays: calculate sum, mean and standard deviation ")
arr = collect(1:100)
typeof(arr)
println(sum(arr))
println(mean(arr))



function test(argv...; kwargs...)
    println(argv)
    println(kwargs)
end
test(1, 2, k=1)

function (x)
    x + 2
end
c = x -> x + 2
println(c(2))

arr = Float64[x^2 for x in 1:4]
println(arr)
