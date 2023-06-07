// Only adding FistsClassTree. Everything else unchanged
::mods_hookExactClass("skills/backgrounds/brawler_background", function(o) {
	local create = o.create;
	o.create = function()
	{
		create();

		this.m.PerkTreeDynamic = {
			Class = [
				::Const.Perks.FistsClassTree // reintroduce reworked Unarmed tree
			]
		};
	}
});
