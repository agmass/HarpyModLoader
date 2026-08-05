# Loop function that pick one unassigned player at a time and assign them a random slot
# Loops until all players are assigned, after which it calls the "rtp/complete" function and teleports players to their assigned slots positions

# Initialize "wathe_assigned" score only if all players in the area are already assigned and selects 1 random unassigned player to process
execute unless entity @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned=1}] run scoreboard players set @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6] wathe_assigned 0
execute if entity @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned=0}] run execute as @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned=0},limit=1,sort=random] run function wathe:rtp/assign_worker

# If any unassigned players still remain, schedule this loop to run again next tick
execute if entity @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned=0}] run schedule function wathe:rtp/loop 1t

# When no unassigned players remain, run completion handler
execute unless entity @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned=0}] run execute if score debug wathe_debug matches 1 run tellraw @a [{"text":"[Wathe] ","color":"blue"},{"text":"All players assigned! Teleporting...","color":"green"}]
execute unless entity @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned=0}] run function wathe:rtp/complete
