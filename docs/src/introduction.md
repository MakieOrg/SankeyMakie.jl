```@meta
CurrentModule = SankeyMakie
```

# SankeyMakie

`SankeyMakie` implements sankey plots in Makie. These are flow diagrams which emphasize the change from one state or timepoint to another. In sankey plots, the width of a flow is proportional to its size in terms of the measured quantity (e.g., persons, money).

The flows are called links and the states they connect are called nodes.

The main entry point to the package is the [`sankey`](@ref) recipe, which takes a vector of `(source, target, weight)` tuples as input.

## Quick start

Here's a quick example to get you started:

```@example quickstart
using SankeyMakie, CairoMakie
connections = [
    (1, 2, 1100),
    (1, 3, 400),
    (2, 5, 300),
    (2, 4, 500),
    (2, 6, 300),
    (4, 7, 400),
    (4, 8, 100),
]

labels = [
    "Salary",
    "Income",
    "Tax",
    "Rent",
    "Insurance",
    "Car",
    "Internet",
    "Heating",
]

fig, ax, plt = sankey(
  connections; 
  nodelabels = labels,
  nodecolor = Makie.to_colormap(:tab20)[1:length(labels)], 
  linkcolor = SankeyMakie.TargetColor(0.2)
)

hidedecorations!(ax)
hidespines!(ax)

fig
```
