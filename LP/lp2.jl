using JuMP
using Clp

m = Model(solver = ClpSolver())

# specify variables and their ranges
@variable(m, x1 >= 0)
@variable(m, x2 >= 0)

# specify the objective function to optimize and whether to minimize or maximize
@objective(m, Min, 0.4x1 + 0.5x2)

# specify the constraints
@constraint(m, 0.3x1 + 0.1x2 <= 2.7)
@constraint(m, 0.5x1 + 0.5x2 == 6)
@constraint(m, 0.6x1 + 0.4x2 >= 6)

print(m)

status = solve(m)

println("Solution status: ", status)

println("Objective value: ", getobjectivevalue(m))
println("x1 = ", getvalue(x1))
println("x2 = ", getvalue(x2))
