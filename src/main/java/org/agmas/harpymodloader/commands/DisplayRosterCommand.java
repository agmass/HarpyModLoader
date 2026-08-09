package org.agmas.harpymodloader.commands;

import java.util.ArrayList;
import java.util.List;

import org.agmas.harpymodloader.Harpymodloader;
import org.agmas.harpymodloader.component.WorldModifierComponent;
import org.agmas.harpymodloader.modifiers.Modifier;

import com.mojang.brigadier.CommandDispatcher;
import com.mojang.brigadier.context.CommandContext;
import com.mojang.brigadier.exceptions.CommandSyntaxException;

import dev.doctor4t.wathe.api.Role;
import dev.doctor4t.wathe.cca.GameWorldComponent;
import net.minecraft.server.command.CommandManager;
import net.minecraft.server.command.ServerCommandSource;
import net.minecraft.server.network.ServerPlayerEntity;
import net.minecraft.server.world.ServerWorld;
import net.minecraft.text.Text;
import net.minecraft.text.MutableText;

public class DisplayRosterCommand {
    public static void register(CommandDispatcher<ServerCommandSource> dispatcher) {
        dispatcher.register(CommandManager.literal("displayRoster").executes((DisplayRosterCommand::execute)));
    }

    private static int execute(CommandContext<ServerCommandSource> context) throws CommandSyntaxException {
        ServerWorld serverWorld = context.getSource().getWorld();
        WorldModifierComponent worldModifierComponent = WorldModifierComponent.KEY.get(serverWorld);
        GameWorldComponent gameWorldComponent = GameWorldComponent.KEY.get(serverWorld);

        final MutableText message = Text.empty();
        List<ServerPlayerEntity> players = serverWorld.getPlayers();
        for(ServerPlayerEntity player : players){
            Role role = gameWorldComponent.getRole(player.getUuid());
            Text roleName = Harpymodloader.getRoleName(role);
            ArrayList<Modifier> modifiers = worldModifierComponent.getModifiers(player.getUuid());
            message.append(player.getDisplayName()).append(" [");
            message.append(roleName).append("]: ");
            for(Modifier mod : modifiers){
                message.append(mod.getName()).append(", ");
            }
            message.append("\n");
        }
        context.getSource().sendMessage(message);
        return 1;
    }
}
