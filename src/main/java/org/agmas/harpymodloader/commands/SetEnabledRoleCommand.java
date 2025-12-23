package org.agmas.harpymodloader.commands;

import com.mojang.brigadier.CommandDispatcher;
import com.mojang.brigadier.arguments.BoolArgumentType;
import com.mojang.brigadier.context.CommandContext;
import com.mojang.brigadier.exceptions.CommandSyntaxException;
import com.mojang.brigadier.exceptions.SimpleCommandExceptionType;
import dev.doctor4t.wathe.api.Role;
import net.minecraft.server.command.CommandManager;
import net.minecraft.server.command.ServerCommandSource;
import net.minecraft.text.HoverEvent;
import net.minecraft.text.Text;
import org.agmas.harpymodloader.Harpymodloader;
import org.agmas.harpymodloader.commands.argument.RoleArgumentType;
import org.agmas.harpymodloader.config.HarpyModLoaderConfig;

public class SetEnabledRoleCommand {
    public static final SimpleCommandExceptionType ROLE_UNCHANGED_EXCEPTION = new SimpleCommandExceptionType(Text.translatable("commands.setenabledrole.unchanged"));


    public static void register(CommandDispatcher<ServerCommandSource> dispatcher) {
        dispatcher.register(CommandManager.literal("setEnabledRole")
                .requires(serverCommandSource -> serverCommandSource.hasPermissionLevel(2))
                .then(CommandManager.argument("role", RoleArgumentType.skipVanilla())
                        .then(CommandManager.argument("enabled", BoolArgumentType.bool())
                                .executes(SetEnabledRoleCommand::execute))
                )
        );
    }

    private static int execute(CommandContext<ServerCommandSource> context) throws CommandSyntaxException {
        Role role = RoleArgumentType.getRole(context, "role");
        boolean enabled = BoolArgumentType.getBool(context, "enabled");
        HarpyModLoaderConfig.HANDLER.save();
        String roleId = role.identifier().toString();
        boolean disabled = HarpyModLoaderConfig.HANDLER.instance().disabled.contains(roleId);
        Text roleText = Harpymodloader.getRoleName(role).withColor(role.color()).styled(style -> style.withHoverEvent(new HoverEvent(HoverEvent.Action.SHOW_TEXT, Text.literal(roleId))));

        if (disabled && enabled) {
            HarpyModLoaderConfig.HANDLER.instance().disabled.remove(roleId);
            context.getSource().sendFeedback(() -> Text.translatable("commands.setenabledrole.enable.success", roleText), true);
        } else if (!disabled && !enabled) {
            HarpyModLoaderConfig.HANDLER.instance().disabled.add(roleId);
            context.getSource().sendFeedback(() -> Text.translatable("commands.setenabledrole.disable.success", roleText), true);
        } else throw ROLE_UNCHANGED_EXCEPTION.create();

        HarpyModLoaderConfig.HANDLER.save();
        return 1;
    }
}
