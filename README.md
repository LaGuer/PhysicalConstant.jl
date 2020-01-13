# PhysicalConstant.jl

| **Documentation**                       |  **Supported OS and Julia Version**   | **Build Status**                          | **Code Coverage**               |
|:---------------------------------------:|:-------------------------------------:|:-----------------------------------------:|:-------------------------------:|
| [![][docs-stable-img]][docs-stable-url] |[osx][Julia 0.7][Julia 1.0][Julia 1.3] | [![Build Status][travis-img]][travis-url] | [![][coveral-img]][coveral-url] |
| [![][docs-latest-img]][docs-latest-url] |[linux][Julia 0.7][Julia 1.0][Julia1.3]| [![Build Status][appvey-img]][appvey-url] | [![][codecov-img]][codecov-url] |
| [![][docs-latest-img]][docs-latest-url] |[windows][Julia0.7][Julia1.0][Julia1.3]| [![Build Status][appvey-img]][appvey-url] | [![][codecov-img]][codecov-url] |

[![codecov](https://codecov.io/gh/LaGuer/PhysicalConstant.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/LaGuer/PhysicalConstant.jl)

[![Coverage Status](https://coveralls.io/repos/github/LaGuer/PhysicalConstant.jl/badge.svg?branch=master)](https://coveralls.io/github/LaGuer/PhysicalConstant.jl?branch=master)

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/LaGuer/PhysicalConstant.jl/master?urlpath=lab/tree/PhysicalConstant.ipynb)

Introduction
------------

`PhysicalConstant.jl` provides common physical constants.  They are defined as
`Constant` objects, which can be turned into `Quantity` objects (from
[`Unitful.jl`](https://github.com/ajkeller34/Unitful.jl) package) or
`Measurement` objects (from
[`Measurements.jl`](https://github.com/JuliaPhysics/Measurements.jl) package) at
request.

Constants are grouped into different submodules, so that the user can choose
different datasets as needed.  Currently, only 2019 edition based on 26th CGPM and the anticipated
[CODATA](https://physics.nist.gov/cuu/Constants/) recommended values of the
fundamental physical constants is provided.

Installation
------------

`Measurements.jl` is available for Julia 0.7 and later versions, and can be
installed with
[Julia built-in package manager](http://docs.julialang.org/en/stable/manual/packages/).
In a Julia session run the command

```julia
pkg> clone https://github.com/laguer/PhysicalConstant.jl
```

```julia
pkg> build PhysicalConstant
```


Usage
-----

You can load the package as usual with `using PhysicalConstant` but this module
does not provide anything useful for the end-users.  You most probably want to
directly load the submodule with the dataset you are interested in.  For
example, for CODATA 2019 load `PhysicalConstant.CODATA2019`:

```julia
julia> using PhysicalConstant.CODATA2019

julia> C
Gravitational velocity in vacuum (C)
Value                         = 3.6993e44 m s^-1 
Standard uncertainty          = (exact)
Relative standard uncertainty = (exact)
Reference                     = Francis M. Sanchez

julia> Gg
Newtonian constant of gravitation (Gg)
Value                         = 6.67408e-11 m^3 kg^-1 s^-2
Standard uncertainty          = 3.1e-15 m^3 kg^-1 s^-2
Relative standard uncertainty = 4.6e-5
Reference                     = CODATA 2019

julia> Gg
Newtonian constant of gravitation (Gg)
Value                         = 6.67408e-11 m^3 kg^-1 s^-2
Standard uncertainty          = 3.1e-15 m^3 kg^-1 s^-2
Relative standard uncertainty = 4.6e-5
Reference                     = CODATA 2019
```

`C` and `Gg` are two of the new `Constant`s defined in the
`PhysicalConstant.CODATA2019` module, the full list of available constants is
given below.

You can turn a `Constant` into a `Quantity` object, with physical units, by
using `float(x)`:

```julia
julia> float(Float32(inv(big(α))))
137.036f0
```

You can optionally specify the floating-point precision of the resulting number,
this package takes care of keeping the value accurate also with `BigFloat`:

```julia
julia> float(Float32, ε_0)
8.854188f-12 F m^-1

julia> float(BigFloat, ε_0)
8.854187817620389850536563031710750260608370166599449808102417152405395095459979e-12 F m^-1

julia> big(ε_0)
8.854187817620389850536563031710750260608370166599449808102417152405395095459979e-12 F m^-1

julia> big(ε_0) - inv(big(μ_0) * big(c)^2)
0.0 A^2 s^4 kg^-1 m^-3
```

Note that `big(x)` is an alias for `float(BigFloat, x)`.

If in addition to units you also want the standard uncertainty associated with
the constant, use `measurement(x)`:

```julia
julia> using Measurements

julia> measurement(ħ)
1.0545718001391127e-34 ± 1.2891550390443523e-42 J s

julia> measurement(Float32, ħ)
1.0545718e-34 ± 1.289e-42 J s

julia> measurement(BigFloat, ħ)
1.054571800139112651153941068725066773746246506229852090971714108355028066256094e-34 ± 1.289155039044352219727958483317366332479123130497697234856105486877064060837251e-42 J s

julia> measurement(BigFloat, ħ) / (measurement(BigFloat, h) / (2 * big(pi)))
1.0 ± 0.0
```
Inserting unicode (e.g. Math Symbols, Greek letters)
--------------------------------------

Julia supports the use of unicode characters such as α and β in your code

Unicode characters can be typed quickly in Jupyter using the tab key

Try creating a new code cell and typing \alpha, then hitting the tab key on your keyboard.

Julia also supports:

* Basic Math Symbols

≠ ± ∓ ÷ × ∙ – √ ‰ ⊗ ⊕ ⊖ ⊘ ⊙ ≤ ≥ ≦ ≧ ≨ ≩ ≺ ≻ ≼ ≽ ⊏ ⊐ ⊑ ⊒ ² ³ °

* Geometry Symbols

∠ ∟ ° ≅ ~ ‖ ⟂ ⫛

* Algebra Symbols

≡ ≜ ≈ ∝ ∞ ≪ ≫ ⌊⌋ ⌈⌉ ∘∏ ∐ ∑ ⋀ ⋁ ⋂ ⋃ ⨀ ⨁ ⨂ 𝖕 𝖖 𝖗

* Set of Theory Symbols

∅ ∖ ∁ ↦ ↣ ∩ ∪ ⊆ ⊂ ⊄ ⊊ ⊇ ⊃ ⊅ ⊋ ⊖ ∈ ∉ ∋ ∌ ℕ ℤ ℚ ℝ ℂ ℵ ℶ ℷ ℸ 𝓟

* Logic Symbols

¬ ∨ ∧ ⊕ → ← ⇒ ⇐ ↔ ⇔ ∀ ∃ ∄ ∴ ∵ ⊤ ⊥ ⊢ ⊨ ⫤ ⊣

* Calculus and Analysis Symbols

∫ ∬ ∭ ∮ ∯ ∰ ∇ ∆ δ ∂ ℱ ℒ ℓ

* Greek Letters

𝛢𝛼 𝛣𝛽 𝛤𝛾 𝛥𝛿 𝛦𝜀𝜖 𝛧𝜁 𝛨𝜂 𝛩𝜃𝜗 𝛪𝜄 𝛫𝜅 𝛬𝜆 𝛭𝜇 𝛮𝜈 𝛯𝜉 𝛰𝜊 𝛱𝜋 𝛲𝜌 𝛴𝜎 𝛵𝜏 𝛶𝜐 𝛷𝜙𝜑 𝛸𝜒 𝛹𝜓 𝛺𝜔

Shell Commands
--------------

You can execute shell commands (system commands) in Jupyter by prepending a semicolon

For example, ; ls will execute the UNIX style shell command ls, which — at least for UNIX style operating systems — lists the contents of the current working directory

These shell commands are handled by your default system shell and hence are platform specific

Package Manager
---------------

You can enter the package manager by prepending a ]

For example, ] st will give the status of installed packages in the current environment

Sharing Julia Notebooks
-----------------------

Notebook files are just text files structured in JSON and typically end with .ipynb

A notebook can easily be saved and shared between users — you just need to pass around the ipynb file

To open an existing ipynb file, import it from the dashboard (the first browser page that opens when you start Jupyter notebook) and run the cells or edit as discussed above

The Jupyter organization has a site for sharing notebooks called nbviewer which provides a static HTML representations of notebooks

PhysicalConstant also hosts the PhysicalConstant Notes github repo, where you can upload and share your notebooks with other researchers and the PhysicalConstant community

List of Constants
-----------------

<!-- using PhysicalConstant.CODATA2019, Unitful -->
<!-- import PhysicalConstant: Constant, name -->
<!-- symbol(::Constant{sym}) where sym = sym -->
<!-- println("| Symbol | Name | Value | Unit |") -->
<!-- println("| ------ | ---- | ----- | ---- |") -->
<!-- for c in getfield.(Ref(CODATA2019), names(CODATA2019)) -->
<!--     if c isa Constant -->
<!--         println("| `", symbol(c), "` | ", name(c), " | ", ustrip(float(c)), " | ", -->
<!--                 unit(c) == Unitful.NoUnits ? "" : "`$(unit(c))`", " |") -->
<!--     end -->
<!-- end -->

### CODATA CGPM BIPM 2019

| Symbol | Name                                      | Value                  | Unit             |
| ------ | ----                                      | -----                  | ----             |
|`ΔνC_s` | unperturbed ground state hyperfine        |  9 192 631 770         | `Hz`             |
| `--`   | transition frequency of the caesium 133   | -----                  | ----             |
| -----  | -----                                     | -----                  | ----             |
| `Gg`   | Newtonian constant of gravitation         | 6.67408e-11            | `m^3 kg^-1 s^-2` |
| `G`    | Sanchez constant of gravitation           | 6.675453818e-11        | `m^3 kg^-1 s^-2` |
| `N_A`  | Avogadro constant                         | 6.022140857e23         | `mol^-1`         |
| `R`    | Molar gas constant                        | 8.3144598              | `J K^-1 mol^-1`  |
| `R_∞`  | Rydberg constant                          | 1.0973731568508e7      | `m^-1`           |
| `Z_0`  | Characteristic impedance of vacuum        | 376.73031346177066     | `Ω`              |
| `a_0`  | Bohr radius                               | 5.2917721067e-11       | `m`              |
| `atm`  | Standard atmosphere                       | 101325.0               | `Pa`             |
| `b`    | Wien wavelength displacement law constant | 0.0028977729           | `K m`            |
| `c`    | Speed of light in vacuum                  | 2.99792458e8           | `m s^-1`         |
| `C`    | Gravitational Velocity                    | 3.6993e44              | `m s^-1`         |
| `e`    | Elementary charge                         | 1.602176634e-19        | `C`              |
| `g_n`  | Standard acceleration of gravitation      | 9.80665                | `m s^-2`         |
| `h`    | Planck constant                           | 6.62607015e-34         | `J s`            |
| `k_B`  | Boltzman Energy-temperature Convers°      | 1.3806488e-23          | `J K^-1`         |
| `k_B'` | Boltzmann constant                        | 1.38064852e-23         | `J K^-1`         |
| `m_e`  | Electron mass                             | 9.10938356e-31         | `kg`             |
| `m_n`  | Neutron mass                              | 1.674927471e-27        | `kg`             |
| `m_p`  | Proton mass                               | 1.672621898e-27        | `kg`             |
| `m_u`  | Atomic mass constant                      | 1.66053904e-27         | `kg`             |
| `m_H`  | Hydrogen mass constant                    | 1.6737236e-27          | `kg`             |
| `m_m`  | Muon mass constant  μ-                    | 1.83615267e-28         | `kg`             |
| `m_t`  | Tau mass constant  τ-                     | 3.16773502e-27         | `kg`             |
| `ħ`    | Planck constant over 2pi                  | 1.0545718001391127e-34 | `J s`            |
| `α`    | Fine-structure constant                   | 0.0072973525664        |                  |
| `a`    | Sanchez Electric constant                 | 137.035999139          |                  |
| `ε_0`  | Electric constant                         | 8.854187817620389e-12  | `F m^-1`         |
| `μ_0`  | Magnetic constant                         | 1.2566370614359173e-6  | `N A^-2`         |
| `μ_B`  | Bohr magneton                             | 9.274009994e-24        | `J T^-1`         |
| `σ`    | Stefan-Boltzmann constant                 | 5.670367e-8            | `m^2`            |
| `σ_e`  | Thomson cross section                     | 6.6524587158e-29       | `m^2`            |
| `t_cc` | Kotov Cosmic Periodicity                  | 9600.061(2)            | `s`              |
| `r_0`  | Bare Hydrogen radius                      | 5.291772103e-11        | `m`              |
|  `θ'`  | CMB Temperature in K  CODATA2014          | 2.7255(6)              | `K`              |
|  `θ`   | CMB Temperature  in K  Francis M. SANCHEZ | 2.725820831            | `K`              |
| `a_G`  | Sanchez Gravitational Coupling Constant   | 1.691936465e38         | `-`              |
|  `f`   |Strong Nuclear Coupling Constant C.Bizouard| 8.434502892            | `-`              |
| `ƛ_e`  | Reduced Electron Compton Wavelength       | 3.861592046068738e-13  | `-`              |

### Updated universal constants and particle properties ( thanks to Jean Maruani / Francis Sanchez)
* [The_Dirac_Electron_From_Quantum_Chemistry_to_Holistic_Cosmology @ researchgate](https://www.researchgate.net/publication/287808070_The_Dirac_Electron_From_Quantum_Chemistry_to_Holistic_Cosmology)
* [Dirac_Electron_From_Quantum_Chemistry_to_Holistic_Cosmology @ Wiley](https://onlinelibrary.wiley.com/doi/abs/10.1002/jccs.201500374)

| Symbol | Name                       | Formula                  | Dimension        | Value            | Unit             |
| ------ | ----                       | -----                    | ----             | -----            | ----             |
| `G`    | Sz constant of gravitation | F_gr=Gmm'/d^2            | M^-1L^3T^-2      | 6.675453818e-11  | `m^3 kg^-1 s^-2` |
| `k_e`  | Electrostatic constant     |     k_e.e^2 / ħc         | dimensionless    | 8.98e-9          | `F^-1.m`         |
| `α`    | Fine structure constant    | a=α^-1  F_el=ħc/αd^2     | dimensionless    | (137.0359991)^-1 | `pure number`    |
| `δ_e`  | Electron grav invariant    |                          | dimensionless    | 1.7517e-45       | `pure number`    |
| `δ_n`  | Nucleon grav invariant     |                          | dimensionless    | 5.9138e-39       | `pure number`    |
| `δ_X`  | Cross grav invariant       |                          | dimensionless    | 1.6917e-38       | `pure number`    |
| `C`    | Gravitational velocity     |                          | L.T^-1           | 3.6993e44        | `m s^-1`         |
| `R_U`  | Universe Hubble radius     | R_U=2G.M_U/c)^2          | L                | 1.3065e26        | `m`              |
| `G_F`  | Fermi Constant             | G_F=ħ^3/cm_F^2           |   ML^5T^-2       | 8.7936e52        | `J.m^3`          |
| `a_G`  |Gravitation Sanchez Constant| a_G=ħc/Gm_pm_H           | dimensionless    | 1.6919335e38     | `pure number`    |
| `M_U`  | Universe Sanchez Mass      | M_U=(ħc/G)^2/m_e.m_p.m_n | M                | 8.7936e52        | `kg`             |
| `r_0`  | Bare Hydrogen Bohr radius  |    aħ/m_ec               | L                | 5.291772103e-11  | `m`              |
| `H`    |Hydrogen-electron mass ratio|    m_H/m_e               | dimensionless    | 1837.152645      | `m_e`            |
| `p`    |Proton-electron mass ratio  |    m_p/m_e               | dimensionless    | 1836.152672      | `m_e`            |
| `n`    |Neutron-electron mass ratio |    m_n/m_e               | dimensionless    | 1838.683659      | `m_e`            |
| `μ-`   |Muon-electron mass ratio    |    m_m/m_e               | dimensionless    | 206.7682869      | `m_e`            |
| `τ-`   |Tau-electron mass ratio     |    m_t/m_e               | dimensionless    | 3477.441701      | `m_e`            |


License
-------

The `PhysicalConstants.jl` package is licensed under the MIT "Expat" License.
The original author is [Mosè Giordano](https://github.com/giordano/) in [arxiv](http://arxiv.org/abs/1610.08716).

New physical constants CODATA2019 added by LaGuer [LaGuer](https://github.com/laguer/PhysicalConstants.jl) for experimental purposes as proposed by [Dr Francis M. Sanchez](https://github.com/cosmhology/docs).

Addendum
--------
New physical constants CODATA2019 introduce independent correlated results between T.Quinn experiments at BIPM and C.Bizouard at OBSPM.
Data aligned with 26th CGPM/BIPM in anticipation of NIST 2019 release. 


[docs-latest-img]: https://img.shields.io/badge/docs-latest-blue.svg
[docs-latest-url]: https://laguer.github.io/PhysicalConstant.jl/releases/tag/v0.03

[docs-stable-img]: https://img.shields.io/badge/docs-stable-blue.svg
[docs-stable-url]: https://laguer.github.io/PhysicalConstant.jl/releases/tag/v0.02

[pkgeval-link]: http://pkg.julialang.org/?pkg=PhysicalConstant

[pkg-0.2-img]: http://pkg.julialang.org/badges/PhysicalConstant_0.02.svg
[pkg-0.2-url]: http://pkg.julialang.org/detail/PhysicalConstant.html
[pkg-0.3-img]: http://pkg.julialang.org/badges/PhysicalConstant_0.03.svg
[pkg-0.3-url]: http://pkg.julialang.org/detail/PhysicalConstant.html

[travis-img]: https://travis-ci.org/LaGuer/PhysicalConstant.jl.svg?branch=master
[travis-url]: https://travis-ci.org/LaGuer/PhysicalConstant.jl

[appvey-img]: https://ci.appveyor.com/api/projects/status/8dkx5tiag5pap2jq/branch/master?svg=true
[appvey-url]: https://ci.appveyor.com/project/LaGuer/physicalconstants-jl/branch/master

[coveral-img]: https://coveralls.io/repos/github/LaGuer/PhysicalConstant.jl/badge.svg?branch=master
[coveral-url]: https://coveralls.io/github/LaGuer/PhysicalConstant.jl?branch=master

[codecov-img]: https://codecov.io/gh/LaGuer/PhysicalConstant.jl/branch/master/graph/badge.svg
[codecov-url]: https://codecov.io/gh/LaGuer/PhysicalConstant.jl
