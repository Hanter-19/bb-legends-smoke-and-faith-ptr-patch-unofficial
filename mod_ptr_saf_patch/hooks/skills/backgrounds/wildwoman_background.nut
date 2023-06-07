// Only adding FistsClassTree. Everything else unchanged.
::mods_hookExactClass("skills/backgrounds/wildwoman_background", function(o) {
	local create = o.create;
	o.create = function()
	{
		create();

		this.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.WildlingProfessionTree
			],
			Styles = [
				::Const.Perks.TwoHandedTree
			],
			Class = [
				::Const.Perks.FistsClassTree // reintroduce reworked Unarmed tree
			]
		};
	}
});
