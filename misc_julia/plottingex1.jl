# library for plotting
# NB: Can take a while to load (>= 30 secs)
using Gadfly

# function to plot
function f(x)
    return x^2 - 3x + 4
end 

# helper function to compute the function for the specified range and store it in an array
# the generated array is then returned 
function compute_values(start, stop, step, f)
    arr = Float32[] 
    for x in start:step:stop
        y = f(x)
        push!(arr, y)
    end 
    return arr 
end

# Helper function to plot the arrays
function plot_array(x, y, filename="plot.png", xlabel='x', ylabel='y', plot_title='Plot of f(x)')
    with_background = Theme(background_color="white")
    Gadfly.push_theme(with_background)
    plot_of_f = plot(x=x, y=y, Geom.line)
    img = PNG(filename, 6inch, 4inch)
    draw(img, plot_of_f)
    Gadfly.pop_theme()
end 

# Main function 
function main()
    start = 0
    step = 10
    stop = 100 
    y = compute_values(start, stop, step, f)
    x = Array(start:step:stop)
    println(length(x))
    println(length(y))
    plot_array(x, y)
end

main()




