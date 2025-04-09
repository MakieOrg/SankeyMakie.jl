````@raw html
---
# https://vitepress.dev/reference/default-theme-home-page
layout: home

hero:
  name: SankeyMakie.jl
  text: 
  tagline: Sankey plots for Makie.jl
  image:
    src: /logo.png
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

features:
  - icon: <img width="64" height="64" src="https://rawcdn.githack.com/JuliaLang/julia-logo-graphics/f3a09eb033b653970c5b8412e7755e3c7d78db9e/images/juliadots.iconset/icon_512x512.png" alt="Julia code"/>
    title: Pure Julia code
    details: Fast, understandable, extensible functions
    link: /introduction
  - icon: <img width="64" height="64" src="https://fredrikekre.github.io/Literate.jl/v2/assets/logo.png" />
    title: Literate programming
    details: Documented source code with examples!
    link: /source/methods/clipping/cut
  - icon: <img width="64" height="64" src="https://rawcdn.githack.com/JuliaGeo/juliageo.github.io/4788480c2a5f7ae36df67a4b142e3a963024ac91/img/juliageo.svg" />
    title: Full integration with Makie
    details: Use the powerful layouting of Makie.jl!
    link: https://docs.makie.org/stable/
---


<p style="margin-bottom:2cm"></p>

<div class="vp-doc" style="width:80%; margin:auto">
````

# What is SankeyMakie.jl?

SankeyMakie makes sankey plots for Makie through the `sankey` recipe.

## Quick start

The entry point to this package is the `sankey` recipe, which accepts input as a vector of `(source, target, weight)` tuples.

```@example
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

fig, ax, plt = sankey(connections; nodelabels=labels)

hidedecorations!(ax)
hidespines!(ax)

fig
```

````@raw html
</div>
````
