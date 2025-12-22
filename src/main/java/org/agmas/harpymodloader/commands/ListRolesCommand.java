package org.agmas.harpymodloader.commands;

import com.mojang.brigadier.CommandDispatcher;
import com.mojang.brigadier.context.CommandContext;
import dev.doctor4t.wathe.api.Role;
import dev.doctor4t.wathe.api.WatheRoles;
import net.minecraft.server.command.CommandManager;
import net.minecraft.server.command.ServerCommandSource;
import net.minecraft.text.MutableText;
import net.minecraft.text.Text;
import net.minecraft.util.Colors;
import org.agmas.harpymodloader.Harpymodloader;
import org.agmas.harpymodloader.config.HarpyModLoaderConfig;
import org.agmas.harpymodloader.modifiers.HMLModifiers;
import org.agmas.harpymodloader.modifiers.Modifier;

public class ListRolesCommand {
    public static void register(CommandDispatcher<ServerCommandSource> dispatcher) {
        dispatcher.register(
                CommandManager.literal("listRoles")
                        .executes((ListRolesCommand::execute))
        );
    }

    private static int execute(CommandContext<ServerCommandSource> context) {
        HarpyModLoaderConfig.HANDLER.save();
        MutableText message = Text.literal("Roles:");
        Text enabled = Text.literal("[Enabled] ").withColor(Colors.GREEN);
        Text disabled = Text.literal("[Disabled] ").withColor(Colors.RED);
        for (Role role : WatheRoles.ROLES) {
            message.append("\n");
            String roleId = role.identifier().toString();
            final MutableText roleName = Harpymodloader.getRoleName(role);
            if (HarpyModLoaderConfig.HANDLER.instance().disabled.contains(roleId)) message.append(disabled);
            else message.append(enabled);
            message.append(Text.literal(roleId).withColor(role.color()).append(" ").append(roleName));
        }
        message = message.append("\n\nModifiers:").withColor(Colors.GREEN);
        for (Modifier modifier : HMLModifiers.MODIFIERS) {
            message.append("\n");
            String roleId = modifier.identifier().toString();
            final MutableText modifierName = modifier.getName(true);
            if (HarpyModLoaderConfig.HANDLER.instance().disabledModifiers.contains(roleId)) message.append(disabled);
            else message.append(enabled);
            message.append(Text.literal(roleId).withColor(modifier.color()).append(" ").append(modifierName));
        }
        context.getSource().sendMessage(message);
        return 1;
    }
}
