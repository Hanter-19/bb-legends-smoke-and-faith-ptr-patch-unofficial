::PerkGroupTest <- {

	simulateThenCheckBackgroundForPerkGroup = function ( _backgroundStr , _perkGroupStr, _nTrials ) {
		// @TODO
		return true;
	}

	/*
	*	A simulator that creates a new character of an input of possible backgrounds _backgroundStrArr
	*	for _nTrials number of times, checks if the resultant character's Perk Tree contains the input Perk _perkIDOrConstStr,
	*	then returns a percentage of times the character had the input Perk.
	*
	*	Run this only in the World Map
	*
	*	Can simulate multiple backgrounds at once.
	*	The input Perk can be in the form of the ID or Const value as stored in ::Const.Perks.PerkDefObjects
	*
	*	Example usage in Dev Console:
	*	::MSU.Log.printData(::PerkGroupTest.simulateThenCheckBackgroundForPerk(["assassin_background"],"LegendAssassinate",10));
	*
	*	_backgroundStrArr: An array of strings, e.g. ["assassin_background"]
	*	_perkIDOrConstStr: A string, e.g. "perk.legend_assassinate" or "LegendAssassinate"
	*	_nTrialsInt: An integer, e.g. 100
	*/
	simulateThenCheckBackgroundForPerk = function ( _backgroundStrArr , _perkIDOrConstStr, _nTrialsInt ) {
		
		local settlement = ::World.Contracts.get().getOpenContracts()[0].getHome().get();
		local roster = ::World.getRoster(settlement.getID());
		local success = 0;
		local counter = _nTrialsInt;
		while (counter > 0){

			local character = roster.create("scripts/entity/tactical/player");
			local bg = _backgroundStrArr;
			character.setStartValuesEx(bg);
			foreach (tier in character.getBackground().m.CustomPerkTree) {
				foreach (i in tier) {
					if( _perkIDOrConstStr==::Const.Perks.PerkDefObjects[i].ID || _perkIDOrConstStr==::Const.Perks.PerkDefObjects[i].Const ) {
						success += 1;
					}
				}
			}
			roster.clear(); // cleanup
			counter -= 1;
		}
		return success * 1.0 / _nTrialsInt * 100;
	}

};
