# Random slot assignment logic
# Roll a random slot and try to assign it to the player
# If the slot is already taken, do nothing (the player remains unassigned and will be retried later to avoid duplicates and infinite loops)

# Store random value (from 1 to 16) into the current player's score
execute store result score @s wathe_rand run random value 1..16
# Track attempts for the current player to trigger the force_assing fallback function if needed
scoreboard players add @s wathe_attempts 1

# if wathe_rand=1
## Assign slot 1 if not already assigned
execute if score @s wathe_rand matches 1 run execute unless entity @a[x=-1017,dx=203,y=0,dy=8,z=-364,dz=6,scores={wathe_assigned_slot=1}] run scoreboard players set @s wathe_assigned_slot 1
execute if score @s wathe_assigned_slot matches 1 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned_slot matches 1 run scoreboard players set @s wathe_attempts 0
## Announce which player got slot 1 when debug is enabled
execute if score @s wathe_rand matches 1 run execute if score debug wathe_debug matches 1 run tellraw @a [{"text":"[Wathe] ","color":"blue"},{"selector":"@s"},{"text":" » Slot ","color":"gold"},{"text":"1","color":"yellow"}]

# if wathe_rand=2
## Assign slot 2 if not already assigned
execute if score @s wathe_rand matches 2 run execute unless entity @a[x=-1017,dx=203,y=0,dy=8,z=-364,dz=6,scores={wathe_assigned_slot=2}] run scoreboard players set @s wathe_assigned_slot 2
execute if score @s wathe_assigned_slot matches 2 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned_slot matches 2 run scoreboard players set @s wathe_attempts 0
## Announce which player got slot 2 when debug is enabled
execute if score @s wathe_rand matches 2 run execute if score debug wathe_debug matches 1 run tellraw @a [{"text":"[Wathe] ","color":"blue"},{"selector":"@s"},{"text":" » Slot ","color":"gold"},{"text":"2","color":"yellow"}]

# if wathe_rand=3
## Assign slot 3 if not already assigned
execute if score @s wathe_rand matches 3 run execute unless entity @a[x=-1017,dx=203,y=0,dy=8,z=-364,dz=6,scores={wathe_assigned_slot=3}] run scoreboard players set @s wathe_assigned_slot 3
execute if score @s wathe_assigned_slot matches 3 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned_slot matches 3 run scoreboard players set @s wathe_attempts 0
## Announce which player got slot 3 when debug is enabled
execute if score @s wathe_rand matches 3 run execute if score debug wathe_debug matches 1 run tellraw @a [{"text":"[Wathe] ","color":"blue"},{"selector":"@s"},{"text":" » Slot ","color":"gold"},{"text":"3","color":"yellow"}]

# if wathe_rand=4
## Assign slot 4 if not already assigned
execute if score @s wathe_rand matches 4 run execute unless entity @a[x=-1017,dx=203,y=0,dy=8,z=-364,dz=6,scores={wathe_assigned_slot=4}] run scoreboard players set @s wathe_assigned_slot 4
execute if score @s wathe_assigned_slot matches 4 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned_slot matches 4 run scoreboard players set @s wathe_attempts 0
## Announce which player got slot 4 when debug is enabled
execute if score @s wathe_rand matches 4 run execute if score debug wathe_debug matches 1 run tellraw @a [{"text":"[Wathe] ","color":"blue"},{"selector":"@s"},{"text":" » Slot ","color":"gold"},{"text":"4","color":"yellow"}]

# if wathe_rand=5
## Assign slot 5 if not already assigned
execute if score @s wathe_rand matches 5 run execute unless entity @a[x=-1017,dx=203,y=0,dy=8,z=-364,dz=6,scores={wathe_assigned_slot=5}] run scoreboard players set @s wathe_assigned_slot 5
execute if score @s wathe_assigned_slot matches 5 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned_slot matches 5 run scoreboard players set @s wathe_attempts 0
## Announce which player got slot 5 when debug is enabled
execute if score @s wathe_rand matches 5 run execute if score debug wathe_debug matches 1 run tellraw @a [{"text":"[Wathe] ","color":"blue"},{"selector":"@s"},{"text":" » Slot ","color":"gold"},{"text":"5","color":"yellow"}]

# if wathe_rand=6
## Assign slot 6 if not already assigned
execute if score @s wathe_rand matches 6 run execute unless entity @a[x=-1017,dx=203,y=0,dy=8,z=-364,dz=6,scores={wathe_assigned_slot=6}] run scoreboard players set @s wathe_assigned_slot 6
execute if score @s wathe_assigned_slot matches 6 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned_slot matches 6 run scoreboard players set @s wathe_attempts 0
## Announce which player got slot 6 when debug is enabled
execute if score @s wathe_rand matches 6 run execute if score debug wathe_debug matches 1 run tellraw @a [{"text":"[Wathe] ","color":"blue"},{"selector":"@s"},{"text":" » Slot ","color":"gold"},{"text":"6","color":"yellow"}]

# if wathe_rand=7
## Assign slot 7 if not already assigned
execute if score @s wathe_rand matches 7 run execute unless entity @a[x=-1017,dx=203,y=0,dy=8,z=-364,dz=6,scores={wathe_assigned_slot=7}] run scoreboard players set @s wathe_assigned_slot 7
execute if score @s wathe_assigned_slot matches 7 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned_slot matches 7 run scoreboard players set @s wathe_attempts 0
## Announce which player got slot 7 when debug is enabled
execute if score @s wathe_rand matches 7 run execute if score debug wathe_debug matches 1 run tellraw @a [{"text":"[Wathe] ","color":"blue"},{"selector":"@s"},{"text":" » Slot ","color":"gold"},{"text":"7","color":"yellow"}]

# if wathe_rand=8
## Assign slot 8 if not already assigned
execute if score @s wathe_rand matches 8 run execute unless entity @a[x=-1017,dx=203,y=0,dy=8,z=-364,dz=6,scores={wathe_assigned_slot=8}] run scoreboard players set @s wathe_assigned_slot 8
execute if score @s wathe_assigned_slot matches 8 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned_slot matches 8 run scoreboard players set @s wathe_attempts 0
## Announce which player got slot 8 when debug is enabled
execute if score @s wathe_rand matches 8 run execute if score debug wathe_debug matches 1 run tellraw @a [{"text":"[Wathe] ","color":"blue"},{"selector":"@s"},{"text":" » Slot ","color":"gold"},{"text":"8","color":"yellow"}]

# if wathe_rand=9
## Assign slot 9 if not already assigned
execute if score @s wathe_rand matches 9 run execute unless entity @a[x=-1017,dx=203,y=0,dy=8,z=-364,dz=6,scores={wathe_assigned_slot=9}] run scoreboard players set @s wathe_assigned_slot 9
execute if score @s wathe_assigned_slot matches 9 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned_slot matches 9 run scoreboard players set @s wathe_attempts 0
## Announce which player got slot 9 when debug is enabled
execute if score @s wathe_rand matches 9 run execute if score debug wathe_debug matches 1 run tellraw @a [{"text":"[Wathe] ","color":"blue"},{"selector":"@s"},{"text":" » Slot ","color":"gold"},{"text":"9","color":"yellow"}]

# if wathe_rand=10
## Assign slot 10 if not already assigned
execute if score @s wathe_rand matches 10 run execute unless entity @a[x=-1017,dx=203,y=0,dy=8,z=-364,dz=6,scores={wathe_assigned_slot=10}] run scoreboard players set @s wathe_assigned_slot 10
execute if score @s wathe_assigned_slot matches 10 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned_slot matches 10 run scoreboard players set @s wathe_attempts 0

execute if score @s wathe_rand matches 10 run execute if score debug wathe_debug matches 1 run tellraw @a [{"text":"[Wathe] ","color":"blue"},{"selector":"@s"},{"text":" » Slot ","color":"gold"},{"text":"10","color":"yellow"}]

# if wathe_rand=11
## Assign slot 11 if not already assigned
execute if score @s wathe_rand matches 11 run execute unless entity @a[x=-1017,dx=203,y=0,dy=8,z=-364,dz=6,scores={wathe_assigned_slot=11}] run scoreboard players set @s wathe_assigned_slot 11
execute if score @s wathe_assigned_slot matches 11 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned_slot matches 11 run scoreboard players set @s wathe_attempts 0
## Announce which player got slot 11 when debug is enabled
execute if score @s wathe_rand matches 11 run execute if score debug wathe_debug matches 1 run tellraw @a [{"text":"[Wathe] ","color":"blue"},{"selector":"@s"},{"text":" » Slot ","color":"gold"},{"text":"11","color":"yellow"}]

# if wathe_rand=12
## Assign slot 12 if not already assigned
execute if score @s wathe_rand matches 12 run execute unless entity @a[x=-1017,dx=203,y=0,dy=8,z=-364,dz=6,scores={wathe_assigned_slot=12}] run scoreboard players set @s wathe_assigned_slot 12
execute if score @s wathe_assigned_slot matches 12 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned_slot matches 12 run scoreboard players set @s wathe_attempts 0
## Announce which player got slot 12 when debug is enabled
execute if score @s wathe_rand matches 12 run execute if score debug wathe_debug matches 1 run tellraw @a [{"text":"[Wathe] ","color":"blue"},{"selector":"@s"},{"text":" » Slot ","color":"gold"},{"text":"12","color":"yellow"}]

# if wathe_rand=13
## Assign slot 13 if not already assigned
execute if score @s wathe_rand matches 13 run execute unless entity @a[x=-1017,dx=203,y=0,dy=8,z=-364,dz=6,scores={wathe_assigned_slot=13}] run scoreboard players set @s wathe_assigned_slot 13
execute if score @s wathe_assigned_slot matches 13 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned_slot matches 13 run scoreboard players set @s wathe_attempts 0
## Announce which player got slot 13 when debug is enabled
execute if score @s wathe_rand matches 13 run execute if score debug wathe_debug matches 1 run tellraw @a [{"text":"[Wathe] ","color":"blue"},{"selector":"@s"},{"text":" » Slot ","color":"gold"},{"text":"13","color":"yellow"}]

# if wathe_rand=14
## Assign slot 14 if not already assigned
execute if score @s wathe_rand matches 14 run execute unless entity @a[x=-1017,dx=203,y=0,dy=8,z=-364,dz=6,scores={wathe_assigned_slot=14}] run scoreboard players set @s wathe_assigned_slot 14
execute if score @s wathe_assigned_slot matches 14 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned_slot matches 14 run scoreboard players set @s wathe_attempts 0
## Announce which player got slot 14 when debug is enabled
execute if score @s wathe_rand matches 14 run execute if score debug wathe_debug matches 1 run tellraw @a [{"text":"[Wathe] ","color":"blue"},{"selector":"@s"},{"text":" » Slot ","color":"gold"},{"text":"14","color":"yellow"}]

# if wathe_rand=15
## Assign slot 15 if not already assigned
execute if score @s wathe_rand matches 15 run execute unless entity @a[x=-1017,dx=203,y=0,dy=8,z=-364,dz=6,scores={wathe_assigned_slot=15}] run scoreboard players set @s wathe_assigned_slot 15
execute if score @s wathe_assigned_slot matches 15 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned_slot matches 15 run scoreboard players set @s wathe_attempts 0
## Announce which player got slot 15 when debug is enabled
execute if score @s wathe_rand matches 15 run execute if score debug wathe_debug matches 1 run tellraw @a [{"text":"[Wathe] ","color":"blue"},{"selector":"@s"},{"text":" » Slot ","color":"gold"},{"text":"15","color":"yellow"}]

# if wathe_rand=16
## Assign slot 16 if not already assigned
execute if score @s wathe_rand matches 16 run execute unless entity @a[x=-1017,dx=203,y=0,dy=8,z=-364,dz=6,scores={wathe_assigned_slot=16}] run scoreboard players set @s wathe_assigned_slot 16
execute if score @s wathe_assigned_slot matches 16 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned_slot matches 16 run scoreboard players set @s wathe_attempts 0
## Announce which player got slot 16 when debug is enabled
execute if score @s wathe_rand matches 16 run execute if score debug wathe_debug matches 1 run tellraw @a [{"text":"[Wathe] ","color":"blue"},{"selector":"@s"},{"text":" » Slot ","color":"gold"},{"text":"16","color":"yellow"}]

# If the player is still unassigned and has reached many attempts (16 here), call the force_assign function as a fallback
execute if score @s wathe_assigned matches 0 run execute if score @s wathe_attempts matches 16.. run function wathe:rtp/force_assign
