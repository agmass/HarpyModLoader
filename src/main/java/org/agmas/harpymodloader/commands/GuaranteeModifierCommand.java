package org.agmas.harpymodloader.commands;

import org.agmas.harpymodloader.Harpymodloader;
import org.agmas.harpymodloader.commands.argument.ModifierArgumentType;
import org.agmas.harpymodloader.modifiers.Modifier;

import com.mojang.brigadier.CommandDispatcher;
import com.mojang.brigadier.arguments.IntegerArgumentType;
import com.mojang.brigadier.context.CommandContext;
import com.mojang.brigadier.exceptions.CommandSyntaxException;

import net.minecraft.server.command.CommandManager;
import net.minecraft.server.command.ServerCommandSource;
import net.minecraft.text.HoverEvent;
import net.minecraft.text.MutableText;
import net.minecraft.text.Text;

public class GuaranteeModifierCommand {
    public static void register(CommandDispatcher<ServerCommandSource> dispatcher) {
        dispatcher.register(CommandManager.literal("guaranteeModifier")
            .requires(serverCommandSource -> serverCommandSource.hasPermissionLevel(2))
                    .then(CommandManager.argument("modifier", ModifierArgumentType.create())
                        .then(CommandManager.argument("count", IntegerArgumentType.integer())
                            .executes(GuaranteeModifierCommand::execute))));
    }

    private static int execute(CommandContext<ServerCommandSource> context) throws CommandSyntaxException {
        Modifier modifier = ModifierArgumentType.getModifier(context, "modifier");
        int count = IntegerArgumentType.getInteger(context, "count");
        Harpymodloader.addToGuaranteedModifiers(modifier, count);
        final MutableText modifierName = modifier.getName(true).styled(style ->
                style.withHoverEvent(new HoverEvent(HoverEvent.Action.SHOW_TEXT, Text.literal(modifier.identifier().toString()))));
        context.getSource().sendFeedback(() -> Text.translatable("commands.guaranteeModifier.success", modifierName), true);
        context.getSource().sendMessage(Text.translatable("commands.guaranteeModifier.success", modifierName));
        return 1;
    }
}
