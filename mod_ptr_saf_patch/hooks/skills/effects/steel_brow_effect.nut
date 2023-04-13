::mods_hookExactClass("skills/effects/steel_brow_effect", function(o) {

	local create = o.create;
	o.create = function() {
		create();
		this.m.Description = "Will turn any stun attacks made against you into dazes instead. Also grants passive immunity to Cull.";
	}

	// Add tooltip for PTR Steel Brow's immunity to Cull
	local getTooltip = o.getTooltip;
	o.getTooltip = function() {
		local ret = getTooltip();
		ret.push(
			{
				id = 10,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "Grants passive immunity to Cull"
			}
		);
		return ret
	}

});