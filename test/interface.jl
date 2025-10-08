module AbstractChainsInterfaceTests

using AbstractChains
using Test

# This is a test mock: it minimally satisfies the AbstractChains interface. We use this to
# test our `test_interface` function, i.e., to ensure that something that satisfies the
# interface passes the test.
# See: https://invenia.github.io/blog/2020/11/06/interfacetesting/
struct MockChain <: AbstractChain
    iter_indices::Vector{Int}
    chain_indices::Vector{Int}
    data::Dict{Symbol,Matrix{Float64}}
end
const MOCK = MockChain(1:10, 1:3, Dict(:param1 => rand(10, 3), :param2 => rand(10, 3)))
AbstractChains.iter_indices(c::MockChain) = c.iter_indices
AbstractChains.chain_indices(c::MockChain) = c.chain_indices
Base.size(c::MockChain) = (AbstractChains.niters(c), AbstractChains.nchains(c))
Base.keys(c::MockChain) = keys(c.data)
AbstractChains.get_data(c::MockChain, k::Symbol) = c.data[k]

@testset "AbstractChains interface" begin
    AbstractChains.test_interface(MOCK)
end

end
