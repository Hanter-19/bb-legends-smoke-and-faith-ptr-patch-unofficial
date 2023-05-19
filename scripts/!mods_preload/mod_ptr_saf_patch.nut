::PTRSAFPatch <- {
	Version = "0.2.0",
	ID = "mod_ptr_saf_patch_unofficial",
	Name = "Unnoficial PTR Smoke And Faith Patch"
}

::mods_registerMod(::PTRSAFPatch.ID, ::PTRSAFPatch.Version, ::PTRSAFPatch.Name);

::mods_queue(::PTRSAFPatch.ID, "mod_msu(>=1.2.4), mod_legends(>=16.3.3), mod_legends_PTR(=2.1.27)", function() {

	::PTRSAFPatch.Mod <- ::MSU.Class.Mod(::PTRSAFPatch.ID, ::PTRSAFPatch.Version, ::PTRSAFPatch.Name);

	::PTRSAFPatch.Mod.Debug.enable(); // Leave this on by default to help diagnose bug reports

	::PTRSAFPatch.Mod.Registry.addModSource(::MSU.System.Registry.ModSourceDomain.GitHub, "https://github.com/Hanter-19/bb-legends-smoke-and-faith-ptr-patch-unofficial");
	::PTRSAFPatch.Mod.Registry.setUpdateSource(::MSU.System.Registry.ModSourceDomain.GitHub);

	::include("mod_ptr_saf_patch/load.nut");

});