module AbstractChains

"""
    AbstractChains

An abstract type for Markov chains, i.e., a data structure which stores samples
obtained from Markov chain Monte Carlo (MCMC) sampling.

Markov chains should generally have dictionary-like behaviour, where keys are mapped to
matrices of values.
"""
abstract type AbstractChains end

"""
    AbstractChains.get_data(chn, key)

Obtain the data associated with `key` from the `AbstractChains` object `chn`.

This function should return an `AbstractMatrix` where the rows correspond to iterations and
columns correspond to chains.
"""
function get_data end

"""
    AbstractChains.iter_indices(chn)

Obtain the indices of each iteration for the `AbstractChains` object `chn`.

This function should return an `AbstractVector{<:Integer}`.
"""
function iter_indices end

"""
    AbstractChains.chain_indices(chn)

Obtain the indices of each chain in the `AbstractChains` object `chn`.

This function should return an `AbstractVector{<:Integer}`.
"""
function chain_indices end

"""
    AbstractChains.niters(chn)

Obtain the number of iterations in the `AbstractChains` object `chn`.

The default implementation calculates the length of `AbstractChains.iter_indices(chn)`. You
can define your own method if you have a more efficient way of obtaining this information.
"""
niters(c::AbstractChains) = length(iter_indices(c))

"""
    AbstractChains.nchains(chn)

Obtain the number of chains in the `AbstractChains` object `chn`.

The default implementation calculates the length of `AbstractChains.chain_indices(chn)`. You
can define your own method if you have a more efficient way of obtaining this information.
"""
nchains(c::AbstractChains) = length(chain_indices(c))

"""
    AbstractChains.test_interface(chn)

Test that the `AbstractChains` object `chn` implements the required interface.
"""
function test_interface end # Extended in TestExt

export AbstractChains

end # module AbstractChains
