using Documenter
using AbstractChains

makedocs(;
    sitename = "AbstractChainsj.jl",
    modules = [AbstractChains],
    pages = ["index.md"],
    checkdocs = :exports,
    doctest = false,
)
