# Conway's Game of Life
[Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) is a cellular automaton generated on a 2D matrix. Cells live and die into new generations, determined by the amount of alive neighbors they are in contact with.

## Rules
Cells live and die by the amount of neighbors they have in the 8 matrix spaces around them.

No. Neighbors   | Cell Status
----------------|-----------
0, 1, 4+        | Dead
2, 3            | Alive
3               | Dead -> Alive

## Versions
Language | Version
---------|---------
Ruby     | 3.2.2
Rspec    | 3.12
