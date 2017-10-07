using JuMP
using Clp

for x in [1,2,3]
    print(x)
end

m = Model(solver = ClpSolver())


# variables to optimize over
@variable(m, xoa >= 0)
@variable(m, xob >= 0)
@variable(m, xoc >= 0)
@variable(m, xab >= 0)
@variable(m, xad >= 0)
@variable(m, xbc >= 0)
@variable(m, xbd >= 0)
@variable(m, xbe >= 0)
@variable(m, xce >= 0)
@variable(m, xde >= 0)
@variable(m, xdf >= 0)
@variable(m, xef >= 0)

X = [xoa, xob, xoc, xab, xad, xbc, xbd, xce, xde, xdf, xef]

# constants that represent edge weights
coa = 40
cob = 60
coc = 50
cab = 10
cad = 70
cbc = 20
cbd = 55
cbe = 40
cce = 50
cde = 10
cdf = 60
cef = 80

C = [coa, cob, coc, cab, cad, cbc, cbd, cce, cde, cdf, cef]

# each variable is a decision variable, indicating whether we use an edge or not
# thus, the cost is the dot product of the variables and the cost for making that decision (edge weights)
# we want the minimum cost path
@objective(m, Min, dot(X, C))

# Remember that In to node = Out of node 
# we use these to create the constraints
@constraint(m, xoa + xob + xoc == 1)
@constraint(m, xoa - xab - xad == 0)
@constraint(m, xob + xab - xbc - xbd - xbe == 0)
@constraint(m, xoc + xbc - xce == 0)
@constraint(m, xad + xbd - xde - xdf == 0)
@constraint(m,  xbe + xce + xde - xef == 0)
@constraint(m, -xdf - xef == - 1)

# print solution
print(m)
status = solve(m)
println(status)
println(getobjectivevalue(m))

# print out the decisions 
for i in 1:11
    println(getvalue(X[i]))
end 



