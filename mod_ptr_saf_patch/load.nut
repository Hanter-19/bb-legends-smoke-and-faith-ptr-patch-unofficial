::include("mod_ptr_saf_patch/hooks/config/strings.nut");
::include("mod_ptr_saf_patch/hooks/config/z_perks_tree_traits.nut");
::include("mod_ptr_saf_patch/hooks/config/z_perks_tree_profession.nut");

foreach(file in ::IO.enumerateFiles("mod_ptr_saf_patch/hooks/items"))
{
	::include(file);
}

foreach(file in ::IO.enumerateFiles("mod_ptr_saf_patch/hooks/skills/backgrounds"))
{
	::include(file);
}

foreach(file in ::IO.enumerateFiles("mod_ptr_saf_patch/hooks/skills/effects"))
{
	::include(file);
}


foreach(file in ::IO.enumerateFiles("mod_ptr_saf_patch/hooks/skills/perks"))
{
	::include(file);
}

::include("mod_ptr_saf_patch/test/test.nut");