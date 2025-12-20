package org.agmas.harpymodloader.component;

import dev.doctor4t.wathe.api.Role;
import dev.doctor4t.wathe.api.WatheRoles;
import net.fabricmc.loader.impl.util.log.Log;
import net.fabricmc.loader.impl.util.log.LogCategory;
import net.minecraft.entity.player.PlayerEntity;
import net.minecraft.nbt.NbtCompound;
import net.minecraft.nbt.NbtElement;
import net.minecraft.nbt.NbtHelper;
import net.minecraft.nbt.NbtList;
import net.minecraft.registry.RegistryWrapper;
import net.minecraft.util.Identifier;
import net.minecraft.world.World;
import org.agmas.harpymodloader.Harpymodloader;
import org.agmas.harpymodloader.modifiers.HMLModifiers;
import org.agmas.harpymodloader.modifiers.Modifier;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.ladysnake.cca.api.v3.component.ComponentKey;
import org.ladysnake.cca.api.v3.component.ComponentRegistry;
import org.ladysnake.cca.api.v3.component.sync.AutoSyncedComponent;
import org.ladysnake.cca.api.v3.component.tick.ClientTickingComponent;
import org.ladysnake.cca.api.v3.component.tick.ServerTickingComponent;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

public class WorldModifierComponent implements AutoSyncedComponent, ServerTickingComponent, ClientTickingComponent {
    public static final ComponentKey<WorldModifierComponent> KEY = ComponentRegistry.getOrCreate(Identifier.of(Harpymodloader.MOD_ID, "modifier"), WorldModifierComponent.class);
    private final World world;
    public HashMap<UUID, ArrayList<Modifier>> modifiers = new HashMap<>();


    public WorldModifierComponent(World world) {
        this.world = world;
    }

    @Override
    public void serverTick() {
        sync();
    }

    public boolean isRole(@NotNull PlayerEntity player, Modifier role) {
        return this.isRole(player.getUuid(), role);
    }

    public boolean isRole(@NotNull UUID uuid, Modifier role) {
        return getModifiers(uuid).contains(role);
    }

    public HashMap<UUID, ArrayList<Modifier>> getModifiers() {
        return this.modifiers;
    }

    public ArrayList<Modifier> getModifiers(PlayerEntity player) {
        return this.getModifiers(player.getUuid());
    }

    public ArrayList<Modifier> getModifiers(UUID uuid) {
        if (!modifiers.containsKey(uuid)) modifiers.put(uuid, new ArrayList<>());
        return this.modifiers.get(uuid);
    }

    public List<UUID> getAllWithModifier(Modifier modifier) {
        List<UUID> ret = new ArrayList();
        this.modifiers.forEach((uuid, playerModifier) -> {
            if (playerModifier.contains(modifier)) {
                ret.add(uuid);
            }
        });
        return ret;
    }

    public void setModifiers(List<UUID> players, Modifier modifier) {

        for(UUID player : players) {
            addModifier(player, modifier);
        }

    }

    public void addModifier(UUID player, Modifier modifier) {
        getModifiers(player).add(modifier);
    }


    @Override
    public void readFromNbt(NbtCompound nbtCompound, RegistryWrapper.WrapperLookup wrapperLookup) {

        modifiers.clear();
        for(Modifier modifier : HMLModifiers.MODIFIERS) {
            setModifiers(this.uuidListFromNbt(nbtCompound, modifier.identifier().toString()), modifier);
        }
    }

    @Override
    public void writeToNbt(NbtCompound nbtCompound, RegistryWrapper.WrapperLookup wrapperLookup) {

        for(Modifier modifier : HMLModifiers.MODIFIERS) {
            nbtCompound.put(modifier.identifier().toString(), this.nbtFromUuidList(getAllWithModifier(modifier)));
        }
    }
    public void sync() {
        KEY.sync(this.world);
    }

    @Override
    public void clientTick() {

    }

    private ArrayList<UUID> uuidListFromNbt(NbtCompound nbtCompound, String listName) {
        ArrayList<UUID> ret = new ArrayList();

        for(NbtElement e : nbtCompound.getList(listName, 11)) {
            ret.add(NbtHelper.toUuid(e));
        }

        return ret;
    }

    private NbtList nbtFromUuidList(List<UUID> list) {
        NbtList ret = new NbtList();

        for(UUID player : list) {
            ret.add(NbtHelper.fromUuid(player));
        }

        return ret;
    }
}
