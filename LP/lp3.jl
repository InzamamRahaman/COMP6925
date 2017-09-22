using JuMP
using Clp
#using Ipopt

#m = Model(solver = ClpSolver())
#m = Model(solver = IpoptSolver())

# specify variables and their ranges
@variable(m, x1 >= 0)
@variable(m, x2 >= 0)
@variable(m, x3 >= 0)
@variable(m, x4 >= 0)
@variable(m, x5 >= 0)
@variable(m, x6 >= 0)
@variable(m, x7 >= 0)
@variable(m, x8 >= 0)
@variable(m, x9 >= 0)

# specify the objective function to optimize and whether to minimize or maximize
@objective(m, Max, 1000(x1 + x2 + x3) + 750(x4 + x5 + x6) + 250(x7 + x8 + x9))

# specify the constaints
@constraint(m, x1 + x4 + x7 <= 400)
@constraint(m, x2 + x5 + x8 <= 600)
@constraint(m, x3 + x6 + x9 <= 300)


@constraint(m, 3x1 + 2x4 + x7 <= 600)
@constraint(m, 3x2 + 2x5 + x8 <= 800)
@constraint(m, 3x3 + 2x6 + x9 <= 375)

@constraint(m, x1 + x2 + x3 <= 600)
@constraint(m, x4 + x5 + x6 <= 500)
@constraint(m, x7 + x8 + x9 <= 325)

@constraint(m, 3(x1 +  x4 +  x7) -  2(x2 +  x5 + x8) ==  0)
@constraint(m, (x2 +  x5 +  x8) -  2(x3 +  x6 + x9) ==  0)
@constraint(m, (x2 + x5 +  x8) - 2(x3 +  x6 +  x9)  ==  0)

print(m)

status = solve(m)

println("Solution status: ", status)

println("Objective value: ", getobjectivevalue(m))
println("x1 = ", getvalue(x1))
println("x2 = ", getvalue(x2))
println("x3 = ", getvalue(x3))
println("x4 = ", getvalue(x4))
println("x5 = ", getvalue(x5))
println("x6 = ", getvalue(x6))
println("x7 = ", getvalue(x7))
println("x8 = ", getvalue(x8))
println("x9 = ", getvalue(x9))