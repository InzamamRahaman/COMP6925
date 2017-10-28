using JuMP
using Cbc



m = Model(solver = CbcSolver())


# specify variables and their ranges
@variable(m, 0 <= me <= 1, Int)
@variable(m, 0 <= ms <= 1, Int)
@variable(m, 0 <= ce <= 1, Int)
@variable(m, 0 <= cs <= 1, Int)
@variable(m, 0 <= de <= 1, Int)
@variable(m, 0 <= ds <= 1, Int)
@variable(m, 0 <= le <= 1, Int)
@variable(m, 0 <= ls <= 1, Int)

eve = [me, ce, de, le]
steve = [ms, cs, ds, ls]
chore = ["Marketing", "Cooking", "Dishwashing", "Laundry"]



# specify the objective function to optimize and whether to minimize or maximize
@objective(m, Min, 
4.5me + 4.9ms + 7.8ce + 7.2cs + 3.6de + 4.3ds + 2.9le + 3.1ls)

# specify the constraints
@constraint(m, ms + cs + ds + ls == 2)
@constraint(m, me + ce + de + le == 2)
@constraint(m, me + ms == 1)
@constraint(m, ce + cs == 1)
@constraint(m, de + ds == 1)
@constraint(m, le + ls == 1)

print(m)

status = solve(m)

# println("Solution status: ", status)

# println("Objective value: ", getobjectivevalue(m))
# println("ms = ", getvalue(ms))
# println("me = ", getvalue(me))
# println("ce = ", getvalue(ce))
# println("cs = ", getvalue(cs))
# println("de = ", getvalue(de))
# println("ds = ", getvalue(ds))
# println("le = ", getvalue(le))
# println("ls = ", getvalue(ls))


println("For a time of ", getobjectivevalue(m), " hours: ")

println("\nEve should do: ")
for e = 1:4
    val = getvalue(eve[e])
    if val == 1
        println(chore[e])
    end
end

println("\nSteve should do:")
for s = 1:4
    val = getvalue(steve[s])
    if val == 1
        println(chore[s])
    end
end
    