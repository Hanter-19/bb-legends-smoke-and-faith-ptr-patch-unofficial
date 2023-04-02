::PTRSAFPatch <- {
	Version = "0.1.0",
	ID = "mod_ptr_saf_patch_unofficial",
	Name = "Unnoficial PTR Smoke And Faith Patch"
}

::mods_registerMod(::PTRSAFPatch.ID, ::PTRSAFPatch.Version, ::PTRSAFPatch.Name);

::mods_queue(::PTRSAFPatch.ID, "mod_msu(>=1.2.4), mod_legends(>=16.2.3), mod_legends_PTR(=2.1.27)", function() {

	::PTRSAFPatch.Mod <- ::MSU.Class.Mod(::PTRSAFPatch.ID, ::PTRSAFPatch.Version, ::PTRSAFPatch.Name);

	::PTRSAFPatch.Mod.Registry.addModSource(::MSU.System.Registry.ModSourceDomain.GitHub, "https://github.com/Hanter-19/bb-legends-smoke-and-faith-ptr-patch-unofficial");
	::LegendsFavouredEnemyRefund.Mod.Registry.setUpdateSource(::MSU.System.Registry.ModSourceDomain.GitHub);

	::include("mod_ptr_saf_patch/load.nut");

});