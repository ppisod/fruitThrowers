# fruitthrowers
For more help, check out [the Rojo documentation](https://rojo.space/docs).  

(+xms) -> delay for x ms relative to client event  
# MathReplicator: a different approach to client/server replication.  
Roadmap: (more client based)  
- INITIALIZATION: CLIENT requests deck from SERVER  
- CLIENT detects keypresses (+0ms)  
- CLIENT finds fruit on deck (+0ms)  
- CLIENT does math calculation for physics and interactions (+0ms)  
- CLIENT sends parabola / movement data to SERVER (+25ms)  
- CLIENT plays out visualizations (fruits) (+0ms)  
- SERVER replicates visualizations for everyone other than the CLIENT who sent the fruit (+50ms)  
- SERVER detects for collisions (+25ms, dependent on collision result)  
- SERVER replicates hit effects to CLIENT (+50ms)  
## Comparison to main branch / replicator
Roadmap: (more server fairness based)  
- CLIENT THROW event: send throw event to the SERVER (+25ms)  
- SERVER handles all deck and fruit logic (+25ms)  
- SERVER replicates visualisations to SERVER (+50ms for THROW client, +25ms for other clients)  
- SERVER handles collisions (+25ms)  
