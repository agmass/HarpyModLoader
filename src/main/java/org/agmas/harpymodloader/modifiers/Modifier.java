package org.agmas.harpymodloader.modifiers;

import dev.doctor4t.wathe.api.Role;
import net.minecraft.text.MutableText;
import net.minecraft.text.Text;
import net.minecraft.util.Identifier;
import java.util.ArrayList;

public class Modifier {

    public Identifier identifier;
    public int color;
    public ArrayList<Role> cannotBeAppliedTo;
    public ArrayList<Role> canOnlyBeAppliedTo;
    public boolean killerOnly;
    public boolean civilianOnly;

    public Modifier(Identifier identifier, int color, ArrayList<Role> cannotBeAppliedTo, ArrayList<Role> canOnlyBeAppliedTo, boolean killerOnly, boolean civilianOnly) {
        this.identifier = identifier;
        this.color = color;
        this.cannotBeAppliedTo = cannotBeAppliedTo;
        this.canOnlyBeAppliedTo = canOnlyBeAppliedTo;
        this.killerOnly = killerOnly;
        this.civilianOnly = civilianOnly;
    }

    public Identifier identifier() {
        return this.identifier;
    }

    public MutableText getName() {
        return getName(false);
    }

    public MutableText getName(boolean color) {
        final MutableText text = Text.translatable("announcement.modifier." + identifier().toTranslationKey());
        if (color) {
            return text.withColor(color());
        }
        return text;
    }

    public int color() {
        return this.color;
    }

    public ArrayList<Role> canOnlyBeAppliedTo() {
        return canOnlyBeAppliedTo;
    }

    public ArrayList<Role> cannotBeAppliedTo() {
        return cannotBeAppliedTo;
    }

    public void setCannotBeAppliedTo(ArrayList<Role> cannotBeAppliedTo) {
        this.cannotBeAppliedTo = cannotBeAppliedTo;
    }

    public void setCanOnlyBeAppliedTo(ArrayList<Role> canOnlyBeAppliedTo) {
        this.canOnlyBeAppliedTo = canOnlyBeAppliedTo;
    }
}
