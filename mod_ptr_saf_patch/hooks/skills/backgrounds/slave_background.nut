// Only adding FistsClassTree. Everything else unchanged.
::mods_hookExactClass("skills/backgrounds/slave_background", function(o) {
	local create = o.create;
	o.create = function()
	{
		create();

		this.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.PauperProfessionTree
			],
			Class = [
				::Const.Perks.FistsClassTree // reintroduce reworked Unarmed tree
			]
		};
	}
});
