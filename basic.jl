include("hello.jl")

# $ # package update command
# $ Pkg.update()

# $ # install package command
# $ Pkg.add("hogehoge")

# run julia via ipython-notebook
# $ ipython notebook --profile julia

for arg in ARGS
    println(arg)
end

# you can see native codes
# code_llvm(f, (Int64,))
# code_native(f, (Int64,))
# code_native(f, (Float64,))

# Julia is a strongly-typed language
# And alose dynamically-typed language
#=
x = "string"
y = 1
z = x + y
# -> Error

x = 2
y = 1
z = x + y
=#

hello2()

# the following code emit error
# type declarations on global variables are not yet supported

#=
X::Int64 = 3
=#

function test()
    # OK
    x::Int64 = 3
    println()    
    println(x)
end
test()

#= ## Most Important Idea ##
!!! Julia uses functional semantics !!
So, We write "method(object)" instend of object.method().
=#

x = 3
println(typeof(x))

if isa("ABC", String)
    println("ABC is a String")
end

# a = int64(3.14)
# don't work ...

println(typemin(Int64))
println(typemax(Int64))
println(typemin(Int8))
println(typemax(Int8))
println(typemin(Float16))
println(typemax(Float16))

# BigFloat and BigInt type for arbitary-precision floating numbers

a = 3
println(a ^ 3)
b = 5
c = 1
if (0 < a < 50 && b == 5) || c != 1
    println("in if-expression")    
    println(a)
end


println(round(3.14))
println(round(Integer, 3.14))

a = 1; b = 2; c = 3; d = 4
a, b = c, d

println(0.1+0.2 == 0.3)
# => false
# intorducing a small round off error


println(3\6)
# you don't use Yen mark insted of \
# emacs setting
# (define-key global-map [?¥] [?\\])


# n++
# n--
# doesn't exist

const HELLO = 1

println(HELLO)

# String
# you can use UTF8 charactor as a variable.

変数 = "hensuu"
println(変数)

my_string = "one"

for c in my_string
    println(c)
end

println('A' == "A")
# => false

# some build-in functions
println(search("abc", "a"))
println(replace("abc", "a", "c"))
println(split("Hello, World", ",")[1])

# formatting numbers and strings

@printf("hello, %s ¥n", "hoge")
# This '@' represents macro.


println(VERSION)

## Regular expressions

email_pattern = r".+@.+"
input = "hoge.huga@gmail.com"
println(ismatch(email_pattern, input))

email_pattern = r"(.+)@(.+)"
m = match(email_pattern, input)
println(m.captures)


visa = r"^(?:4[0-9]{12}(?:[0-9]{3})?)$"
input = "4457418557635128"

if ismatch(visa, input)
    println("creadit card found")
    m = match(visa, input)
    println(m.match)
    println(m.offset)
    println(m.offsets)
end

# ismatch returns 'nothing', when a target string don't contain flagment.

str = "The sky is blue"
reg = r"[\w]\{3,}"

r = matchall(reg, str)
println(r)
println("")

iter = eachmatch(reg, str)

for i in iter
    println("$(i.match)")
end

for i in 1:2:9
    println(i)
end

