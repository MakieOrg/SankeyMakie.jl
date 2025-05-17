using SankeyMakie
using Documenter
using DocumenterVitepress
using CairoMakie

DocMeta.setdocmeta!(SankeyMakie, :DocTestSetup, :(using SankeyMakie); recursive=true)

makedocs(;
    modules = [SankeyMakie],
    authors = "Julius Krumbiegel and contributors",
    sitename = "SankeyMakie.jl",
    format = DocumenterVitepress.MarkdownVitepress(;
        repo = "https://github.com/MakieOrg/SankeyMakie.jl",
        devurl = "dev",
        devbranch = "main",
    ),
    pages=[
        "Home" => "index.md",
        "Reference" => "reference.md",
        "api.md",
    ],
    pagesonly = true,
)

DocumenterVitepress.deploydocs(;
    repo = "github.com/MakieOrg/SwarmMakie.jl",
    devbranch = "main",
    push_preview = true,
)
