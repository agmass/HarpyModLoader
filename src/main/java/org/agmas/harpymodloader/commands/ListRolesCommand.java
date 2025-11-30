package org.agmas.harpymodloader.commands;

import com.mojang.brigadier.CommandDispatcher;
import dev.doctor4t.trainmurdermystery.api.Role;
import dev.doctor4t.trainmurdermystery.api.TMMRoles;
import net.minecraft.server.command.CommandManager;
import net.minecraft.server.command.ServerCommandSource;
import net.minecraft.text.MutableText;
import net.minecraft.text.Text;
import net.minecraft.util.Colors;
import org.agmas.harpymodloader.config.HarpyModLoaderConfig;

public class ListRolesCommand {
    public static void register(CommandDispatcher<ServerCommandSource> dispatcher) {
        dispatcher.register(CommandManager.literal("listRoles").executes((context -> execute(context.getSource()))));
    }
    private static int execute(ServerCommandSource source) {
        HarpyModLoaderConfig.HANDLER.save();
        MutableText message = Text.literal("Roles:");
        Text enabled = Text.literal("[Enabled] ").withColor(Colors.GREEN);
        Text disabled = Text.literal("[Disabled] ").withColor(Colors.RED);
        for (Role role : TMMRoles.ROLES) {
            message.append("\n");
            String roleName = role.identifier().getPath();
            if (HarpyModLoaderConfig.HANDLER.instance().disabled.contains(roleName)) message.append(disabled);
            else message.append(enabled);
            message.append(Text.literal(roleName).withColor(role.color()));
        }
        source.sendMessage(message);
        return 1;
    }
}
