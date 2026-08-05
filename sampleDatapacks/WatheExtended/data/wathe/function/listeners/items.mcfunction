
# This function is called every tick through wathe:tick 
# Debug stuff, I recommend you should not edit or delete these lines unless you know what you are doing 

# Interaction handler checks
# If used the toggle debug item
execute as @a[scores={wathe_handler=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{wathe_debug_use:1b}}}}] run function wathe:debug/toggle
# If used the teleport to scenery item
execute as @a[scores={wathe_handler=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{wathe_debug_tp:1b}}}}] run function wathe:debug/tp/scenery
# If used the add players item
execute as @a[scores={wathe_handler=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{wathe_debug_addplayers:1b}}}}] run function wathe:debug/fp/add
# If used the remove players item
execute as @a[scores={wathe_handler=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{wathe_debug_removeplayers:1b}}}}] run function wathe:debug/fp/remove
# If used the fast teleportation tool
execute as @a[scores={wathe_handler=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{wathe_tool_fasttp:1b}}}}] run function wathe:debug/tp/train

# Reset handler scores for players who used debug items
execute as @a[scores={wathe_handler=1..}] run scoreboard players set @s wathe_handler 0

# Give debug items to creative players
execute as @a[gamemode=creative] unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{wathe_debug_use:1b}}}]}] run give @s[gamemode=creative] carrot_on_a_stick[custom_name='{"color":"#285CC4","italic":false,"text":"Toggle Debug"}',custom_data={wathe_debug_use:1b}] 1
execute as @a[gamemode=creative] unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{wathe_debug_tp:1b}}}]}] run give @s[gamemode=creative] carrot_on_a_stick[custom_name='{"color":"#DBA463","italic":false,"text":"Teleport to Scenery"}',custom_data={wathe_debug_tp:1b}] 1
execute as @a[gamemode=creative] unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{wathe_debug_addplayers:1b}}}]}] run give @s[gamemode=creative] carrot_on_a_stick[custom_name='{"color":"#14A02E","italic":false,"text":"Add Players"}',custom_data={wathe_debug_addplayers:1b}] 1
execute as @a[gamemode=creative] unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{wathe_debug_removeplayers:1b}}}]}] run give @s[gamemode=creative] carrot_on_a_stick[custom_name='{"color":"#B4202A","italic":false,"text":"Remove Players"}',custom_data={wathe_debug_removeplayers:1b}] 1

# Remove debug items from non-creative players
execute as @a[gamemode=!creative] if items entity @s hotbar.* minecraft:carrot_on_a_stick[minecraft:custom_data={wathe_debug_use:1b}] run clear @s minecraft:carrot_on_a_stick[minecraft:custom_data={wathe_debug_use:1b}]
execute as @a[gamemode=!creative] if items entity @s hotbar.* minecraft:carrot_on_a_stick[minecraft:custom_data={wathe_debug_tp:1b}] run clear @s minecraft:carrot_on_a_stick[minecraft:custom_data={wathe_debug_tp:1b}]
execute as @a[gamemode=!creative] if items entity @s hotbar.* minecraft:carrot_on_a_stick[minecraft:custom_data={wathe_debug_addplayers:1b}] run clear @s minecraft:carrot_on_a_stick[minecraft:custom_data={wathe_debug_addplayers:1b}]
execute as @a[gamemode=!creative] if items entity @s hotbar.* minecraft:carrot_on_a_stick[minecraft:custom_data={wathe_debug_removeplayers:1b}] run clear @s minecraft:carrot_on_a_stick[minecraft:custom_data={wathe_debug_removeplayers:1b}]

# Give fast teleportation tool to adventure mode players that are in the lobby area
execute as @a[x=-872,dx=273,y=-64,dy=384,z=-321,dz=135] unless entity @s[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6] run execute unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{wathe_tool_fasttp:1b}}}]}] run give @s[x=-872,dx=273,y=-64,dy=384,z=-321,dz=135] carrot_on_a_stick[custom_name='{"color":"#59C135","italic":false,"text":"Teleport to Train"}',custom_data={wathe_tool_fasttp:1b}] 1

# Removes fast teleportation tool from players if they are outside the lobby area
# : This is not really needed because of Wathe clearing players inventory when game starts/ends but just in case
execute as @a unless entity @s[x=-872,dx=273,y=-64,dy=384,z=-321,dz=135] if entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{wathe_tool_fasttp:1b}}}]}] run clear @s minecraft:carrot_on_a_stick[minecraft:custom_data={wathe_tool_fasttp:1b}]

# Removes the fast teleportation tool from players that are in the ready area
execute as @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6] if entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{wathe_tool_fasttp:1b}}}]}] run clear @s minecraft:carrot_on_a_stick[minecraft:custom_data={wathe_tool_fasttp:1b}]

# Remove bowls from players inventory (don't ask why this is something, it's needed)
execute as @a[gamemode=!creative] if entity @s[nbt={Inventory:[{id:"minecraft:bowl"}]}] run clear @s minecraft:bowl

# Checks for dropped items falling outside the playing area, if so, teleports them to the closest player body
execute as @e[type=item,x=-57,dx=245,y=117.5,dy=3,z=-551,dz=31] at @s if entity @e[type=wathe:player_body] run execute at @e[type=wathe:player_body,limit=1,sort=nearest] run tp @s ~ ~0.5 ~
## Fallback; If no player bodies exist, teleport to nearest player
execute as @e[type=item,x=-57,dx=245,y=117.5,dy=3,z=-551,dz=31] at @s unless entity @e[type=wathe:player_body] run execute at @e[type=player,limit=1,sort=nearest] run tp @s ~ ~0.5 ~
