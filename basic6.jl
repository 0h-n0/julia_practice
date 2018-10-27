try
    a = (31 + 42)::Float64
catch ex
    println(ex)
end
a = (31.0 + 42.0)::Float64

println(a)
println(convert(Int64, 7.0))
println(Int64(7.0))

try
    Int64(7.01)
catch InexactError
    println(InexactError)
end

try
    Int64("cv")
catch MethodError
    println(MethodError)
end
