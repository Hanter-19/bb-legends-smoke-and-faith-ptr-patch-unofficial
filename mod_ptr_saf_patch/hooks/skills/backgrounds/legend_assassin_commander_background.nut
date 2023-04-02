::mods_hookExactClass("skills/backgrounds/legend_assassin_commander_background", function(o) {
	local create = o.create;
	o.create = function()
	{
		create();
		this.m.CustomPerkTree = ::PTR.HooksHelper.clearCustomPerkTree(this.m.CustomPerkTree);

		::PTR.HooksHelper.addPerkTreesToCustomPerkTree(this.m.CustomPerkTree,
			[
				::Const.Perks.DaggerTree,
				::Const.Perks.SwordTree,
				::Const.Perks.LightArmorTree,
				::Const.Perks.ViciousTree,
				::Const.Perks.UnstoppableTree,
				::Const.Perks.DeviousTree,
				::Const.Perks.TrapperClassTree,
				::Const.Perks.MaceTree,
				// Add newly reworked Legends AssassinMagicTree
				::Const.Perks.AssassinMagicTree
			]
		);

		// Removed LegendSpecialistKnifeSkill
		::PTR.HooksHelper.addPerksToCustomPerkTree(1, this.m.CustomPerkTree, [
				::Const.Perks.PerkDefs.BagsAndBelts,
				::Const.Perks.PerkDefs.Pathfinder,
				::Const.Perks.PerkDefs.LegendAlert,
				::Const.Perks.PerkDefs.LegendHairSplitter,
				::Const.Perks.PerkDefs.PTRDeepCuts,
				::Const.Perks.PerkDefs.Recover,
				::Const.Perks.PerkDefs.NineLives
			]
		);

		// Removed LegendSpecialistKnifeDamage
		::PTR.HooksHelper.addPerksToCustomPerkTree(2, this.m.CustomPerkTree, [
				::Const.Perks.PerkDefs.PTRBetweenTheEyes,
				::Const.Perks.PerkDefs.Footwork,
				::Const.Perks.PerkDefs.QuickHands,
				::Const.Perks.PerkDefs.PTRSmallTarget,
				::Const.Perks.PerkDefs.PTRMenacing,
				::Const.Perks.PerkDefs.FortifiedMind
			]
		);

		// No changes
		::PTR.HooksHelper.addPerksToCustomPerkTree(3, this.m.CustomPerkTree, [
				::Const.Perks.PerkDefs.LegendFavouredEnemySoutherner,
				::Const.Perks.PerkDefs.Sprint,
				::Const.Perks.PerkDefs.PTRVigilant,
				::Const.Perks.PerkDefs.PTRPatternRecognition,
				::Const.Perks.PerkDefs.Rotation,
				::Const.Perks.PerkDefs.Overwhelm
			]
		);

		// Added throwing mastery to synergize with Knifeplay (LegendKnifePlay in the AssassinMagicTree)
		// Removed camouflage (LegendHidden) as it has been retired from Legends
		::PTR.HooksHelper.addPerksToCustomPerkTree(4, this.m.CustomPerkTree, [
				::Const.Perks.PerkDefs.PTROffhandTraining,
				::Const.Perks.PerkDefs.LegendPoisonImmunity,
				::Const.Perks.PerkDefs.HeadHunter,
				::Const.Perks.PerkDefs.Duelist,
				::Const.Perks.PerkDefs.BoondockBlade,
				::Const.Perks.PerkDefs.PTRKnowTheirWeakness,
				::Const.Perks.PerkDefs.LegendBackflip,
				::Const.Perks.PerkDefs.SpecThrowing
			]
		);

		// No changes
		::PTR.HooksHelper.addPerksToCustomPerkTree(5, this.m.CustomPerkTree, [
				::Const.Perks.PerkDefs.PTRTraumaSurvivor,
				::Const.Perks.PerkDefs.PTRFreshAndFurious,
				::Const.Perks.PerkDefs.PTRVigorousAssault,
				::Const.Perks.PerkDefs.LegendClarity,
				::Const.Perks.PerkDefs.LegendTwirl
			]
		);

		// Removed LegendAssassinate (now part of AssassinMagicTree Perk Group)
		::PTR.HooksHelper.addPerksToCustomPerkTree(6, this.m.CustomPerkTree, [
				::Const.Perks.PerkDefs.Backstabber,
				::Const.Perks.PerkDefs.BattleFlow,
				::Const.Perks.PerkDefs.Rebound,
				::Const.Perks.PerkDefs.PTRPrimalFear,
				::Const.Perks.PerkDefs.LegendTumble
			]
		);

		// Re-introduced CloseCombatArcher (White of their Eyes in PTR) to synergize with Knifeplay
		// Removed TunnelVision due to too much overlap with Night Raider
		::PTR.HooksHelper.addPerksToCustomPerkTree(7, this.m.CustomPerkTree, [
				::Const.Perks.PerkDefs.PTRVanguardDeployment,
				::Const.Perks.PerkDefs.BFFencer,
				::Const.Perks.PerkDefs.PTRBully,
				::Const.Perks.PerkDefs.LegendFavouredEnemyNoble,
				::Const.Perks.PerkDefs.PerfectFocus,
				::Const.Perks.PerkDefs.LegendFavouredEnemySwordmaster,
				::Const.Perks.PerkDefs.CloseCombatArcher
			]
		);
	}
});