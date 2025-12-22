package org.agmas.harpymodloader.client;

import dev.doctor4t.wathe.api.Role;
import net.fabricmc.api.ClientModInitializer;
import net.fabricmc.fabric.api.client.event.lifecycle.v1.ClientTickEvents;
import net.fabricmc.fabric.api.client.networking.v1.ClientPlayConnectionEvents;
import net.minecraft.text.MutableText;
import net.minecraft.text.Text;
import java.util.ArrayList;
import org.agmas.harpymodloader.Harpymodloader;
import org.agmas.harpymodloader.modifiers.Modifier;

public class HarpymodloaderClient implements ClientModInitializer {

    public static float rainbowRoleTime = 0;
    public static Role hudRole = null;
    public static ArrayList<Modifier> modifiers = null;

    @Override
    public void onInitializeClient() {
        ClientPlayConnectionEvents.JOIN.register((clientPlayNetworkHandler, packetSender, minecraftClient) -> {
            Harpymodloader.refreshRoles();
        });
        ClientTickEvents.END_CLIENT_TICK.register((t) -> {
            rainbowRoleTime += 1;
        });
    }

    public static MutableText getRoleName(Role role) {
        // vanilla
        if (role.identifier().getNamespace().equalsIgnoreCase("wathe")) {
            return Text.translatable("announcement.role." + role.identifier().getPath());
        }
        return Text.translatable("announcement.role." + role.identifier().toTranslationKey());
    }
}
