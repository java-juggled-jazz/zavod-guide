// ====================================================================================
// VODA (Zavod 1.56.31, SPEC B5): beskonechnaya voda - tol'ko v reke i more, artezianskaya skvazhina.
// ====================================================================================
// Patch yadra (WaterTransformer): voda mezhdu dvumya istochnikami sama stanovitsya istochnikom tol'ko v biomakh
// OCEAN, RIVER, BEACH (config/zavod.cfg [water]). Prud v pole konechen: nasos i vedro ego vycherpyvayut.
// Nasos BC tozhe vycherpyvaet istochniki (config/buildcraft/main.cfg pumpsConsumeWater).
// Dozhd' i bak Railcraft ostayutsya (vodyanoy nakopitel' TE ushyol s modom v B1).
// Artezianskaya skvazhina: 20 m na obsadnuyu trubu, gorizont po vlazhnosti bioma (boloto 40 m, pole 120, pustynya 180),
// nasos val 2 l.s. ili par; boloto do 18 mB/t, pole 9, pustynya 2; truby nizhe gorizonta +25% za 20 m.
// ====================================================================================

// --- Vodyanoy nakopitel' TE (Machine:8) - snyat, v NEI skryt ---

// --- Artezianskaya skvazhina: bronzovyy porshnevoy nasos, obsadnaya kolonna, zheleznaya rama ---
mods.forestry.Carpenter.addRecipe(<zavod:water_well>, [
    [<ore:gearBronze>, <zavod:pipe_bronze_medium>, <ore:gearBronze>],
    [<ore:plateIron>,  <zavod:pipe_bronze>,        <ore:plateIron>],
    [<ore:plateIron>,  <ore:plateIron>,            <ore:plateIron>]
], 60);
