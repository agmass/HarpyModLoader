# Forcing assignement on the first free slot to the actual player
# : This is a fallback mechanism when random assignment fails after multiple attempts
# : Might happen when there are few slots left and random keeps picking already assigned ones

# Try slots 1..16 sequentially; when a free slot is found, assign it and mark the player assigned
execute unless entity @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=1}] run scoreboard players set @s wathe_assigned_slot 1

execute if score @s wathe_assigned_slot matches 1 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned matches 0 run execute unless entity @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=2}] run scoreboard players set @s wathe_assigned_slot 2

execute if score @s wathe_assigned_slot matches 2 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned matches 0 run execute unless entity @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=3}] run scoreboard players set @s wathe_assigned_slot 3

execute if score @s wathe_assigned_slot matches 3 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned matches 0 run execute unless entity @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=4}] run scoreboard players set @s wathe_assigned_slot 4

execute if score @s wathe_assigned_slot matches 4 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned matches 0 run execute unless entity @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=5}] run scoreboard players set @s wathe_assigned_slot 5

execute if score @s wathe_assigned_slot matches 5 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned matches 0 run execute unless entity @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=6}] run scoreboard players set @s wathe_assigned_slot 6

execute if score @s wathe_assigned_slot matches 6 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned matches 0 run execute unless entity @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=7}] run scoreboard players set @s wathe_assigned_slot 7

execute if score @s wathe_assigned_slot matches 7 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned matches 0 run execute unless entity @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=8}] run scoreboard players set @s wathe_assigned_slot 8

execute if score @s wathe_assigned_slot matches 8 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned matches 0 run execute unless entity @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=9}] run scoreboard players set @s wathe_assigned_slot 9

execute if score @s wathe_assigned_slot matches 9 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned matches 0 run execute unless entity @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=10}] run scoreboard players set @s wathe_assigned_slot 10

execute if score @s wathe_assigned_slot matches 10 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned matches 0 run execute unless entity @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=11}] run scoreboard players set @s wathe_assigned_slot 11

execute if score @s wathe_assigned_slot matches 11 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned matches 0 run execute unless entity @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=12}] run scoreboard players set @s wathe_assigned_slot 12

execute if score @s wathe_assigned_slot matches 12 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned matches 0 run execute unless entity @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=13}] run scoreboard players set @s wathe_assigned_slot 13

execute if score @s wathe_assigned_slot matches 13 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned matches 0 run execute unless entity @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=14}] run scoreboard players set @s wathe_assigned_slot 14

execute if score @s wathe_assigned_slot matches 14 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned matches 0 run execute unless entity @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=15}] run scoreboard players set @s wathe_assigned_slot 15

execute if score @s wathe_assigned_slot matches 15 run scoreboard players set @s wathe_assigned 1
execute if score @s wathe_assigned matches 0 run execute unless entity @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=16}] run scoreboard players set @s wathe_assigned_slot 16

execute if score @s wathe_assigned_slot matches 16 run scoreboard players set @s wathe_assigned 1

# Reset attempts so this fallback is not repeatedly triggered
execute if score @s wathe_assigned matches 1 run scoreboard players set @s wathe_attempts 0
