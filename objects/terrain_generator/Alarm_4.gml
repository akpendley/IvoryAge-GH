/// @description Condition the Biome Map
ts.step = 4;

blend_biome(1);
show_debug_message("Blend biome pass 1 complete.");
blend_biome(2);
show_debug_message("Blend biome pass 2 complete.");

alarm[5] = 10;