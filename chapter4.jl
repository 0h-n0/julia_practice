var = 7

if var > 10
    println("value is higher 10.")
elseif var < 10
    println("$var is lower 10.")
else
    println("$var is 10.")
end

a = 10
b = 15

z = if a > b a
    else b
    end
println("$z")

z = a > b ? a : b
println("$z")

function sqroot(n::Int)
    n >= 0 || error("n must be non-negative")
    n == 0 && return 0
    sqrt(n)
end

println(sqroot(1))

for n = 1:10
    println(n^3)
end

arr = [x^2 for x in 1:10]
for i = 1:length(arr)
    println("ith $i-th element is $(arr[i])")
end


for (ix, val) in enumerate(arr)
    println("ith $ix-th element is $val")    
end

for n = 1:5, m = 1:5
    println("$n * $m = $(n * m)")
end

while a < b
    println(a)
    a += 1
end

arr = [1, 2, 3, 4]
while !isempty(arr)
    println(pop!(arr), ", ")
end


for n in 1:10 
  if 3 <= n <= 6
    continue # skip current iteration
  end
  println(n)
end
