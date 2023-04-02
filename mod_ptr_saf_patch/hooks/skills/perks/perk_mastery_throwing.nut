::mods_hookExactClass("skills/perks/perk_mastery_throwing", function(o) {
	o.onAnySkillUsed = function( _skill, _targetEntity, _properties )
	{
		// legend_throw_knife is a ranged skill and should pass this check
		if (_targetEntity == null || !_skill.isRanged()) return;

		local weapon = this.getContainer().getActor().getMainhandItem();
		// legend_throw_knife can be performed even if the character is holding a melee weapon, so we need to handle this
		if ((weapon == null || !weapon.isWeaponType(::Const.Items.WeaponType.Throwing)) && !_skill.getID()=="actives.legend_throw_knife") return;

		// ::PTRSAFPatch.Mod.Debug.printLog("Knifeplay passed Throwing checks");

		local actor = this.getContainer().getActor();
		local distance = _targetEntity.getTile().getDistanceTo(actor.getTile());
		if (distance <= 3)
		{
			_properties.DamageTotalMult *= 1.2;
			_properties.RangedSkill += ::Math.floor(0.25 * actor.getCurrentProperties().getMeleeSkill() * (distance == 2 ? 1.0 : 0.5));
		}
	}
});