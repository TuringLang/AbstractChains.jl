module AbstractChainsTestExt

using AbstractChains
using Test

function AbstractChains.test_interface(chn::AbstractChain)
    @testset "Base.size, AbstractChains.niters, AbstractChains.nchains" begin
        @test size(chn) isa NTuple{N,Int} where {N}
        @test AbstractChains.niters(chn) isa Int
        @test AbstractChains.nchains(chn) isa Int
    end

    @testset "Base.keys" begin
        @test collect(keys(chn)) isa AbstractVector
    end

    @testset "AbstractChains.get_data" begin
        for k in keys(chn)
            data = AbstractChains.get_data(chn, k)
            @test data isa AbstractMatrix
            @test size(data) == (AbstractChains.niters(chn), AbstractChains.nchains(chn))
        end
    end

    @testset "AbstractChains.iter_indices" begin
        ii = AbstractChains.iter_indices(chn)
        @test ii isa AbstractVector{<:Integer}
        @test length(ii) == AbstractChains.niters(chn)
    end

    @testset "AbstractChains.chain_indices" begin
        ci = AbstractChains.chain_indices(chn)
        @test ci isa AbstractVector{<:Integer}
        @test length(ci) == AbstractChains.nchains(chn)
    end
end

end # module
