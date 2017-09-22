using JuMP
using Clp

m = Model(solver = ClpSolver())

# specify variables and their ranges
@variable(m, 0 <= x1 <= 1)
@variable(m, 0 <= x2 <= 1)
@variable(m, 0 <= x3 <= 1)
@variable(m, 0 <= x4 <= 1)
@variable(m, 0 <= x5 <= 1)
@variable(m, 0 <= x6 <= 1)

# specify the objective function
@objective(m, Min, 8x1 + 10x2 + 7x3 + 6x4 + 11x5 + 9x6)

# specify the constraints
@constraint(m, 12x1 + 9x2 + 25x3 + 20x4 + 17x5 + 13x6 >= 60)
@constraint(m, 35x1 + 42x2 + 18x3 + 31x4 +  56x5 +  49x6 >= 150)
@constraint(m, 37x1 + 53x2 + 28x3 + 24x4  + 29x5 + 20x6 >= 125)


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
