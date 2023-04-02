// Test CCA
::mods_hookExactClass("skills/perks/perk_close_combat_archer", function(o) {

	o.onAnySkillUsed = function( _skill, _targetEntity, _properties )
	{
		// Override isEnabled() to check if the skill is Assassin Knifeplay
		if (_targetEntity == null || (!this.isEnabled() && !_skill.getID()=="actives.legend_throw_knife"))
		{
			return;
		}

		local d = this.getContainer().getActor().getTile().getDistanceTo(_targetEntity.getTile());

		// ::PTRSAFPatch.Mod.Debug.printLog("CCA.onAnySkillUsed activated");

		if (d <= 2)
		{
			_properties.DamageTotalMult *= 1.4;
		}
		else if (d <= 3)
		{
			_properties.DamageTotalMult *= 1.2;
		}
	}

	o.onGetHitFactors <- function( _skill, _targetTile, _tooltip )
	{
		local targetEntity = _targetTile.getEntity();
		if (targetEntity != null)
		{
			// Override isEnabled() to check if the skill is Assassin Knifeplay
			if (_skill.isAttack() && _skill.isRanged() && (this.isEnabled() || _skill.getID()=="actives.legend_throw_knife") && targetEntity.getTile().getDistanceTo(this.getContainer().getActor().getTile()) <= 3)
			{
				_tooltip.push({
					icon = "ui/tooltips/positive.png",
					text = this.getName()
				});
			}
		}
	}

	o.onTargetHit <- function( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		// Override isEnabled() to check if the skill is Assassin Knifeplay
		if (!_targetEntity.isAlive() || _targetEntity.isDying() || (!this.isEnabled() && !_skill.getID()=="actives.legend_throw_knife") || !_skill.isRanged())
		{
			return;
		}

		local distance = this.getContainer().getActor().getTile().getDistanceTo(_targetEntity.getTile());
		if (distance > 3)
		{
			return;
		}

		local actor = this.getContainer().getActor();

		if (_skill.getDamageType().contains(::Const.Damage.DamageType.Blunt))
		{
			local chance = distance == 2 ? 100 : 50;
			local roll = this.Math.rand(1, 100);

			if (roll <= chance)
			{
				local staggeredEffect = _targetEntity.getSkills().getSkillByID("effects.staggered");
				if (staggeredEffect != null && !_targetEntity.getCurrentProperties().IsImmuneToStun)
				{
					local effect = this.new("scripts/skills/effects/stunned_effect");
					_targetEntity.getSkills().add(effect);
					effect.m.TurnsLeft = 1;
					if (!actor.isHiddenToPlayer() && _targetEntity.getTile().IsVisibleForPlayer)
					{
						this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " has stunned " + this.Const.UI.getColorizedEntityName(_targetEntity) + " for " + effect.m.TurnsLeft + " turn");
					}
				}
				else
				{
					local effect = this.new("scripts/skills/effects/staggered_effect");
					_targetEntity.getSkills().add(effect);
					effect.m.TurnsLeft = 1;
					if (!actor.isHiddenToPlayer() && _targetEntity.getTile().IsVisibleForPlayer)
					{
						this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " has staggered " + this.Const.UI.getColorizedEntityName(_targetEntity) + " for " + effect.m.TurnsLeft + " turn");
					}
				}
			}
		}
		else if (_skill.getDamageType().contains(::Const.Damage.DamageType.Piercing))
		{
			local chance = distance == 2 ? 100 : 50;
			local roll = this.Math.rand(1, 100);

			if (roll <= chance)
			{
				local effect = ::new("scripts/skills/effects/ptr_arrow_to_the_knee_debuff_effect");
				_targetEntity.getSkills().add(effect);
				if (!actor.isHiddenToPlayer() && _targetEntity.getTile().IsVisibleForPlayer)
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " has impaled " + this.Const.UI.getColorizedEntityName(_targetEntity) + " for " + effect.m.TurnsLeft + " turns");
				}
			}
		}
		else if (_skill.getDamageType().contains(::Const.Damage.DamageType.Cutting))
		{
			// ::PTRSAFPatch.Mod.Debug.printLog("Knifeplay passed White of their Eyes Cutting checks");
			local chance = distance == 2 ? 100 : 50;
			local roll = this.Math.rand(1, 100);

			if (roll <= chance)
			{
				_targetEntity.getSkills().add(::new("scripts/skills/effects/overwhelmed_effect"));
			}
		}
	}
});