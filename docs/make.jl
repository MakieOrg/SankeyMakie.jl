using SankeyMakie
using Documenter, DocumenterVitepress, Literate
using CairoMakie

DocMeta.setdocmeta!(SankeyMakie, :DocTestSetup, :(using SankeyMakie); recursive=true)

is_ci() = get(ENV, "CI", "false") == "true"

makedocs(;
    modules=[SankeyMakie],
    authors="Julius Krumbiegel <...>, and contributors",
    sitename="SankeyMakie.jl",
    format=DocumenterVitepress.MarkdownVitepress(;
        repo = "https://github.com/MakieOrg/SankeyMakie.jl",
        devurl = "dev",
        devbranch = "main",
        (is_ci() ? (;) : (; deploy_url = ""))...,
    ),
    #pages=[
    #    "Introduction" => "introduction.md",
    #    "Algorithms" => "algorithms.md",
    #    "Gutters" => "gutters.md",
    #    "Examples" => [
    #        "examples/examples.md",
    #        "Nonlinear scales" => "examples/scales.md",
    #        "Unconventional use" => "examples/unconventional.md"
    #    ],
    #    "API Reference" => "api.md",
    #    "Source code" => literate_pages,
    #],
    warnonly = !is_ci(),
)

deploydocs(;
    repo="github.com/MakieOrg/SwarmMakie.jl",
    devbranch="main",
    push_preview = true,
)