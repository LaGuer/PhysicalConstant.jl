module CODATA2019

using PhysicalConstant, Measurements, Unitful

import Unitful: Ω, A, C, F, J, kg, K, m, mol, N, Pa, s, T
import PhysicalConstant: @constant, @derived_constant

@constant(FineStructureConstant, α, "Fine-structure constant", 7.297_352_5664e-3,
          BigFloat(72_973_525_664)/BigFloat(10_000_000_000_000), Unitful.NoUnits,
          1.7e-12, BigFloat(17)/BigFloat(10_000_000_000_000), "CODATA 2019")

end 
# module CODATA2019
