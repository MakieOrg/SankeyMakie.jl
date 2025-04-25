```@meta
CurrentModule = SankeyMakie
```

# Custom node order

Sometimes we want the nodes in a sankey plot layer to be ordered in a specific way.
To achieve this, we may have to override the default layout by specifying `forceorder` keyword.

## Reversing the order

In a panel with several sankey plots, the default layout sometimes picks different node orders between plots.
Instead of manually specifying how to reorder each node, we can simply specify `forceorder = :reverse` to flip the order of the nodes of the plots we'd like to adjust.

The example below shows fictional data for an intervention on nature awareness. 
Before and after the intervention, the experimenters recorded the number of bird species and whether a bird feeder was present in participants' gardens.

```@example nodeorder
using SankeyMakie, CairoMakie, Colors

connections1 = [
	(1, 5, 6),
	(1, 6, 4),
	(1, 7, 2),
	(2, 5, 26),
	(2, 6, 39),
	(2, 7, 22),
	(3, 5, 45),
	(3, 6, 166),
	(3, 7, 152),
	(4, 5, 3),
	(4, 6, 143),
	(4, 7, 432),
]

connections2 = [
	(1, 3, 24),
	(1, 4, 139),
	(2, 3, 8),
	(2, 4, 877),
]

colors = parse.(Colorant, ["#AE0404", "#D13D15", "#EAAF2E", "#74D8BD"])

f = Figure(size = (720, 400), backgroundcolor = RGBf(0.95, 0.95, 0.95))
gl = f[1, 1] = GridLayout()
ax1 = Axis(gl[1, 1])
ax2 = Axis(gl[1, 2])

labels1 = ["0", "1-3", "3-10", "10+", "1-3", "3-10", "10+"]

sankey!(
    ax1, 
	connections1,
    nodelabels = labels1;
	nodecolor = [colors..., colors[2:4]...],
	linkcolor = SankeyMakie.TargetColor(0.2),
)

Label(
    gl[1, 1, Top()],
    "Number of bird species";
    valign = :bottom,
    font = :bold,
    padding = (0, 0, 5, 0),
    fontsize = 16
)
	
hidedecorations!(ax1)

labels2 = repeat(["No", "Yes"], outer=2)

sankey!(
    ax2,
	connections2;
    nodelabels = labels2,
	nodecolor = repeat(colors[[1, 4]], 2),
	linkcolor = SankeyMakie.TargetColor(0.2),
	forceorder = :reverse,
)

Label(
    gl[1, 2, Top()],
    "Bird feeder present";
    valign = :bottom,
    font = :bold,
    padding = (0, 0, 5, 0),
    fontsize = 16
)

hidedecorations!(ax2)
	
f
```

The right sankey plot would have had the `1+` category at the top if we had not specified `forceorder = :reverse`.

## Manual reorder

We could have achieved the same result by manually specifying nodes that should be preceded by other nodes.

```julia
sankey!(
    ax2,
	connections2;
    nodelabels = labels2,
	nodecolor = repeat(colors[[1, 4]], 2),
	linkcolor = SankeyMakie.TargetColor(0.2),
	forceorder = [2 => 1, 4 => 3],
)
```

The vector of pairs `[2 => 1, 4 => 3]` specifies that node `2` should precede node `1`, and that node `4` should precede node `3`.
Note that this approach will only work if the specified nodes are in the same layer.

While this is still feasible for a sankey plot like the one shown above it can turn into a complicated task as the number of nodes grows.
That being said, it offers fine-grained control in situations where the `:reverse` approach does not produce the intended result.
