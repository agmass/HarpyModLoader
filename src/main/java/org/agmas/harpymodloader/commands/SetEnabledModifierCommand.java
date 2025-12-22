package org.agmas.harpymodloader.commands;

import com.mojang.brigadier.CommandDispatcher;
import com.mojang.brigadier.arguments.BoolArgumentType;
import com.mojang.brigadier.context.CommandContext;
import com.mojang.brigadier.exceptions.CommandSyntaxException;
import com.mojang.brigadier.exceptions.SimpleCommandExceptionType;
import net.minecraft.server.command.CommandManager;
import net.minecraft.server.command.ServerCommandSource;
import net.minecraft.text.Text;
import org.agmas.harpymodloader.commands.argument.ModifierArgumentType;
import org.agmas.harpymodloader.config.HarpyModLoaderConfig;
import org.agmas.harpymodloader.modifiers.Modifier;

public class SetEnabledModifierCommand {
    public static final SimpleCommandExceptionType ROLE_UNCHANGED_EXCEPTION = new SimpleCommandExceptionType(Text.translatable("commands.setenabledrole.unchanged"));


    public static void register(CommandDispatcher<ServerCommandSource> dispatcher) {
        dispatcher.register(
                CommandManager.literal("setEnabledModifier")
                        .requires(serverCommandSource -> serverCommandSource.hasPermissionLevel(2))
                        .then(CommandManager.argument("modifier", ModifierArgumentType.create())
                                .then(CommandManager.argument("enabled", BoolArgumentType.bool())
                                        .executes(SetEnabledModifierCommand::execute))
                        )
        );
    }

    private static int execute(CommandContext<ServerCommandSource> context) throws CommandSyntaxException {
        boolean enabled = BoolArgumentType.getBool(context, "enabled");
        Modifier modifier = ModifierArgumentType.getModifier(context, "modifier");
        HarpyModLoaderConfig.HANDLER.save();
        final String modifierId = modifier.identifier().toString();
        boolean disabled = HarpyModLoaderConfig.HANDLER.instance().disabledModifiers.contains(modifierId);
        Text modifierName = modifier.getName(true);

        if (disabled && enabled) {
            HarpyModLoaderConfig.HANDLER.instance().disabledModifiers.remove(modifierId);
            context.getSource().sendFeedback(() -> Text.translatable("commands.setenabledrole.enable.success", modifierName), true);
        } else if (!disabled && !enabled) {
            HarpyModLoaderConfig.HANDLER.instance().disabledModifiers.add(modifierId);
            context.getSource().sendFeedback(() -> Text.translatable("commands.setenabledrole.disable.success", modifierName), true);
        } else {
            throw ROLE_UNCHANGED_EXCEPTION.create();
        }

        HarpyModLoaderConfig.HANDLER.save();
        return 1;
    }
}
