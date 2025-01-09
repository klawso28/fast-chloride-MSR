# Moltres neutronics input file
fuel = 19  # fuel radius, cm
ref = 44   # reflector outer radius, cm
H = 100     # fuel height, cm 
Href = 125
Hhalf = 50     # half fuel height, cm

[GlobalParams]
  num_groups = 27
  num_precursor_groups = 8
  group_fluxes = 'group1 group2 group3 group4 group5 group6 group7 group8 group9 group10 group11 group12 group13 group14 group15 group16 group17 group18 group19 group20 group21 group22 group23 group24 group25 group26 group27 '
  pre_concs = 'pre1 pre2 pre3 pre4 pre5 pre6 pre7 pre8'
  sss2_input = true
  temperature = 900
  use_exp_form = false
[]

[Mesh]
  file = '../../../meshes/MCRE-1D.msh'
  coord_type = RZ
[]

[Problem]
  type = EigenProblem
  bx_norm = bnorm
[]

[Nt]
  var_name_base = group
  nt_ic_function = fluxFunc
  create_temperature_var = false
  pre_blocks = 'fs' 
  vacuum_boundaries = 'outer_wall' 
  eigen = true
  transient = false
  account_delayed = true
[]

[Precursors]
  [pres]
    var_name_base = pre
    block = 'fs'
    nt_exp_form = false
    family = MONOMIAL
    order = FIRST
    loop_precursors = false
    transient = false
    outlet_boundaries = ''
    constant_velocity_values = true
    u_def = 0
    v_def = 0
    w_def = 0
  []
[]

[Functions]
  [fluxFunc]
    type = ParsedFunction
    expression = '1e15* cos(pi / 2 * x / ${ref})'
  []
[]

[BCs]
  [refl_group1]
    type = NeumannBC
    boundary = 'fuel_top refl_top refl_bottom fuel_bottom'
    variable = group1
  []

  [refl_group2]
    type = NeumannBC
    boundary = 'fuel_top refl_top refl_bottom fuel_bottom'
    variable = group2
  []

  [refl_group3]
    type = NeumannBC
    boundary = 'fuel_top refl_top refl_bottom fuel_bottom'
    variable = group3
  []

  [refl_group4]
    type = NeumannBC
    boundary = 'fuel_top refl_top refl_bottom fuel_bottom'
    variable = group4
  []

  [refl_group5]
    type = NeumannBC
    boundary = 'fuel_top refl_top refl_bottom fuel_bottom'
    variable = group5
  []

  [refl_group6]
    type = NeumannBC
    boundary = 'fuel_top refl_top refl_bottom fuel_bottom'
    variable = group6
  []

  [refl_group7]
    type = NeumannBC
    boundary = 'fuel_top refl_top refl_bottom fuel_bottom'
    variable = group7
  []

  [refl_group8]
    type = NeumannBC
    boundary = 'fuel_top refl_top refl_bottom fuel_bottom'
    variable = group8
  []

  [refl_group9]
    type = NeumannBC
    boundary = 'fuel_top refl_top refl_bottom fuel_bottom'
    variable = group9
  []

  [refl_group10]
    type = NeumannBC
    boundary = 'fuel_top refl_top refl_bottom fuel_bottom'
    variable = group10
  []

  [refl_group11]
    type = NeumannBC
    boundary = 'fuel_top refl_top refl_bottom fuel_bottom'
    variable = group11
  []

  [refl_group12]
    type = NeumannBC
    boundary = 'fuel_top refl_top refl_bottom fuel_bottom'
    variable = group12
  []

  [refl_group13]
    type = NeumannBC
    boundary = 'fuel_top refl_top refl_bottom fuel_bottom'
    variable = group13
  []

  [refl_group14]
    type = NeumannBC
    boundary = 'fuel_top refl_top refl_bottom fuel_bottom'
    variable = group14
  []

  [refl_group15]
    type = NeumannBC
    boundary = 'fuel_top refl_top refl_bottom fuel_bottom'
    variable = group15
  []

  [refl_group16]
    type = NeumannBC
    boundary = 'fuel_top refl_top refl_bottom fuel_bottom'
    variable = group16
  []

  [refl_group17]
    type = NeumannBC
    boundary = 'fuel_top refl_top refl_bottom fuel_bottom'
    variable = group17
  []

  [refl_group18]
    type = NeumannBC
    boundary = 'fuel_top refl_top refl_bottom fuel_bottom'
    variable = group18
  []

  [refl_group19]
    type = NeumannBC
    boundary = 'fuel_top refl_top refl_bottom fuel_bottom'
    variable = group19
  []

  [refl_group20]
    type = NeumannBC
    boundary = 'fuel_top refl_top refl_bottom fuel_bottom'
    variable = group20
  []

  [refl_group21]
    type = NeumannBC
    boundary = 'fuel_top refl_top refl_bottom fuel_bottom'
    variable = group21
  []

  [refl_group22]
    type = NeumannBC
    boundary = 'fuel_top refl_top refl_bottom fuel_bottom'
    variable = group22
  []

  [refl_group23]
    type = NeumannBC
    boundary = 'fuel_top refl_top refl_bottom fuel_bottom'
    variable = group23
  []

  [refl_group24]
    type = NeumannBC
    boundary = 'fuel_top refl_top refl_bottom fuel_bottom'
    variable = group24
  []

  [refl_group25]
    type = NeumannBC
    boundary = 'fuel_top refl_top refl_bottom fuel_bottom'
    variable = group25
  []

  [refl_group26]
    type = NeumannBC
    boundary = 'fuel_top refl_top refl_bottom fuel_bottom'
    variable = group26
  []

  [refl_group27]
    type = NeumannBC
    boundary = 'fuel_top refl_top refl_bottom fuel_bottom'
    variable = group27
  []
[]

[Materials]
  [fs]
    type = MoltresJsonMaterial
    block = 1
    base_file = 'XS.json'
    material_key = 'fs'
    interp_type = 'NONE'
    temperature = 900
    prop_names = ''
    prop_values = ''
  []

  [re]
    type = MoltresJsonMaterial
    block = 2
    base_file = 'XS.json'
    material_key = 're'
    interp_type = 'NONE'
    temperature = 873
    prop_names = ''
    prop_values = ''
  []
[]

[Executioner]
  type = Eigenvalue
  initial_eigenvalue = 1
  solve_type = 'PJFNK'

  max_power_iterations = 50 
  eig_check_tol = 1e-6 
  l_max_its = 100

  normalization = 'powernorm'
  normal_factor = 1.8e9

  automatic_scaling = true
  compute_scaling_once = false
  resid_vs_jac_scaling_param = 0.1

  petsc_options = '-snes_converged_reason -ksp_converged_reason -snes_linesearch_monitor'
  petsc_options_iname = '-pc_type -pc_hypre_type'
  petsc_options_value = 'hypre boomeramg'
  line_search = none
[]

[Preconditioning]
  [SMP]
    type = SMP
    full = true
  []
[]

[Postprocessors]
  [k_eff]
    type = VectorPostprocessorComponent
    index = 0
    vectorpostprocessor = k_vpp
    vector_name = eigen_values_real
  []

  [bnorm]
    type = ElmIntegTotFissNtsPostprocessor
    execute_on = linear
    account_delayed = true
    block = 'fs'
  []

  [powernorm]
    type = ElmIntegTotFissHeatPostprocessor
    execute_on = linear
  []

  [group1max]
    type = NodalExtremeValue
    variable = group1
    execute_on = timestep_end
  []

  [group1diff]
    type = ElementL2Diff
    variable = group1
    execute_on = 'linear timestep_end'
    use_displaced_mesh = false
  []
[]

[VectorPostprocessors]
  [centerline]
    type = LineValueSampler
    variable = 'group1 group2 group3 group4 group5 group6 group7 group8 group9 group10 group11 group12 group13 group14 group15 group16 group17 group18 group19 group20 group21 group22 group23 group24 group25 group26 group27 '
    start_point = '0 ${Hhalf} 0'
    end_point = '${ref} ${Hhalf} 0'
    num_points = 401
    sort_by = x
    execute_on = FINAL
  []

  [k_vpp]
    type = Eigenvalues
    inverse_eigenvalue = true
  []
[]

[Outputs]
  perf_graph = true
  print_linear_residuals = true

  [exodus]
    type = Exodus
  []

  [csv]
    type = CSV
  []
[]
