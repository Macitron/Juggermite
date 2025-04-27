global function Init_Juggermite

void function Init_Juggermite() {
    AddCallback_OnTitanGetsNewTitanLoadout(ApplyScorchPassives)
}

void function ApplyScorchPassives(entity titan, TitanLoadoutDef loadout) {
    entity soul = titan.GetTitanSoul()
    if (!IsValid(soul)) // Ejecting
        return

    if (loadout.titanClass != "scorch")
        return

    entity weapon
    array<string> mods

    // Tempered Plating
    GivePassive(soul, ePassives.PAS_SCORCH_SELFDMG)
    soul.SetPreventCrits(true)

    // Wildfire Launcher
    weapon = titan.GetMainWeapons()[0]
    mods = weapon.GetMods()
    if (!mods.contains("pas_scorch_weapon")) {
        mods.append("pas_scorch_weapon")
        weapon.SetMods(mods)
    }

    // Inferno Shield
    weapon = titan.GetOffhandWeapon(OFFHAND_LEFT)
    mods = weapon.GetMods()
    if (!mods.contains("pas_scorch_shield")) {
        mods.append("pas_scorch_shield")
        weapon.SetMods(mods)
    }

    // Fuel for the Fire
    weapon = titan.GetOffhandWeapon(OFFHAND_RIGHT)
    mods = weapon.GetMods()
    if (!mods.contains("pas_scorch_firewall")) {
        mods.append("pas_scorch_firewall")
        weapon.SetMods(mods)
    }

    // Scorched Earth
    weapon = titan.GetOffhandWeapon(OFFHAND_EQUIPMENT)
    mods = weapon.GetMods()
    if (!mods.contains("pas_scorch_flamecore")) {
        mods.append("pas_scorch_flamecore")
        weapon.SetMods(mods)
    }

    printt("applied all scorch passives")
}
