using Documenter
using AbstractChains

makedocs(;
    sitename = "AbstractChains.jl",
    modules = [AbstractChains],
    pages = ["index.md"],
    checkdocs = :exports,
    doctest = false,
)
