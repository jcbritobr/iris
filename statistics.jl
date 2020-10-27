using Plots
using CSV

# load iris dataset
iris_df = CSV.read("../../datasets/iris.csv")

# show symbols
names(iris_df)

# select data from setosa
setosa_df = iris_df[iris_df[:species] .== "setosa", :]
virginica_df = iris_df[iris_df[:species] .== "virginica", :]
versicolor_df = iris_df[iris_df[:species] .== "versicolor", :]

function plot_histogram(data, title::String, filename::String)
    sepal_length_hist = histogram(data.sepal_length, label=title * " Sepal Lenght", bins=100, title=title * " Sepal Lenght Histogram");
    sepal_width_hist = histogram(data.sepal_width, label=title * " Sepal Width", bins=100, title=title * " Sepal Width Histogram");
    petal_length_hist = histogram(data.petal_length, label=title * " Petal Lenght", bins=100, title=title * " Petal Lenght Histogram");
    petal_width_hist = histogram(data.petal_width, label=title * " Petal Width", bins=100, title=title * " Petal Width Histogram");
    plot(sepal_length_hist, sepal_width_hist, petal_length_hist, petal_width_hist, size=(700, 500), legend=false);
    savefig(filename);
end

# build histogram for setosa species
plot_histogram(setosa_df, "Setosa", "setosa_hist.png")

# build histogram for virginica species
plot_histogram(virginica_df, "Virginica", "virginica_hist.png")

# build histogram for versicolor species
plot_histogram(versicolor_df, "Versicolor", "versicolor_hist.png")