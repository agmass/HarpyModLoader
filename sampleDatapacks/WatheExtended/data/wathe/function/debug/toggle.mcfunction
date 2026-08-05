# Toggle debug mode (function called when Toggle Debug item is used)
scoreboard players operation debug_cache wathe_debug = debug wathe_debug
execute if score debug_cache wathe_debug matches 0 run function wathe:debug/enable
execute unless score debug_cache wathe_debug matches 0 run function wathe:debug/disable
scoreboard players set debug_cache wathe_debug 0
