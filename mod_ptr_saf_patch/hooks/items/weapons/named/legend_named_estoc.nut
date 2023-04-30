::mods_hookExactClass("items/weapons/named/legend_named_estoc", function(o) {

	local create = o.create;
	o.create = function()
	{
		create();
		this.m.ItemType = this.Const.Items.ItemType.Named | this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.setCategories("Sword/Fencing, Two-Handed");
		this.addWeaponType(this.Const.Items.WeaponType.BFFencing);
	}

	o.onDeserialize <- function( _in ) {
		this.named_weapon.onDeserialize(_in);
		::PTRSAFPatch.Mod.Debug.printLog("Patching 2H Estoc: deserializing legend_named_estoc -> " + this.getName());
		this.m.ItemType = this.Const.Items.ItemType.Named | this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.setCategories("Sword/Fencing, Two-Handed");
		this.addWeaponType(this.Const.Items.WeaponType.BFFencing);
	}

});