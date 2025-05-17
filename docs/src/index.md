````@raw html
---
# https://vitepress.dev/reference/default-theme-home-page
layout: home

hero:
  name: SankeyMakie.jl
  text: 
  tagline: Sankey plots for Makie.jl
  image:
    src: /logo.svg
    alt: SankeyMakie
  actions:
    - theme: brand
      text: Introduction
      link: /introduction
    - theme: alt
      text: View on Github
      link: https://github.com/MakieOrg/SankeyMakie.jl
    - theme: alt
      text: API Reference
      link: /api
---


<p style="margin-bottom:2cm"></p>

<div class="vp-doc" style="width:80%; margin:auto">
````

# What is SankeyMakie.jl?

Sankey plots are used to visualize inflows and outflows between connected nodes.
You specify the connections and their numerical weights and SankeyMakie computes an appropriate layout for you.

```@example
using SankeyMakie, CairoMakie

connections = [
    (1, 2, 1200), (1, 3, 600), (2, 5, 100), (2, 4, 500),
    (2, 9,  300), (2, 6, 200), (4, 7, 50), (4, 8, 100),
]

labels = [
    "Salary", "Net Income", "Tax", "Rent", "Insurance",
    "Car", "Internet", "Heating", "Food",
]

sankey(connections; nodelabels = labels, axis = hidden_axis())
```

````@raw html
</div>
````
