using SankeyMakie
using Documenter, DocumenterVitepress, Literate
using CairoMakie

DocMeta.setdocmeta!(SankeyMakie, :DocTestSetup, :(using SankeyMakie); recursive=true)

makedocs(;
    modules = [SankeyMakie],
    authors = "Julius Krumbiegel <...>, and contributors",
    sitename = "SankeyMakie.jl",
    format = DocumenterVitepress.MarkdownVitepress(;
        repo = "https://github.com/MakieOrg/SankeyMakie.jl",
        devurl = "dev",
        devbranch = "main",
    ),
    pages=[
        "Introduction" => "introduction.md",
        "Custom node order" => "custom_node_order.md",
        "API Reference" => "api.md",
    ],
)

deploydocs(;
    repo = "github.com/MakieOrg/SwarmMakie.jl",
    devbranch = "main",
    push_preview = true,
)
