# This function is called every tick through wathe:tick

# If no players are in creative, disable debug
execute unless entity @a[gamemode=creative] if score debug wathe_debug matches 1 run function wathe:debug/disable

# Update debug UI entries
execute if score debug wathe_debug matches 1 run scoreboard players operation §dintTimer wathe_debug_ui = timer wathe_timer
execute if score debug wathe_debug matches 1 run scoreboard players operation §aisReady wathe_debug_ui = ready wathe_ready
execute if score debug wathe_debug matches 1 run scoreboard players operation §eintPlayers wathe_debug_ui = counter wathe_playercount
execute if score debug wathe_debug matches 1 run scoreboard players operation §2isLocked wathe_debug_ui = lock wathe_lock_timer
execute if score debug wathe_debug matches 1 run scoreboard players operation §5intLockedTimer wathe_debug_ui = timer_lock_timer wathe_lock_timer_timer

# Announce player count changes
execute unless score counter wathe_playercount = counter wathe_playercount_cache run execute if score debug wathe_debug matches 1 run tellraw @a [{"text":"[Wathe] ","color":"blue"},{"text":"Players: ","color":"yellow"},{"score":{"name":"counter","objective":"wathe_playercount"},"color":"white"}]
execute unless score counter wathe_playercount = counter wathe_playercount_cache run scoreboard players operation counter wathe_playercount_cache = counter wathe_playercount

# Announce timer lock state
execute unless score lock wathe_lock_timer = lock wathe_lock_timer_cache run execute if score lock wathe_lock_timer matches 1 run execute if score debug wathe_debug matches 1 run tellraw @a [{"text":"[Wathe] ","color":"blue"},{"text":"Lock: ","color":"dark_purple"},{"text":"True","color":"green"}]
execute unless score lock wathe_lock_timer = lock wathe_lock_timer_cache run execute if score lock wathe_lock_timer matches 0 run execute if score debug wathe_debug matches 1 run tellraw @a [{"text":"[Wathe] ","color":"blue"},{"text":"Lock: ","color":"dark_purple"},{"text":"False","color":"red"}]
execute unless score lock wathe_lock_timer = lock wathe_lock_timer_cache run scoreboard players operation lock wathe_lock_timer_cache = lock wathe_lock_timer

# Announce timer start and end
execute if score ready wathe_ready matches 1 run execute if score timer wathe_timer matches 1 run execute if score debug wathe_debug matches 1 run tellraw @a [{"text":"[Wathe] ","color":"blue"},{"text":"Timer: ","color":"aqua"},{"text":"Start","color":"green"}]
execute if score ready wathe_ready matches 0 run execute if score timer wathe_timer matches 0 run execute unless score timer wathe_timer = timer wathe_timer_cache run execute if score debug wathe_debug matches 1 run tellraw @a [{"text":"[Wathe] ","color":"blue"},{"text":"Timer: ","color":"aqua"},{"text":"Stop","color":"red"}]
execute if score timer wathe_timer matches 200 run execute if score debug wathe_debug matches 1 run tellraw @a [{"text":"[Wathe] ","color":"blue"},{"text":"Timer: ","color":"aqua"},{"text":"End","color":"gold"}]
execute unless score timer wathe_timer = timer wathe_timer_cache run scoreboard players operation timer wathe_timer_cache = timer wathe_timer
