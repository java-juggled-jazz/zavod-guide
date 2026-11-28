// ====================================================================================
// ELEKTRONIKA: LAMPOVAYa ERA -> PEChATNYE PLATY
// POChEMU: skhema IC2 iz kabeley i redstouna na verstake - eto elektronika iz niotkuda.
// TEPER' dve stupeni:
//   1. Lampovaya (Forestry): plata iz plotnika (olovo + redstoun + voda) + mednye elektronnye lampy
//      iz termoionnogo fabrikatora (med' + redstoun + rasplavlennoe steklo). 2 skhemy za kraft.
//   2. Pechatnaya (BuildCraft): iz chipsetov lazernogo stola delayutsya PRODVINUTYE skhemy.
//   Obe - tol'ko v plotnike (payka + lak).
// Vanil'nyy retsept skhemy IC2 udalyon. Plotnik i fabrikator skhem IC2 ne trebuyut - tupika net.
// ====================================================================================

val circuitIC2  = <IC2:itemPartCircuit>;
val cuCable     = <IC2:itemCable>;                      // izolirovannyy mednyy kabel'
val plateIron   = <ore:plateIron>;
val copperTube  = <Forestry:thermionicTubes>;           // mednaya elektronnaya lampa (meta 0)
val chipRed     = <BuildCraft|Silicon:redstoneChipset>; // krasnyy chipset BC (meta 0)
val bakeliteE   = <zavod:bakelite>;                     // osnovanie skhemy i korpusa priborov (Zavod 1.57.13)

recipes.remove(circuitIC2);

// 1. Lampovaya skhema
// Tol'ko plotnik: payka olovom, plata pokryvaetsya lakom (rastitel'noe maslo). Vruchnuyu skhemu ne sobrat'.
// Osnovanie - bakelitovaya plastina (Zavod 1.57.13; BYLO: plata Forestry).
// Bumazhnyy kondensator: dve lenty olovyannoy fol'gi, prolozhennye bumagoy, propitka maslom (plotnik).
// Fol'ga: olovyannaya obolochka IC2 pod molotom -> 2 (plastina -> 2 obolochki -> 4 fol'gi), prokatnyy stan: 2 plastiny -> 12.
// BYLO: plastina + molot -> 4 fol'gi - tot zhe vkhod, chto u obolochki IC2 (plastina + molot -> 2 obolochki), retsepty spotykalis'.
recipes.addShapeless(<zavod:tin_foil> * 2, [<IC2:itemCasing:1>, <ore:craftingToolForgeHammer>]);
mods.railcraft.Rolling.addShaped(<zavod:tin_foil> * 12, [[<ore:plateTin>, <ore:plateTin>]]);
mods.forestry.Carpenter.addRecipe(<zavod:capacitor_paper> * 2, [
    [<zavod:tin_foil>, <minecraft:paper>, <zavod:tin_foil>]
], <liquid:seedoil> * 50, 20);
mods.forestry.Carpenter.addRecipe(circuitIC2 * 2, [
    [cuCable,         copperTube, <zavod:capacitor_paper>],
    [<zavod:solder>,  bakeliteE,  <zavod:solder>],
    [<zavod:capacitor_paper>, copperTube, cuCable]
], <liquid:seedoil> * 100, 40);
mods.forestry.Carpenter.addRecipe(circuitIC2 * 2, [
    [cuCable,         copperTube, <zavod:capacitor_paper>],
    [<zavod:solder>,  bakeliteE,  <zavod:solder>],
    [<zavod:capacitor_paper>, copperTube, cuCable]
], <liquid:turpentine> * 35, 40);   // lak na skipidare s kanifol'yu (Zavod 1.56.12): vtroe men'she zhidkosti
mods.forestry.Carpenter.addRecipe(circuitIC2 * 2, [
    [cuCable,         copperTube, <zavod:capacitor_paper>],
    [<zavod:solder>,  bakeliteE,  <zavod:solder>],
    [<zavod:capacitor_paper>, copperTube, cuCable]
], <liquid:alkyd> * 18, 40);   // alkidnyy lak (gliftal', 1.57.20): vdvoe men'she skipidara

// FOTOLITOGRAFIYa (planarnyy protsess, 1959): kremniy pod fotomaskoy, travlenie kislotoy. Lazer ne nuzhen -
// pervye mikroskhemy delali svetom rtutnoy lampy cherez shablon. Dorozhe lazernogo stola, no dostupno bez chertezha.
// Krasnyy chipset: 2 kremniya + 2 redstouna + 100 mB azotnoy kisloty -> 2.
mods.forestry.Carpenter.addRecipe(chipRed * 2, [
    [<zavod:silicon>, <minecraft:redstone>, <zavod:silicon>],
    [null,            <minecraft:redstone>, null]
], <liquid:nitricacid> * 100, 60);
// Zolotoy chipset: 2 kremniya + redstoun + zolotaya plastina (kontakty) + 100 mB azotnoy kisloty -> 1.
mods.forestry.Carpenter.addRecipe(<BuildCraft|Silicon:redstoneChipset:2>, [
    [<zavod:silicon>, <minecraft:redstone>, <zavod:silicon>],
    [null,            <ore:plateGold>,      null]
], <liquid:nitricacid> * 100, 80);

// Prodvinutaya skhema - tol'ko plotnik, na chipsetakh BC (bez lampovykh skhem): zolotye kontakty, olovyannyy pripoy, lak.
// Tol'ko krasnye i zolotye chipsety - te, chto delayutsya fotolitografiey (BYLO: eschyo 2 kvartsevykh - lazernye).
recipes.remove(<IC2:itemPartCircuitAdv>);
mods.forestry.Carpenter.addRecipe(<IC2:itemPartCircuitAdv>, [
    [<ore:plateGold>, chipRed,                                <ore:plateGold>],
    [chipRed,         <BuildCraft|Silicon:redstoneChipset:2>, chipRed],
    [<zavod:solder>,  chipRed,                                <zavod:solder>]
], <liquid:seedoil> * 250, 80);
mods.forestry.Carpenter.addRecipe(<IC2:itemPartCircuitAdv>, [
    [<ore:plateGold>, chipRed,                                <ore:plateGold>],
    [chipRed,         <BuildCraft|Silicon:redstoneChipset:2>, chipRed],
    [<zavod:solder>,  chipRed,                                <zavod:solder>]
], <liquid:turpentine> * 85, 80);   // lak na skipidare s kanifol'yu (Zavod 1.56.12): vtroe men'she zhidkosti
mods.forestry.Carpenter.addRecipe(<IC2:itemPartCircuitAdv>, [
    [<ore:plateGold>, chipRed,                                <ore:plateGold>],
    [chipRed,         <BuildCraft|Silicon:redstoneChipset:2>, chipRed],
    [<zavod:solder>,  chipRed,                                <zavod:solder>]
], <liquid:alkyd> * 43, 80);   // alkidnyy lak (gliftal', 1.57.20): vdvoe men'she skipidara

// Skaner plotnosti rudy (geologicheskiy molotok sborki): lampovye skhemy, bakelitovyy korpus (1.57.13; BYLO bronzovyy), akkumulyator RE.
// BYLO: prodvinutyy akkumulyator i zolotye obolochki. Svetopyl' (Nizhniy mir) -> steklo shkaly.
recipes.remove(<IC2:itemScanner>);
mods.forestry.Carpenter.addRecipe(<IC2:itemScanner:27>, [
    [bakeliteE,  <minecraft:glass_pane>,     bakeliteE],
    [circuitIC2, <IC2:itemBatREDischarged>, circuitIC2],
    [cuCable, cuCable, cuCable]
], <liquid:seedoil> * 100, 40);
mods.forestry.Carpenter.addRecipe(<IC2:itemScanner:27>, [
    [bakeliteE,  <minecraft:glass_pane>,     bakeliteE],
    [circuitIC2, <IC2:itemBatREDischarged>, circuitIC2],
    [cuCable, cuCable, cuCable]
], <liquid:turpentine> * 35, 40);   // lak na skipidare s kanifol'yu (Zavod 1.56.12): vtroe men'she zhidkosti
mods.forestry.Carpenter.addRecipe(<IC2:itemScanner:27>, [
    [bakeliteE,  <minecraft:glass_pane>,     bakeliteE],
    [circuitIC2, <IC2:itemBatREDischarged>, circuitIC2],
    [cuCable, cuCable, cuCable]
], <liquid:alkyd> * 18, 40);   // alkidnyy lak (gliftal', 1.57.20): vdvoe men'she skipidara

// Uluchsheniya mashin IC2 (uskoritel', transformator, nakopitel') - elektronika, tol'ko plotnik.
recipes.remove(<IC2:upgradeModule:0>);
mods.forestry.Carpenter.addRecipe(<IC2:upgradeModule:0> * 2, [
    [<IC2:reactorCoolantSimple:*>, <IC2:reactorCoolantSimple:*>, <IC2:reactorCoolantSimple:*>],
    [<IC2:itemCable>,              circuitIC2,                   <IC2:itemCable>]
], <liquid:seedoil> * 100, 40);
mods.forestry.Carpenter.addRecipe(<IC2:upgradeModule:0> * 2, [
    [<IC2:reactorCoolantSimple:*>, <IC2:reactorCoolantSimple:*>, <IC2:reactorCoolantSimple:*>],
    [<IC2:itemCable>,              circuitIC2,                   <IC2:itemCable>]
], <liquid:turpentine> * 35, 40);   // lak na skipidare s kanifol'yu (Zavod 1.56.12): vtroe men'she zhidkosti
mods.forestry.Carpenter.addRecipe(<IC2:upgradeModule:0> * 2, [
    [<IC2:reactorCoolantSimple:*>, <IC2:reactorCoolantSimple:*>, <IC2:reactorCoolantSimple:*>],
    [<IC2:itemCable>,              circuitIC2,                   <IC2:itemCable>]
], <liquid:alkyd> * 18, 40);   // alkidnyy lak (gliftal', 1.57.20): vdvoe men'she skipidara
recipes.remove(<IC2:upgradeModule:1>);
mods.forestry.Carpenter.addRecipe(<IC2:upgradeModule:1>, [
    [<zavod:capacitor_paper>, <minecraft:glass>, <zavod:capacitor_paper>],
    [<IC2:itemCable:3>,  <IC2:blockElectric:4>,  <IC2:itemCable:3>],
    [<minecraft:glass>,  circuitIC2,             <minecraft:glass>]
], <liquid:seedoil> * 100, 40);
mods.forestry.Carpenter.addRecipe(<IC2:upgradeModule:1>, [
    [<zavod:capacitor_paper>, <minecraft:glass>, <zavod:capacitor_paper>],
    [<IC2:itemCable:3>,  <IC2:blockElectric:4>,  <IC2:itemCable:3>],
    [<minecraft:glass>,  circuitIC2,             <minecraft:glass>]
], <liquid:turpentine> * 35, 40);   // lak na skipidare s kanifol'yu (Zavod 1.56.12): vtroe men'she zhidkosti
mods.forestry.Carpenter.addRecipe(<IC2:upgradeModule:1>, [
    [<zavod:capacitor_paper>, <minecraft:glass>, <zavod:capacitor_paper>],
    [<IC2:itemCable:3>,  <IC2:blockElectric:4>,  <IC2:itemCable:3>],
    [<minecraft:glass>,  circuitIC2,             <minecraft:glass>]
], <liquid:alkyd> * 18, 40);   // alkidnyy lak (gliftal', 1.57.20): vdvoe men'she skipidara
recipes.remove(<IC2:upgradeModule:2>);
mods.forestry.Carpenter.addRecipe(<IC2:upgradeModule:2>, [
    [<ore:plankWood>, <zavod:capacitor_paper>,     <ore:plankWood>],
    [<IC2:itemCable>, <IC2:itemBatREDischarged>,   <IC2:itemCable>],
    [<ore:plankWood>, circuitIC2,                  <ore:plankWood>]
], <liquid:seedoil> * 100, 40);
mods.forestry.Carpenter.addRecipe(<IC2:upgradeModule:2>, [
    [<ore:plankWood>, <zavod:capacitor_paper>,     <ore:plankWood>],
    [<IC2:itemCable>, <IC2:itemBatREDischarged>,   <IC2:itemCable>],
    [<ore:plankWood>, circuitIC2,                  <ore:plankWood>]
], <liquid:turpentine> * 35, 40);   // lak na skipidare s kanifol'yu (Zavod 1.56.12): vtroe men'she zhidkosti
mods.forestry.Carpenter.addRecipe(<IC2:upgradeModule:2>, [
    [<ore:plankWood>, <zavod:capacitor_paper>,     <ore:plankWood>],
    [<IC2:itemCable>, <IC2:itemBatREDischarged>,   <IC2:itemCable>],
    [<ore:plankWood>, circuitIC2,                  <ore:plankWood>]
], <liquid:alkyd> * 18, 40);   // alkidnyy lak (gliftal', 1.57.20): vdvoe men'she skipidara

// Prodvinutyy skaner, chastotnyy peredatchik - elektronika, tol'ko plotnik.
// Prodvinutyy skaner: BYLO 2 svetopyli -> steklo shkaly + katushka datchika.
// Energokristall - vyraschivanie na UU-materii: 9 energievoy pyli + 1 mB UU (kompressor bol'she ne pressuet). Bol'shoe khranenie energii - tol'ko posle generatora materii.
recipes.remove(<IC2:itemScannerAdv>);
mods.forestry.Carpenter.addRecipe(<IC2:itemScannerAdv:27>, [
    [<IC2:itemCasing:3>,         <IC2:itemBatCrystal:*>,    <IC2:itemCasing:3>],
    [<minecraft:glass_pane>,     <IC2:itemPartCircuitAdv>,  <IC2:itemRecipePart>],
    [<IC2:itemCable:3>,          <IC2:itemScanner:*>,       <IC2:itemCable:3>]
], <liquid:seedoil> * 100, 60);
mods.forestry.Carpenter.addRecipe(<IC2:itemScannerAdv:27>, [
    [<IC2:itemCasing:3>,         <IC2:itemBatCrystal:*>,    <IC2:itemCasing:3>],
    [<minecraft:glass_pane>,     <IC2:itemPartCircuitAdv>,  <IC2:itemRecipePart>],
    [<IC2:itemCable:3>,          <IC2:itemScanner:*>,       <IC2:itemCable:3>]
], <liquid:turpentine> * 35, 60);   // lak na skipidare s kanifol'yu (Zavod 1.56.12): vtroe men'she zhidkosti
mods.forestry.Carpenter.addRecipe(<IC2:itemScannerAdv:27>, [
    [<IC2:itemCasing:3>,         <IC2:itemBatCrystal:*>,    <IC2:itemCasing:3>],
    [<minecraft:glass_pane>,     <IC2:itemPartCircuitAdv>,  <IC2:itemRecipePart>],
    [<IC2:itemCable:3>,          <IC2:itemScanner:*>,       <IC2:itemCable:3>]
], <liquid:alkyd> * 18, 60);   // alkidnyy lak (gliftal', 1.57.20): vdvoe men'she skipidara
recipes.remove(<IC2:itemFreq>);
mods.forestry.Carpenter.addRecipe(<IC2:itemFreq>, [[circuitIC2, cuCable, bakeliteE]], <liquid:seedoil> * 50, 20);       // korpus - bakelit (1.57.13)
mods.forestry.Carpenter.addRecipe(<IC2:itemFreq>, [[circuitIC2, cuCable, bakeliteE]], <liquid:turpentine> * 15, 20);   // lak na skipidare s kanifol'yu (Zavod 1.56.12): vtroe men'she zhidkosti
mods.forestry.Carpenter.addRecipe(<IC2:itemFreq>, [[circuitIC2, cuCable, bakeliteE]], <liquid:alkyd> * 8, 20);   // alkidnyy lak (gliftal', 1.57.20): vdvoe men'she skipidara
mods.forestry.Carpenter.addRecipe(<IC2:itemBatCrystal:27>, [
    [<IC2:itemDust2:2>, <IC2:itemDust2:2>, <IC2:itemDust2:2>],
    [<IC2:itemDust2:2>, <IC2:itemDust2:2>, <IC2:itemDust2:2>],
    [<IC2:itemDust2:2>, <IC2:itemDust2:2>, <IC2:itemDust2:2>]
], <liquid:ic2uumatter> * 1, 100);   // BYLO: 1000 mB distillyata. Kristall rastyot na UU-materii: 1 mB ~ 3 mln EU - dorozhe, chem on vmeschaet

// ====================================================================================
// BAKELITOVYE KORPUSA PRIBOROV (Zavod 1.57.13): bakelit - deshyovaya zamena derevu i metallu
// tam, gde korpus nichego ne derzhit. Metall, kotoryy nesyot nagruzku ili ekraniruet (svinets), ne trogaem.
// ====================================================================================
// EU-metr IC2: dva kabelya bokov -> bakelitovye scheki.
recipes.remove(<IC2:itemToolMEter>);
recipes.addShaped(<IC2:itemToolMEter>, [
    [null,      <minecraft:glass_pane>, null],
    [bakeliteE, circuitIC2,             bakeliteE],
    [cuCable,   null,                   cuCable]
]);

// Nuclear Control: zheleznye plastiny korpusa -> bakelit. Termomonitor (svinets) i srednee/schyotchiki na svintse - kak byli.
// Tsifrovoy termometr
recipes.remove(<IC2NuclearControl:ItemToolDigitalThermometer>);
recipes.addShaped(<IC2NuclearControl:ItemToolDigitalThermometer>, [
    [<ore:itemRubber>, bakeliteE,                                    null],
    [bakeliteE,        <IC2NuclearControl:ItemToolThermometer:*>,   bakeliteE],
    [null,             bakeliteE,                                    <IC2:itemRecipePart:3>]
]);
// Sirena (howler): korpus pod elektromotorom
recipes.remove(<IC2NuclearControl:blockNuclearControlMain:2>);
recipes.addShaped(<IC2NuclearControl:blockNuclearControlMain:2>, [
    [<minecraft:noteblock>, <minecraft:noteblock>,  <minecraft:noteblock>],
    [bakeliteE,             <IC2:itemRecipePart:1>, bakeliteE],
    [bakeliteE,             circuitIC2,             bakeliteE]
]);
// Informatsionnaya panel': chyornaya ramka (kraska) -> bakelit
recipes.remove(<IC2NuclearControl:blockNuclearControlMain:4>);
recipes.addShaped(<IC2NuclearControl:blockNuclearControlMain:4>, [
    [<ore:paneGlassLime>, <ore:paneGlassLime>, <ore:paneGlassLime>],
    [circuitIC2,          <IC2:blockMachine>,  circuitIC2],
    [bakeliteE,           <ore:dustRedstone>,  bakeliteE]
]);
// Schyotchik energii: korpus
recipes.remove(<IC2NuclearControl:blockNuclearControlMain:6>);
recipes.addShaped(<IC2NuclearControl:blockNuclearControlMain:6>, [
    [bakeliteE,         <IC2:itemPartCircuitAdv>, bakeliteE],
    [<IC2:itemCable:2>, <IC2:blockElectric:4>,    <IC2:itemCable:2>]
]);
// Porogovyy datchik (range trigger)
recipes.remove(<IC2NuclearControl:blockNuclearControlMain:8>);
recipes.addShaped(<IC2NuclearControl:blockNuclearControlMain:8>, [
    [bakeliteE,                <IC2:itemFreq>,      bakeliteE],
    [<IC2:itemPartCircuitAdv>, <IC2:blockMachine>,  <IC2:itemPartCircuitAdv>],
    [null,                     <ore:dustRedstone>,  null]
]);

// Korobki signalizatsii Railcraft: korpus metallicheskiy (vidno po teksture) - ostavlyaem verkh iz zheleza,
// nizhniy ryad (osnovanie s klemmami) - bakelit. Rodnoy retsept (4 zheleza) ostayotsya.
recipes.addShaped(<Railcraft:signal:6>,  [[<minecraft:iron_ingot>, <minecraft:comparator>,      <minecraft:iron_ingot>], [bakeliteE, <ore:dustRedstone>,    bakeliteE]]); // sekvenser
recipes.addShaped(<Railcraft:signal:7>,  [[<minecraft:iron_ingot>, <minecraft:repeater>,        <minecraft:iron_ingot>], [bakeliteE, <ore:dustRedstone>,    bakeliteE]]); // kondensator
recipes.addShaped(<Railcraft:signal:8>,  [[<minecraft:iron_ingot>, <Railcraft:part.circuit:1>,  <minecraft:iron_ingot>], [bakeliteE, <ore:dustRedstone>,    bakeliteE]]); // priyomnik
recipes.addShaped(<Railcraft:signal:9>,  [[<minecraft:iron_ingot>, <Railcraft:part.circuit:0>,  <minecraft:iron_ingot>], [bakeliteE, <ore:dustRedstone>,    bakeliteE]]); // kontroller
recipes.addShaped(<Railcraft:signal:10>, [[<minecraft:iron_ingot>, <Railcraft:part.circuit:0>,  <minecraft:iron_ingot>], [bakeliteE, <minecraft:comparator>, bakeliteE]]); // analogovyy
recipes.addShaped(<Railcraft:signal:13>, [[null, <Railcraft:part.circuit:2>, null], [<minecraft:iron_ingot>, <Railcraft:part.circuit:2>, <minecraft:iron_ingot>], [bakeliteE, <ore:dustRedstone>, bakeliteE]]); // rele bloka
