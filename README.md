# fast-chloride-MSR
Publicly available input files for Serpent and Moltres neutronics models of fast-spectrum molten chloride-salt reactors.

Kyra Lawson & Nicholas R. Brown (2024) Development of Two-Step Method for Fast Chloride MSR Neutronics, Nuclear Technology, 210:11, 2133-2150, DOI: 10.1080/00295450.2024.2310911 
work included in two-step-method/ directory.

The files are organized by reactor (MCFR vs. MCRE), energy group structure (6, 27, 33), and then dimension (1D vs. 2D). Moltres and Serpent input files are included as moltres.i and serpent.i, respectively. Gmsh input files are included in meshes/ directory. .msh files can be created from these .geo files. 

Before running moltres.i files, the mesh (.msh) files must be generated from the .geo files in meshes/, Serpent (or another Monte Carlo code with group-constant generation capabilities) input files must be run, and cross-section .json files (titled XS.json, see Moltres tutorial/git for formatting) must be created from the Serpent output files.
