using First
using Test

@testset "First.jl" begin
    @test First.greet_your_package_name() == "Hello YourPackageName!"
    @test First.greet_your_package_name() != "Hello world!"
end
