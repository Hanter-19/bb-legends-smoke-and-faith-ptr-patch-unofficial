# 0.2.0
## Legends 16.3.3
- **REQUIRES LEGENDS 16.3.3 AND ABOVE ONLY**
    - If you are running any older version of Legends, do **not** use this version (and future versions) of this patch.
- Legends team have decided to remove the "dynamic perks" option and make it enabled by default from now on to improve maintainability.
- This change broke PTR which checks for that option.
- This fix will patch PTR code to no longer check for that option, which should make PTR playable with Legends 16.3.3
- Super duper big thanks to Legends dev James Luong for bringing this to my attention, and to Emo Used HM01 for pointing me to the message I missed!!!
- Note that the other feature changes in Legends 16.3.3, such as background perks, may still be overwritten by PTR 2.1.27 until I release another patch to port those changes over.

# 0.1.3
## Estoc 2H Revert
- Revert Estoc (and named Estoc) to 2H weapon
    - This means that characters who have the fencer perk (including enemies) will no longer get 3 AP Estoc Lunges

# 0.1.2
## Steel Brow Rework
- Legends reworked Steel Brow in 16.2.4 to convert Stun to Daze whenever a character with Steel Brow receives a Stun.
- This is an additional effect on top of PTR's Steel Brow changes (passive immunity to Cull).
- Updated the perk and effect descriptions/tooltips to reflect this.
- Note that as of Legends 16.2.4, the new Steel Brow effect mini icon above the character's head in battle is still using a placeholder Lone Wolf mini icon (same for the new Lurker effect for Assassins).

# 0.1.1
Fixed a small little bug that CAUSED THIS ENTIRE PATCH TO NOT WORK.

Special thanks to Seafood for reporting the bug on the Discord.

# 0.1.0
This unofficial patch aims to bring PTR (2.1.27) up-to-date with the latest Legends (16.2.3 Smoke and Faith).

For this first pre-release build, I will focus on the changes to the Assassin.

## Adjustments to Perks
Various perks require adjustments in PTR following the changes in Legends.

### Throwing Mastery Perk
- Add handling for new Assassin Knifeplay skill
    - PTR overwrites the Legends `perk_mastery_throwing.onAnySkillUsed()` function. To accommodate this new skill I have updated PTR's implementation to enable its effects on Knifeplay.

### Whites of their Eyes Perk
- Add handling for Whites of their Eyes (PTR version of Close Combat Archer)
    - In a similar fashion to the Throwing Mastery Perk, I have made adjustments to enable its effects on Knifeplay.

### Camouflage Perk
- Legends has retired this perk as it does not work correctly. I have likewise removed it from PTR
- Affected Perk Groups:
    - Devious Trait Perk Group
    - Legend Assassin Background
    - Legend Assassin Commander Background
    - Legend Druid Background
    - Legend Druid Commander Background
    - Legend Ranger Background
    - Legend Ranger Commander Background

## Updating the PTR Assassin Profession Perk Tree
Legends reworked the `AssassinMagicTree` which is common to all Assassin backgrounds. PTR does not use this tree but has its own similar `AssassinProfessionTree`.
I have opted to merge the two trees into an updated `AssassinProfessionTree`

__How to read the table:__
- __Tier__ column is the Tier at which the perk is available in the tree
- __Legends__ column is for the perks from the newly reworked `AssassinMagicTree`
- __PTR__ column is for the perks from the current PTR `AssassinProfessionTree`
- __Result__ column is for the perks in my updated version of PTR's `AssassinProfessionTree`
| Tier | Legends: `AssassinMagicTree` | PTR: `AssassinProfessionTree` | Result: `AssassinProfessionTree` | Notes |
| ---- | ------- | --- | ------ | ----- |
| T1 | Knifeplay | Prisoners Rush | Knifeplay | *(Knifeplay is much more interesting than Prisoners Rush. By removing Prisoners Rush however, this also means that PTR no longer uses it. On the other hand Legends still has it in some Trees)*|
| T2 | Opportunist || Opportunist ||
| T3 | Prepared | Knife Fighting | Prepared | *(Same reasoning as Prisoners Rush)*|
| T4 | | Rotation | Rotation ||
| T5 | Lurker | Twirl | Lurker, Twirl | *(Mobility seems to be an important kit in PTR's interpretation of the Assassin, so I will keep Rotation and Twirl for now, even if this may make the Assassin profession a bit OP with the new perks added)*|
| T6 | Night Raider | Camouflage | Night Raider | *(Camouflage has been retired)* |
| T7 | Assassinate | Assassinate | Assassinate ||


## Assassin Origin Static Perk Tree Patch
Both PTR and Legends make has a static perk tree for the Assassin Commander, which is the Player Avatar for the Assassin Origin.
In this section I will go over how the PTR and Legends versions have been different, and how I will patch the PTR version to bring it in line with the SaF changes.

Note that this only patches `legend_assassin_commander_background`, which means it only affects the player avatar for the Assassin Origin.
This will *not* affect the other Assassin backgrounds, which means any other Assassins recruited will not have these specific changes.
### PTR Perk Groups Assignment
- Keep PTR-assigned Perk Groups as of PTR 2.1.27:
    - DaggerTree
    - SwordTree
    - LightArmorTree
    - ViciousTree
    - UnstoppableTree
    - DeviousTree
    - TrapperClassTree
    - MaceTree
- Added the revamped Assassin Perk Tree introduced in Smoke And Faith (Legends 16.2.3):
    - AssassinMagicTree *(T1: Knifeplay, T2: Opportunist, T3: Prepared, T5: Lurker, T6: Night Raider, T7: Assassinate)*

### Static Perk Tree
__How to read the tables:__ 
- __Legends__ column is Legend's static perks for that tier
- __PTR__ column is PTR's static perks for that tier
- __Result__ column is the result of this Patch (what is hardcoded into the Static Perk Tree)
- Note that these tables do not include perks added by the PTR Perk Groups assigned earlier
    - PTR hardcoded some perks into the static tree even though some of they might already be in the earlier PTR-assigned Perk Groups; that is why they are in the following tables.
    - This table is a reference for how the Static Perk Tree was updated
    - The actual Perks the Assassin Commander will spawn with will be presented in a later table

#### Tier 1

| Legends | PTR | Result | Notes |
| ------- | --- | ------ | ----- |
| *(removed in SaF)* | Prisoners Rush | ~Prisoners Rush~ ||
| Pathfinder | Pathfinder | Pathfinder ||
| Crippling Strikes | *(part of the Vicious Perk Group)* | ~Crippling Strikes~ | *(Exclude from Static Tree as it is handled by PTR Perk Group)* |
| Adrenaline | *(part of the Unstoppable Perk Group)* | ~Adrenaline~ | *(Exclude from Static Tree as it is handled by PTR Perk Group)* |
| Recover | Recover | Recover ||
| Fast Adapatation | *(removed in PTR)* | ~Fast Adapatation~ ||
| Back to Basics | *(removed in PTR)* | ~Back to Basics~ ||
| Colossus | *(removed in PTR)* | ~Colossus~ ||
| Bags and Belts | Bags and Belts | Bags and Belts ||
| Knifeplay | *(part of the new AssassinMagicTree)* | ~Knifeplay~ | *(Exclude from Static Tree as it is handled by PTR Perk Group)* |
| Alert | Alert | Alert ||
| *(added in PTR)* | Hair Splitter | Hair Splitter ||
| *(added in PTR)* | Deep Cuts | Deep Cuts ||
| *(added in PTR)* | Nine Lives | Nine Lives ||

#### Tier 2
| Legends | PTR | Result | Notes |
| ------- | --- | ------ | ----- |
| Backstabber | *(part of the Dagger Perk Group)*  | ~Backstabber~ | *(Exclude from Static Tree as it is handled by PTR Perk Group)* |
| Sprint | *(moved to Tier 3 in PTR)* | ~Sprint~ ||
| Devastating Strikes | *(removed in PTR)* | ~Devastating Strikes~ ||
| Quick Hands| Quick Hands | Quick Hands ||
| Executioner | *(part of the Vicious Perk Group)* | ~Executioner~ | *(Exclude from Static Tree as it is handled by PTR Perk Group)* |
| Bullseye | *(removed in PTR)* | ~Bullseye~ ||
| Hold Out | *(removed in PTR)* | ~Hold Out~ ||
| Opportunist | *(part of the new AssassinMagicTree)* | ~Opportunist~ | *(Exclude from Static Tree as it is handled by PTR Perk Group)* |
| FE: Peasantry | *(removed in PTR)* | ~FE: Peasantry~ ||
| *(added in PTR)* | Between The Eyes | Between The Eyes ||
| *(added in PTR)* | Footwork | Footwork ||
| *(removed in SaF)* | ~Knife Fighting~ | ~Knife Fighting~ ||
| *(added in PTR)* | Small Target | Small Target ||
| *(added in PTR)* | Menacing | Menacing ||
| *(added in PTR)* | Foritifed Mind | Foritifed Mind ||

#### Tier 3
| Legends | PTR | Result | Notes |
| ------- | --- | ------ | ----- |
| Boondock Blade | *(moved to Tier 4 in PTR)* | ~Boondock Blade~ ||
| Hair Splitter | *(moved to Tier 1 in PTR)* | ~Hair Splitter~ ||
| Escape Artist | *(moved to Tier 5 in PTR Trapper Perk Group)* | ~Escape Artist~ | *(Exclude from Static Tree as it is handled by PTR Perk Group)* |
| True Believer | *(removed in PTR)* | ~True Believer~ ||
| Feint | *(removed in PTR)* | ~Feint~ ||
| Debilitate | *(part of the Vicious Perk Group)* | ~Debilitate~ | *(Exclude from Static Tree as it is handled by PTR Perk Group)* |
| Relentless | *(part of the Unstoppable Perk Group)*| ~Relentless~ | *(Exclude from Static Tree as it is handled by PTR Perk Group)* |
| Prepared | *(part of the new AssassinMagicTree)* | ~Prepared~ | *(Exclude from Static Tree as it is handled by PTR Perk Group)* |
| FE: Brigand | *(removed in PTR)* | ~FE: Brigand~ ||
| *(added in PTR)* | FE: Southerner | FE: Southerner ||
| *(originally Tier 2 in Legends)* | Sprint | Sprint ||
| *(added in PTR)* | Vigilant | Vigilant ||
| *(added in PTR)* | Pattern Recognition | Pattern Recognition ||
| *(added in PTR)* | Rotation | Rotation ||
| *(added in PTR)* | Overwhelm | Overwhelm | *(PTR brings this forward from Tier 6 where it normally is in the Dagger Perk Group)* |

#### Tier 4
| Legends | PTR | Result | Notes |
| ------- | --- | ------ | ----- |
| Bow Mastery | *(removed in PTR)* | ~Bow Mastery~ ||
| Throwing Mastery | *(removed in PTR)* | Throwing Mastery | *(I will reintroduce this in PTR as the new Knifeplay perk benefits from Throwing perks)* |
| Crossbow & Firearms Mastery | *(removed in PTR)* | ~Crossbow & Firearms Mastery~ ||
| Poison Mastery | *(removed in PTR)* | ~Poison Mastery~ ||
| Poison Immunity | Poison Immunity | Poison Immunity ||
| Lurker | *(part of the new AssassinMagicTree)* | ~Lurker~ | *(Exclude from Static Tree as it is handled by PTR Perk Group)* |
| FE: Mercenary | *(removed in PTR)* | ~FE: Mercenary~ ||
| *(added in PTR)* | Offhand Training | Offhand Training ||
| *(removed in SaF)* | Camouflage | ~Camouflage~ | *(Legends has retired the Camouflage skill as it does not work properly. We will likewise remove it from PTR)*|
| *(originally Tier 6 in Legends)* | Head Hunter | Head Hunter ||
| *(added in PTR)* | Duelist | Duelist ||
| *(originally Tier 3 in Legends)* | Boondock Blade | Boondock Blade ||
| *(added in PTR)* | Know Their Weakness | Know Their Weakness ||
| *(added in PTR)* | Backflip | Backflip ||

#### Tier 5
| Legends | PTR | Result | Notes |
| ------- | --- | ------ | ----- |
| Push the Advantage | *(removed in PTR)* | ~Push the Advantage~ ||
| Double Strike | *(part of the Dagger Perk Group)* | ~Double Strike~ | *(Exclude from Static Tree as it is handled by PTR Perk Group)* |
| Evasion | *(part of the Devious Perk Group)* | ~Evasion~ | *(Exclude from Static Tree as it is handled by PTR Perk Group)* |
| FE: Noble | *(moved to T7 in PTR)* | ~FE: Noble~ ||
| *(added in PTR)* | Trauma Survivor | Trauma Survivor ||
| *(added in PTR)* | Fresh and Furious | Fresh and Furious ||
| *(added in PTR)* | Vigorous Assault | Vigorous Assault ||
| *(added in PTR)* | Clarity | Clarity ||
| *(added in PTR)* | Twirl | Twirl ||

#### Tier 6
| Legends | PTR | Result | Notes |
| ------- | --- | ------ | ----- |
| Leap | *(removed in PTR)* | ~Leap~ ||
| Wind Reader | *(removed in PTR)* | ~Wind Reader~ ||
| Berserk | *(part of the Vicious Perk Group)* | ~Berserk~ | *(Exclude from Static Tree as it is handled by PTR Perk Group)* |
| Head Hunter | *(moved to Tier 4 in PTR)* |||
| Nimble | *(part of the Light Armor Perk Group)* | ~Nimble~ | *(Exclude from Static Tree as it is handled by PTR Perk Group)* |
| Perfect Fit | *(removed in PTR)* | ~Perfect Fit~ ||
| Night Raider | *(part of the new AssassinMagicTree)* | ~Night Raider~ | *(Exclude from Static Tree as it is handled by PTR Perk Group)* |
| *(originally Tier 2 in Legends)* | Backstabber | Backstabber | *(probably left in here by mistake by the PTR team; it is already in Tier 2 due to the Dagger Perk Group)* |
| *(originally Tier 7 in Legends)* | Battle Flow | Battle Flow ||
| *(added in PTR)* | Rebound | Rebound ||
| *(moved from Tier 6 to Tier 7 under the new AssassinMagicTree)* | Assassinate | ~Assassinate~ | *(follow the SaF update)* |
| *(added in PTR)* | Primal Fear | Primal Fear ||
| *(originally Tier 7 in Legends)* | Tumble | Tumble ||

#### Tier 7
| Legends | PTR | Result | Notes |
| ------- | --- | ------ | ----- |
| Tumble | *(moved to Tier 6 in PTR)* | ~Tumble~ ||
| Close Combat Archer | *(removed in PTR)* | ~Close Combat Archer~ Whites of their Eyes | *(PTR Renamed this skill. Although it was removed in PTR, I will reintroduce it as the new Knifeplay perk is meant to benefit from this)*|
| Killing Frenzy | *(removed in PTR)* | ~Killing Frenzy~ ||
| Battle Flow | *(moved to Tier 6 in PTR)* | ~Battle Flow~ ||
| Perfect Focus | Perfect Focus | Perfect Focus ||
| Freedom of Movement | *(removed in PTR)* | ~Freedom of Movement~ ||
| Assassinate | *(moved from Tier 6 to Tier 7 under the new AssassinMagicTree)* | ~Assassinate~ | *(Exclude from Static Tree as it is handled by PTR Perk Group)* |
| FE: Swordmaster | FE: Swordmaster | FE: Swordmaster ||
| *(added in PTR)* | Vanguard Deployment | Vanguard Deployment ||
| *(added in PTR)* | Fencer| Fencer ||
| *(added in PTR)* | Bully | Bully ||
| *(originally Tier 5 in Legends)* | FE: Noble | FE: Noble ||
| *(added in PTR)* | Tunnel Vision | ~Tunnel Vision~ | *(The new T6 Night Raider Assassin skill has some overlap with this. I believe it is fair to remove Tunnel Vision)* |

### Assassin Commander Final Perk Tree
|        | Dagger | Sword | Light Armor | Vicious | Unstoppable | Devious | Trapper | Mace | AssassinMagicTree | Static Perk Tree |
| ------ | ------ | ----- | ----------- | ------- | ----------- | ------- | ------- | ---- | ----------------- | ---------------- |
| Tier 1 | Between the Ribs | Versatile Weapon || Crippling Strikes | Adrenaline | Pathfinder || Push It | Knifeplay | Bags and Belts, Alert, Hair Splitter, Deep Cuts, Recover, Nine Lives |
| Tier 2 | Backstabber | Exploit Opening | Dodge | Executioner ||| Net Repair | Heavy Strikes | Opportunist | Between the Eyes, Footwork, Quick Hands, Small Target, Menacing, Fortified Mind |
| Tier 3 | Light Weapon | Fluid Weapon | Relentless | Debilitate || Blend In | Net Casting | Bear Down | Prepared | FE: Southerner, Sprint, Vigilant, Pattern Recognition, Rotation, Overwhelm |
| Tier 4 | Dagger Mastery | Sword Mastery ||| Vigorous Assault || Net Mastery | Mace Mastery | Offhand Training || Poison Immunity, Camouflage, Head Hunter, Duelist, Boondock Blade, Know Their Weakness, Backflip, Throwing Mastery |
| Tier 5 | Double Strike | Tempo || Berserk | Lone Wolf | Evasion | Escape Artist | Concussive Strikes | Lurker | Trauma Survivor, Fresh and Furious, Clarity, Twirl |
| Tier 6 || Kata | Nimble | Assured Conquest | Unstoppable ||| Push the Advantage | Night Raider | Battle Flow, Rebound, Primal Fear, Tumble |
| Tier 7 | Swift Stabs| En Buard || Fearsome || Untouchable || Bone Breaker | Assassinate | Vanguard Deployment, Fencer, Bully, FE: Noble, Perfect Focus, Swordmaster, Whites of their Eyes |

The `legend_assassin_background` (spawned in the Adventuring Party Origin) has also undergone similar changes to `legend_assassin_commander_background` but I will not go into detail.