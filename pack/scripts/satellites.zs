// ====================================================================================
// SPUTNIKI (Zavod 1.53-1.54): sobirayutsya na Zemle, vyvodyatsya odnorazovoy raketoy-nositelem so startovoy
// ploschadki (kak R-7, Juno, Thor), sluzhat srok i skhodyat s orbity. Raketa - nizhe (B1 chat 4: bez Galacticraft).
// Shina: solnechnye paneli IC2 (po chertezhu), alyuminievaya rama, prodvinutaya skhema, energokristall, antenna (zoloto).
// 1.56.77: shina - tol'ko po chertezhu shassi (odin na vse tipy; byuro ili nakhodka; raskhoduetsya - delay sin'ku, loot.zs).
// ====================================================================================
val plAlS     = <ore:plateAluminum>;
val solarS    = <IC2:blockGenerator:3>;
val advS      = <IC2:itemPartCircuitAdv>;
val circS     = <IC2:itemPartCircuit>;
val goldWire  = <IC2:itemCable:2>;
val crystalS  = <IC2:itemBatCrystal:*>;
val busS      = <zavod:satellite_bus>;
val lensS     = <zavod:lens>;

mods.forestry.Carpenter.addRecipe(busS, [
    [solarS,   plAlS,    solarS],
    [plAlS,    advS,     plAlS],
    [goldWire, crystalS, <zavod:blueprint_satellite>]
], 200);
// Navigatsionnyy (Transit, 1964): opornyy generator chastoty - schema, zolotye kontakty, folga, kondensatory.
mods.forestry.Carpenter.addRecipe(<zavod:satellite_nav>, [
    [circS,           <ore:plateGold>,         circS],
    [<zavod:tin_foil>, busS,                   <zavod:tin_foil>],
    [null,            <zavod:capacitor_paper>, null]
], 200);
// Meteo (TIROS, 1960): telekamera - tri linzy iz flint-stekla.
mods.forestry.Carpenter.addRecipe(<zavod:satellite_weather>, [
    [lensS, lensS, lensS],
    [null,  busS,  null],
    [null,  circS, null]
], 200);
// Razvedyvatel'nyy (Corona, 1960): dlinnofokusnaya optika i tsellyuloidnaya fotoplyonka (Zavod 1.56.12; bylo - bumaga).
mods.forestry.Carpenter.addRecipe(<zavod:satellite_recon>, [
    [lensS,                  <zavod:scope_optic>,    lensS],
    [<ore:dustSilver>,       busS,                   <ore:dustSilver>],
    [<zavod:celluloid_film>, <zavod:celluloid_film>, <zavod:celluloid_film>]
], 200);
// Svyazi (Telstar, 1962): retranslyator.
mods.forestry.Carpenter.addRecipe(<zavod:satellite_comm>, [
    [goldWire, advS,  goldWire],
    [circS,    busS,  circS],
    [null,     plAlS, null]
], 200);
// Stantsiya slezheniya: alyuminievaya tarelka, priyomnik, korpus mashiny IC2.
mods.forestry.Carpenter.addRecipe(<zavod:tracking_station>, [
    [plAlS,           plAlS,           plAlS],
    [goldWire,        advS,            goldWire],
    [<ore:plateSteel>, <IC2:blockMachine>, <ore:plateSteel>]
], 200);
// Radiostantsiya u mashiny: antenna, skhema, akkumulyator.
recipes.addShaped(<zavod:radio>, [
    [null,             goldWire,                 null],
    [<ore:plateSteel>, circS,                    <ore:plateSteel>],
    [<ore:plateSteel>, <IC2:itemBatREDischarged>, <ore:plateSteel>]
]);
// Navigator: priyomnik s ekranom.
recipes.addShaped(<zavod:navigator>, [
    [plAlS,    <minecraft:glass_pane>,   plAlS],
    [goldWire, circS,                    goldWire],
    [plAlS,    <IC2:itemBatREDischarged>, plAlS]
]);

// --- Raketa-nositel' (Zavod 1.54; 1.56.58 - bez Galacticraft): obtekatel' iz alyuminiya s prodvinutoy skhemoy
// (upravlenie), bak - legirovannaya stal' + bak BC, dvigatel' - monelevaya kamera sgoraniya + turbonasos (elektromotor IC2).
// Odnorazovaya, do 3 sputnikov; kerosin + okislitel' (zhidkiy kislorod Linde ili azotnaya kislota) po gruzu (B6 chat 2, config [satellites]);
// pusk - signal krasnogo kamnya (otschyot 10 s); nedoliv - avariya u stola, pereliv - sputniki sgoreli.
mods.forestry.Carpenter.addRecipe(<zavod:launch_vehicle>, [
    [plAlS,                <IC2:itemPartCircuitAdv>,        plAlS],
    [<ore:plateAlloySteel>, <BuildCraft|Factory:tankBlock>, <ore:plateAlloySteel>],
    [<ore:plateMonel>,     <IC2:itemRecipePart:1>,          <ore:plateMonel>]
], 200);
