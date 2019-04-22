using Documenter, PhysicalConstant
using FileIO

makedocs(
    modules = [PhysicalConstant],
    clean = false,
    format = :html,
    sitename = "PhysicalConstant.jl",
    authors = "La Guer.",
    pages    = Any[
        "Introduction" => "index.md",
        "Installation" => "installation.md",
        "Usage"        => "usage.md",
        "Examples"     => "examples.md",
        "Performance"  => "performance.md",
        "Development"  => "todo.md",
        "Appendix"     => "appendix.md",
    ]
)

deploydocs(
    julia = "nightly",
    repo = "github.com/LaGuer/PhysicalConstant.jl.git",
    target = "build",
    deps = Deps.pip("Tornado>=4.0.0,<5.0.0", "mkdocs==0.17.5", "mkdocs-material==2.9.4", "python-markdown-math"),
    make = nothing,
)
