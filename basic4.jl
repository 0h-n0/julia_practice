const x = 1.0
y = 1.0

function scopetest()
    println(x)
    y::Float64 = 1.0
end

scopetest()

println(y)

arr = [x^2 for x in 1:10]

for i = 1:length(arr)
    println("$(arr[i])")
end

for (ix, val) in enumerate(arr)
    println("$ix => $val")
end

for n = 1:5, m = 1:5
    println("$n * $m = $(n * m)")
end

arr = rand(1:10, 10)
println(arr)


a = []
try
    pop!(a)
catch ex
    println(typeof(ex))
    println(ex)
end

try
    global f = open("README.md")
catch ex
finally
    close(f)
end

try
    open("README.md", "r") do f
        k = 0
        while(!eof(f))
            a = readline(f)
            println(a)
            k += 1
        end
        println("\nNumber of lines in file: $k")
    end
catch ex
finally
    close(f)
end


anon = Array{Any}(undef, 2)
for i = 1:2
    anon[i] = ()-> println(i)
    i += 1
end

anon[1]()
anon[2]()


anon = Array{Any}(undef, 2)
for i = 1:2
    let i = i
        anon[i] = ()-> println(i)
    end
end

anon[1]()
anon[2]()
