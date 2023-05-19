/* 	Override PTR's overrride of buildPerkTree and rebuildPerkTree 
*	to remove the check for ::Legends.Mod.ModSettings.getSetting("PerkTrees").getValue()
*	because Legends 16.3.3 has removed the setting (Dynamic Perks is now default)
*/
::mods_hookExactClass("skills/backgrounds/character_background", function(o) {

	o.buildPerkTree = function()
	{
		local a = {
			Hitpoints = [
				0,
				0
			],
			Bravery = [
				0,
				0
			],
			Stamina = [
				0,
				0
			],
			MeleeSkill = [
				0,
				0
			],
			RangedSkill = [
				0,
				0
			],
			MeleeDefense = [
				0,
				0
			],
			RangedDefense = [
				0,
				0
			],
			Initiative = [
				0,
				0
			]
		};

		if (this.m.PerkTree != null)
		{
			return a;
		}

		if (this.m.CustomPerkTree == null)
		{
			local result = this.Const.Perks.GetDynamicPerkTree(this.getPerkTreeDynamicMins(), this.m.PerkTreeDynamic, this.getContainer().getActor());
			this.m.CustomPerkTree = result.Tree;
			a = result.Attributes;
		}

		local pT = this.Const.Perks.BuildCustomPerkTree(this.m.CustomPerkTree);
		this.m.PerkTree = pT.Tree;
		this.m.PerkTreeMap = pT.Map;

		local origin = this.World.Assets.getOrigin();
		if (origin != null)
		{
			this.World.Assets.getOrigin().onBuildPerkTree(this);
		}

		return a;
	}

	o.rebuildPerkTree = function (_tree)
	{
		this.m.CustomPerkTree = _tree;

		// TODO: Might need looking into to make sure if we should be passing this.m.PerkTreeDynamic or something else
		this.Const.Perks.GetDynamicPerkTree(this.getPerkTreeDynamicMins(), this.m.PerkTreeDynamic, this.getContainer().getActor());
		this.m.CustomPerkTree = this.Const.Perks.MergeDynamicPerkTree(_tree, this.m.CustomPerkTreeMap);

		local pT = this.Const.Perks.BuildCustomPerkTree(this.m.CustomPerkTree);
		this.m.PerkTree = pT.Tree;
		this.m.PerkTreeMap = pT.Map;
	}

});