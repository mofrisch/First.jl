using First


@testitem "First tests" begin
    First.clearStack()
    @test First.forth("1 2 + .") == 3
    @test First.forth("1") === nothing
    @test First.forth(".") == 1

end
