The only reason Claude is listed as a contributor is because of some chungus that used AI to fix a bug and i PR'd it. Fuck AI.

# HarpyModLoader

---
Modded role loader for the Harpy Express. 

## For players:

Start games with the horn, autostart or `/wathe:start harpymodloader:modded (select your own map entry)` to start a game with modded roles.

## For modders:

***Custom mods should use TMMRoles.registerRole() to add roles, then let this mod handle role assignment from there.***

This mod is **not** required be imported into any mod! Importing the mod into your project is only nessecary if wanting to add items when a player spawns, a role is removed *OR* if you want to add new Modifiers.

## What does the mod do?

---
### Roles
The mod makes it so roles added to TMMRoles.ROLES automatically have a RoleAnnouncement and are given to players. `canUseKillerFeatures()` will decide if the role is given to killers or civillians.

This mod also contains some client-side QOL features to make roles easier to see in spectator, with colored instinct glow and a role name-tag.

### Modifiers
Modifiers are a new sub-set of roles that players can get that can be randomly assigned to any player of any role (evil or not). Modders can decide which modifiers can be given to which roles, but by default; they can be assigned to every role.

Modifiers also show up on player name-tags in spectator or creative, but not on instinct.

## "Documentation"

---
not really documentation

### Installing the Library - Locally

This library does not have a Maven, so you will have to manually add it through a `files()` call in your `build.gradle`.

### Installing the Library - Modrinth Maven

I've never used the modrinth maven- but it seems you can use that to install the library. [Modrinth Maven](https://support.modrinth.com/en/articles/8801191-modrinth-maven)

For reference, [here is the modrinth page to HarpyModLoader](https://modrinth.com/mod/harpymodloader)

### Run code when role is assigned/removed

To run code once a role is assigned, use the `ModdedRoleAssigned` event.

You can use the `ModdedRoleRemoved` event to check when a modded role is removed, but it is recommended to use `ResetPlayerEvent` if you are adding Attributes or other Persistent things on the player that can stick after a log-off, as `ResetPlayerEvent` runs right before a game starts, and after it ends.

Modifiers follow the same logic, with `ModifierAssigned` and `ModifierRemoved`.

### Adding a Modifier

Adding a modifier is as simple as a role.

Simply run the `HMLModifiers.registerModifier()` function and input a new Modifier to register it, with HML handling it. You can add exclusive/inclusive roles and whether the modifier is killer-bound or civillian-bound. For reference: Here's Tiny from Noelle's Roles: 

```java
public static Modifier TINY = HMLModifiers.registerModifier(new Modifier(TINY_ID, new Color(255, 223, 142).getRGB(), new ArrayList<>(List.of(MORPHLING)),null,false,false));
```

If you want to make 2-player Modifiers, You can do so inside ModifierAssigned; however I reccomend you check if the 2nd player already has a modifier to make sure the config's Modifier-Stacking is accounted for.

