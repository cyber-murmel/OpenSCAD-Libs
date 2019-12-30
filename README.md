# OpenSCAD-Libs
Self written OpenSCAD libraries

## Downloading
In OpenSCAD click `File > Show Library Foler…` to get your library directory.
In my case this is `~/.local/share/OpenSCAD/libraries`.

Open a c
```bash
cd ~/.local/share/OpenSCAD/libraries
git init
git remote add upstream https://github.com/cyber-murmel/OpenSCAD-Libs.git
git pull upstream master
```

# Arc Sector
![Arc Sector Animation](../assets/arc_sector.gif?raw=true)
```scad
include <arc_sector.scad>
arc_sector(ri=50, ro=50+5, a=135);
```

## Meandering
![Meandering](../assets/meandering.png)
```scad
include <meandering.scad>
meandering(n=6, ri=5, w=5, pp=40);
translate([50, 0])
  meandering_stress_relief(n=5, ri=6, w=5, pp=40);
```
