GameEvents.Subscribe("teve_town_firstjob_spawn", function () {
    $.Msg("We are in range");
    $("#FirstJob").SetHasClass("InRange", true);
});
GameEvents.Subscribe("teve_town_firstjob_death", function () {
    $.Msg("We are no longer in range");
    $("#FirstJob").SetHasClass("InRange", false);
});
GameEvents.Subscribe("dota_hero_ability_points_changed", function () {
    var level = Entities.GetLevel(Players.GetPlayerHeroEntityIndex(Players.GetLocalPlayer()));
    $.Msg(level);
    //TODO: check for being novice.
    if (level >= 10) {
        $.Msg("Ready for first job");
        $("#FirstJob").SetHasClass("Active", true);
    }
    else {
        $.Msg("Not ready for first job.");
        $("#FirstJob").SetHasClass("Active", false);
    }
});
//Testing2
$.Msg("Job Advancement Reloaded 2!");
for (var _i = 0, _a = Entities.GetAllEntities(); _i < _a.length; _i++) {
    var ent = _a[_i];
    if (Entities.GetUnitName(ent) == "teve_town_firstjob") {
        var particle = Particles.CreateParticle("particles/units/heroes/heroes_underlord/underlord_firestorm_pre_e.vpcf", ParticleAttachment_t.PATTACH_POINT, ent);
    }
}
