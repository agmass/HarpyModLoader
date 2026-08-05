# Call the functions that teleports players to their assigned slots
execute as @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=1}] run function wathe:rtp/slots/1
execute as @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=2}] run function wathe:rtp/slots/2
execute as @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=3}] run function wathe:rtp/slots/3
execute as @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=4}] run function wathe:rtp/slots/4
execute as @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=5}] run function wathe:rtp/slots/5
execute as @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=6}] run function wathe:rtp/slots/6
execute as @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=7}] run function wathe:rtp/slots/7
execute as @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=8}] run function wathe:rtp/slots/8
execute as @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=9}] run function wathe:rtp/slots/9
execute as @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=10}] run function wathe:rtp/slots/10
execute as @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=11}] run function wathe:rtp/slots/11
execute as @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=12}] run function wathe:rtp/slots/12
execute as @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=13}] run function wathe:rtp/slots/13
execute as @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=14}] run function wathe:rtp/slots/14
execute as @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=15}] run function wathe:rtp/slots/15
execute as @a[x=-1017,dx=203,y=0,dy=4,z=-364,dz=6,scores={wathe_assigned_slot=16}] run function wathe:rtp/slots/16

# Fallback; Reset assignment flag and assigned slots for the next use
# Not strictly necessary since they are also reset when the timer ends, but just in case ¯\_(ツ)_/¯
scoreboard players set @a wathe_assigned 0
scoreboard players set @a wathe_assigned_slot 0
scoreboard players set @a wathe_rand 0
