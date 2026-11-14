// ====================================================================================
//                 BALANS KOKSOVYKh PEChEY RAILCRAFT
// V railcraft.cfg NET nastroek vremeni koksovaniya i vykhoda kreozota - fayl railcraft.json
// Railcraft prosto ne chitaet. Menyaem retsepty cherez ModTweaker.
// Po umolchaniyu v Railcraft 9.x: ugol' -> koks za 1800 tikov (90 s) + 500 mB kreozota;
// brevno -> drevesnyy ugol' za 1800 tikov + 250 mB.
// ====================================================================================

val creosote = <liquid:creosote>;

// Zavod 1.56: koks - TOL'KO v koksovoy kamere Zavod (partiya 64 uglya -> 48 koksa + gaz + kreozot, batareya).
// Pech' Railcraft koksovala po odnomu kusku i udvaivala energiyu (ugol' 1600 -> koks 3200) - ubrano.
mods.railcraft.CokeOven.removeRecipe(<Railcraft:fuel.coke>);
mods.railcraft.CokeOven.removeRecipe(<Railcraft:cube:0>);

recipes.addShaped(<zavod:coke_chamber>, [
    [<Railcraft:machine.alpha:7>, <Railcraft:machine.alpha:7>, <Railcraft:machine.alpha:7>],
    [<ore:plateIron>,             <minecraft:furnace>,         <ore:plateIron>],
    [<Railcraft:machine.alpha:7>, <Railcraft:machine.alpha:7>, <Railcraft:machine.alpha:7>]
]);
// Sektsiya batarei (1.56.2): eshchyo odna kamera s dveryami; vplotnuyu v ryad vbok ot golovnoy kamery, do 3 sektsiy
recipes.addShaped(<zavod:coke_section>, [
    [<Railcraft:machine.alpha:7>, <Railcraft:machine.alpha:7>, <Railcraft:machine.alpha:7>],
    [<ore:plateIron>,             null,                        <ore:plateIron>],
    [<Railcraft:machine.alpha:7>, <Railcraft:machine.alpha:7>, <Railcraft:machine.alpha:7>]
]);

// Brevno -> drevesnyy ugol': kreozota 20 mB (Zavod 1.56: drevesnyy ugol' gorit 160 = ~55% brevna,
// kreozot 4.8 tika/mB - vmeste men'she brevna; ran'she 125 mB kreozota odni davali 600 tikov iz brevna v 300)
mods.railcraft.CokeOven.removeRecipe(<minecraft:coal:1>);
for log in <ore:logWood>.items {
    mods.railcraft.CokeOven.addRecipe(log, false, false, <minecraft:coal:1>, creosote * 20, 1800);
}

// ====================================================================================
//                 PAROVYE DVIGATELI RAILCRAFT - VYREZANY (B1)
// machine.beta: 7 lyubitel'skiy, 8 kommercheskiy, 9 promyshlennyy
// ====================================================================================
val glass       = <ore:blockGlassColorless>;
val piston      = <minecraft:piston>;
val plateBronze = <ore:plateBronze>;
val plateSteel  = <ore:plateSteel>;
val denseSteel  = <IC2:itemDensePlates:5>;
val gearBronze  = <ore:gearBronze>;
val gearSteel   = <ore:gearSteel>;
val gearInvar   = <ore:gearInvar>;
val tankWall    = <Railcraft:machine.beta:0>;   // stenka zheleznogo baka
val fusedQuartz = <IC2:blockAlloyGlass>;       // armirovannoe steklo IC2

// Zavod 1.56.53 (B1): parovye dvigateli RC VYREZANY (dubl': par -> privod stankov). Privod - parovaya mashina /
// turbina Zavod -> val -> mufta -> RF (kinezisnye truby BC). Retsepty snyaty, v NEI skryty (nei-hide.zs).
recipes.remove(<Railcraft:machine.beta:7>);
recipes.remove(<Railcraft:machine.beta:8>);
recipes.remove(<Railcraft:machine.beta:9>);
// Pereplavka kommercheskogo dvigatelya v domne davala 12 stali - dyup stali. Ubiraem.
// (udalyaet retsepty domny s vykhodom ot 12 stali - takoy retsept rovno odin)
mods.railcraft.BlastFurnace.removeRecipe(<Railcraft:ingot> * 12);

// ====================================================================================
//                 PAROVAYa TURBINA RAILCRAFT - VYREZANA (B1, 1.56.53)
// Par -> EU delaet turbina Zavod s golovkoy-generatorom (M46). Korpus, lopatki, rotor - snyaty i skryty v NEI,
// patch TurbineTransformer (resurs rotora) i reduktor Zavod (M35) ushli vmeste s ney.
// ====================================================================================
val steelBlock = <ore:blockSteel>;
val steelShaft = <IC2:itemRecipePart:12>;
val copperCoil = <IC2:itemRecipePart>;
val motorIC2   = <IC2:itemRecipePart:1>;
val circuitIC2 = <IC2:itemPartCircuit>;
val advCircuit = <IC2:itemPartCircuitAdv>;
val plateIron  = <ore:plateIron>;
val tankBC     = <BuildCraft|Factory:tankBlock>;
val bushing    = <Railcraft:part.gear:3>;
val denseLead  = <IC2:itemDensePlates:6>;
val chipQuartz = <BuildCraft|Silicon:redstoneChipset:5>;

recipes.remove(<Railcraft:machine.alpha:1>);
recipes.remove(<Railcraft:part.turbine.blade>);
recipes.remove(<Railcraft:part.turbine.disk>);
recipes.remove(<Railcraft:part.turbine.rotor>);

// ====================================================================================
//                 PAROVAYa PECh' - VYREZANA
// Svoikh retseptov u neyo net (tol'ko retsepty obychnoy pechi), a "kamera s parom na 120 gradusov"
// kak plavil'naya pech' - nelepost'. Ubiraem kraft.
// ====================================================================================
recipes.remove(<Railcraft:machine.alpha:3>);

// ====================================================================================
//                 KOKSOVAYa PECh': ShAMOTNYY KIRPICh
// Ogneupor = obozhzhyonnaya glina + shamot (graviy kak zapolnitel') + kvartsevyy pesok.
// Deshyovyy "kirpich + pesok" i variant iz peschanogo kirpicha vyrezany.
// ====================================================================================
recipes.remove(<Railcraft:machine.alpha:7>);
recipes.addShaped(<Railcraft:machine.alpha:7>, [
    [<minecraft:brick>,     <minecraft:sand>,   <minecraft:brick>],
    [<minecraft:clay_ball>, <minecraft:gravel>, <minecraft:clay_ball>],
    [<minecraft:brick>,     <minecraft:sand>,   <minecraft:brick>]
]);

// ====================================================================================
//                 TOPKI KOTLOV
// ====================================================================================
// Tverdotoplivnaya: kirpichnaya kladka + kolosnikovaya reshyotka (zheleznye prut'ya) + zheleznaya obshivka,
// vnutri - futerovka iz shamotnogo kirpicha (kak v koksovoy pechi). BYLO: ognennyy shar (poroshok ifrita - Nizhniy mir).
recipes.remove(<Railcraft:machine.beta:5>);
recipes.addShaped(<Railcraft:machine.beta:5>, [
    [plateIron,                <minecraft:brick_block>,     plateIron],
    [<minecraft:iron_bars>,    <Railcraft:machine.alpha:7>, <minecraft:iron_bars>],
    [<minecraft:brick_block>,  <minecraft:furnace>,     <minecraft:brick_block>]
]);

// Zhidkotoplivnaya: tverdotoplivnaya topka + forsunki (zhidkostnye truby BC) + toplivnyy bak + obmurovka iz kamennoy vaty
recipes.remove(<Railcraft:machine.beta:6>);
recipes.addShaped(<Railcraft:machine.beta:6>, [
    [plateSteel, tankBC,                     plateSteel],
    [<BuildCraft|Transport:item.buildcraftPipe.pipefluidsiron>, <Railcraft:machine.beta:5>, <BuildCraft|Transport:item.buildcraftPipe.pipefluidsiron>],
    [<zavod:slag_wool>, <Railcraft:machine.alpha:7>, <zavod:slag_wool>]   // obmurovka iz shlakovaty, shamotnyy pod
]);

// ====================================================================================
//                 BAK VODONAPORNOY BAShNI (6 sht.)
// Derevyannaya klyopka + zheleznye obruchi + rezinovyy uplotnitel' (BYLO: sliz')
// ====================================================================================
recipes.remove(<Railcraft:machine.alpha:14>);
recipes.addShaped(<Railcraft:machine.alpha:14> * 6, [
    [<ore:plankWood>, <ore:plankWood>,  <ore:plankWood>],
    [plateIron,       <ore:itemRubber>, plateIron],
    [<ore:plankWood>, <ore:plankWood>,  <ore:plankWood>]
]);

// ====================================================================================
//                 PROKATNYY STAN
// Prizhimnye porshni + bronzovyy reduktor + zheleznaya stanina. Ostayotsya DO stali.
// ====================================================================================
recipes.remove(<Railcraft:machine.alpha:8>);
recipes.addShaped(<Railcraft:machine.alpha:8>, [
    [plateIron,  <minecraft:piston>,         plateIron],
    [gearBronze, <minecraft:crafting_table>, gearBronze],
    [plateIron,  <minecraft:piston>,         plateIron]
]);

// ====================================================================================
//                 YaKORYa (mirovoy - v lategame.zs)
// ====================================================================================
// Lichnyy yakor': gruzit chanki tol'ko poka igrok v seti - deshevle mirovogo
recipes.remove(<Railcraft:machine.alpha:2>);
// Zavod 1.40: slozhnaya tekhnika - tol'ko v plotnike, chertyozh raskhoduetsya (kopiya - sin'ka, loot.zs)
mods.forestry.Carpenter.addRecipe(<Railcraft:machine.alpha:2>, [[denseLead, <BuildCraft|Silicon:redstoneChipset:2>, denseLead], [<minecraft:ender_pearl>, <IC2:itemBatREDischarged>, <minecraft:ender_pearl>], [denseLead, motorIC2, <zavod:blueprint_anchor>]], 200);

// Passivnyy yakor': uroven' mirovogo
recipes.remove(<Railcraft:machine.alpha:13>);
// Zavod 1.40: slozhnaya tekhnika - tol'ko v plotnike, chertyozh raskhoduetsya (kopiya - sin'ka, loot.zs)
mods.forestry.Carpenter.addRecipe(<Railcraft:machine.alpha:13>, [[denseLead, <BuildCraft|Silicon:redstoneChipset:2>, denseLead], [<IC2:itemPartCircuitAdv>, <IC2:blockElectric:7>, <IC2:itemPartCircuitAdv>], [denseLead, advCircuit, <zavod:blueprint_anchor>]], 200);

// Strazh (Sentinel): retranslyator polya yakorya
recipes.remove(<Railcraft:machine.beta:10>);
recipes.addShaped(<Railcraft:machine.beta:10>, [
    [null,      <BuildCraft|Silicon:redstoneChipset:2>, null],   // zolotoy chipset (BYLO kvartsevyy)
    [denseLead, <minecraft:ender_pearl>, denseLead],
    [denseLead, circuitIC2,              denseLead]
]);

// ====================================================================================
//                 VAGONETKI I LOKOMOTIVY: PROKAT + KOLYoSNYE PARY NA VTULKAKh
// ====================================================================================
// Vagonetka: 3 zheleznye plastiny + 2 vtulki (BYLO: 5 slitkov). Iz neyo sobirayutsya vse gruzovye vagonetki.
// 1.48.1: removeShaped, a ne remove - remove ubival i razborku vagonetok Railcraft (s sundukom, pech'yu, TNT, voronkoy,
// tsisternoy, gruzovoy, energeticheskie, yakorya -> vagonetka + soderzhimoe). Razborka - shapeless, ostayotsya.
recipes.removeShaped(<minecraft:minecart>);
recipes.addShaped(<minecraft:minecart>, [
    [plateIron, null,      plateIron],
    [bushing,   plateIron, bushing]
]);

// Parovoz: kotyol vysokogo davleniya + topka + parovaya mashina Zavod (tsilindry) + stal'nye kolyosnye pary.
// removeShaped, a ne remove - inache propadyot retsept pokraski lokomotiva.
recipes.removeShaped(<Railcraft:cart.loco.steam.solid>);
recipes.addShaped(<Railcraft:cart.loco.steam.solid>, [
    [<Railcraft:machine.beta:4>, <Railcraft:machine.beta:4>, <Railcraft:machine.beta:5>],
    [<zavod:steam_engine>,       <Railcraft:machine.beta:4>, <Railcraft:machine.beta:5>],   // B1: parovaya mashina Zavod (dvigateli RC vyrezany)
    [gearSteel,                  <minecraft:minecart>,       <minecraft:minecart>]
]);

// Elektrovoz: tokosyomnik Railcraft + elektromotory IC2 + stal'nye kolyosnye pary
recipes.removeShaped(<Railcraft:cart.loco.electric>);
recipes.addShaped(<Railcraft:cart.loco.electric>, [
    [<minecraft:redstone_lamp>, circuitIC2,                    plateSteel],
    [motorIC2,                  <Railcraft:machine.epsilon:0>, motorIC2],
    [gearSteel,                 <minecraft:minecart>,          gearSteel]
]);

// ====================================================================================
//                 AVTOMATIKA RAILCRAFT: KORMLENIE, TORGOVLYa, DYMOGENERATOR
// ====================================================================================
// Stantsiya kormleniya: dozator-voronka + skhema upravleniya
recipes.remove(<Railcraft:machine.alpha:11>);
recipes.addShaped(<Railcraft:machine.alpha:11>, [
    [<ore:plankWood>, <minecraft:golden_carrot>, <ore:plankWood>],
    [<ore:plankWood>, <minecraft:hopper>,        <ore:plankWood>],
    [plateIron,       circuitIC2,                plateIron]
]);

// Torgovaya stantsiya: logika sdelok na zolotom chipsete BC + prodvinutaya skhema
recipes.remove(<Railcraft:machine.alpha:6>);
recipes.addShaped(<Railcraft:machine.alpha:6>, [
    [plateSteel,            <BuildCraft|Silicon:redstoneChipset:2>, plateSteel],
    [<minecraft:emerald>,   <minecraft:chest>,                      <minecraft:emerald>],
    [plateSteel,            advCircuit,                             plateSteel]
]);

// Dymogenerator: topka s kolosnikom i dymokhodom, vklyuchaetsya redstounom (topka - obychnaya pech')
recipes.remove(<Railcraft:machine.alpha:5>);
recipes.addShaped(<Railcraft:machine.alpha:5>, [
    [plateIron,               <minecraft:iron_bars>,   plateIron],
    [<minecraft:brick_block>, <minecraft:furnace>,     <minecraft:brick_block>],
    [plateIron,               <minecraft:redstone>,    plateIron]
]);

// ====================================================================================
// ShPALY, PROPITANNYE MEDNYM KUPOROSOM (metod Busheri) - vtoroy put', bez kreozota
// Med' + sera (sernaya kislota) + voda = rastvor sul'fata medi. 6 polublokov -> 2 shpaly.
// Kreozotovye ostayutsya kak v Railcraft: verstak (3 polubloka + kreozot) i plotnik (750 mB).
// ====================================================================================
mods.forestry.Carpenter.addRecipe(<Railcraft:part.tie> * 2, [
    [<ore:slabWood>,   <ore:slabWood>,   <ore:slabWood>],
    [<ore:slabWood>,   <ore:slabWood>,   <ore:slabWood>],
    [<ore:dustCopper>, <ore:dustSulfur>, null]
], <liquid:water> * 1000, 40);

// Metod Bushri (Zavod 1.56.8; B1 chat 3 - transpozer TE -> plotnik): svezhee brevno, rastvor mednogo kuporosa
// vtalkivayut v sokovye kanaly naporom. 1 brevno + 250 mB kuporosa -> 2 shpaly. Kreozot pod davleniem - avtoklav Zavod.
mods.forestry.Carpenter.addRecipe(<Railcraft:part.tie> * 2, [[<ore:logWood>]], <liquid:coppersulfate> * 250, 40);

// ====================================================================================
// MONTIROVKI: rezinovaya rukoyat' vmesto poloviny kraski (obychnaya - zhelezo, usilennaya - stal')
// ====================================================================================
recipes.remove(<Railcraft:tool.crowbar>);
recipes.addShaped(<Railcraft:tool.crowbar>, [
    [null,            <ore:dyeRed>,    <ore:ingotIron>],
    [<ore:itemRubber>, <ore:ingotIron>, <ore:dyeRed>],
    [<ore:ingotIron>, <ore:itemRubber>, null]
]);
recipes.remove(<Railcraft:tool.crowbar.reinforced>);
recipes.addShaped(<Railcraft:tool.crowbar.reinforced>, [
    [null,            <ore:dyeRed>,     <ore:ingotSteel>],
    [<ore:itemRubber>, <ore:ingotSteel>, <ore:dyeRed>],
    [<ore:ingotSteel>, <ore:itemRubber>, null]
]);

// ====================================================================================
// RAILCRAFT POD METALLURGIYU I ELEKTRONIKU (v kontse fayla: pri nevernom ID upadyot tol'ko etot blok)
// Armatura - tol'ko stal'. Skhemy signalizatsii - na lampovykh skhemakh IC2. Golovki bura - na tokarnykh koronkakh.
// Ognennyy kamen' vyrezan. Rel'sy i tak delayutsya tol'ko prokatnym stanom (krome derevyannykh).
// ====================================================================================
val boreCrown    = (<IC2:itemTurningBlanks:279329> | <IC2:itemTurningBlanks:74564>);   // burovaya koronka 4-4-3-2-1
val boreCrownDia = (<IC2:itemTurningBlanks:274961> | <IC2:itemTurningBlanks:70196>);   // almaznaya koronka 4-3-2-1-1

// (Zavod 1.49) Provolochnoe steklo (Shuman, 1892): zheleznaya setka zakatyvaetsya v goryachee steklo mezhdu valkami.
// Mobi ego ne royut, vzryv derzhit kak kirpich. Stupen' do armirovannogo stekla IC2 (kompozit).
mods.railcraft.Rolling.addShaped(<zavod:wired_glass> * 6, [
    [<minecraft:glass>,  <minecraft:glass>,  <minecraft:glass>],
    [<IC2:itemCable:5>,  <IC2:itemCable:5>,  <IC2:itemCable:5>],
    [<minecraft:glass>,  <minecraft:glass>,  <minecraft:glass>]
]);

// Armatura: tol'ko stal'
mods.railcraft.Rolling.removeRecipe(<Railcraft:part.rebar>);
mods.railcraft.Rolling.addShaped(<Railcraft:part.rebar> * 8, [
    [null,             null,             <ore:ingotSteel>],
    [null,             <ore:ingotSteel>, null],
    [<ore:ingotSteel>, null,             null]
]);

// Skhemy signalizatsii: lampovaya skhema IC2 + rele (povtoritel') + rezinovaya izolyatsiya; tsvet shersti - tip skhemy
recipes.remove(<Railcraft:part.circuit:*>);
mods.forestry.Carpenter.addRecipe(<Railcraft:part.circuit:0>, [
    [null,                  <minecraft:repeater>,  <minecraft:wool:14>],
    [<ore:itemRubber>,      <IC2:itemPartCircuit>, <ore:ingotTin>],
    [<minecraft:wool:14>,   <ore:dustRedstone>,    null]
], <liquid:seedoil> * 100, 40);
mods.forestry.Carpenter.addRecipe(<Railcraft:part.circuit:0>, [
    [null,                  <minecraft:repeater>,  <minecraft:wool:14>],
    [<ore:itemRubber>,      <IC2:itemPartCircuit>, <ore:ingotTin>],
    [<minecraft:wool:14>,   <ore:dustRedstone>,    null]
], <liquid:turpentine> * 35, 40);   // lak na skipidare s kanifol'yu (Zavod 1.56.12): vtroe men'she zhidkosti
mods.forestry.Carpenter.addRecipe(<Railcraft:part.circuit:1>, [
    [null,                  <minecraft:repeater>,  <minecraft:wool:13>],
    [<ore:itemRubber>,      <IC2:itemPartCircuit>, <ore:ingotTin>],
    [<minecraft:wool:13>,   <ore:dustRedstone>,    null]
], <liquid:seedoil> * 100, 40);
mods.forestry.Carpenter.addRecipe(<Railcraft:part.circuit:1>, [
    [null,                  <minecraft:repeater>,  <minecraft:wool:13>],
    [<ore:itemRubber>,      <IC2:itemPartCircuit>, <ore:ingotTin>],
    [<minecraft:wool:13>,   <ore:dustRedstone>,    null]
], <liquid:turpentine> * 35, 40);   // lak na skipidare s kanifol'yu (Zavod 1.56.12): vtroe men'she zhidkosti
mods.forestry.Carpenter.addRecipe(<Railcraft:part.circuit:2>, [
    [null,                  <minecraft:repeater>,  <minecraft:wool:4>],
    [<ore:itemRubber>,      <IC2:itemPartCircuit>, <ore:ingotTin>],
    [<minecraft:wool:4>,   <ore:dustRedstone>,    null]
], <liquid:seedoil> * 100, 40);
mods.forestry.Carpenter.addRecipe(<Railcraft:part.circuit:2>, [
    [null,                  <minecraft:repeater>,  <minecraft:wool:4>],
    [<ore:itemRubber>,      <IC2:itemPartCircuit>, <ore:ingotTin>],
    [<minecraft:wool:4>,   <ore:dustRedstone>,    null]
], <liquid:turpentine> * 35, 40);   // lak na skipidare s kanifol'yu (Zavod 1.56.12): vtroe men'she zhidkosti

// Golovki tunnel'nogo bura: tochyonye koronki (tokarka) vokrug bloka metalla
recipes.remove(<Railcraft:borehead.iron>);
recipes.addShaped(<Railcraft:borehead.iron>, [
    [<ore:ingotSteel>, boreCrown,         <ore:ingotSteel>],
    [boreCrown,        <ore:blockIron>,   boreCrown],
    [<ore:ingotSteel>, boreCrown,         <ore:ingotSteel>]
]);
recipes.remove(<Railcraft:borehead.steel>);
recipes.addShaped(<Railcraft:borehead.steel>, [
    [<ore:ingotSteel>, boreCrown,         <ore:ingotSteel>],
    [boreCrown,        <ore:blockSteel>,  boreCrown],
    [<ore:ingotSteel>, boreCrown,         <ore:ingotSteel>]
]);
recipes.remove(<Railcraft:borehead.diamond>);
recipes.addShaped(<Railcraft:borehead.diamond>, [
    [<minecraft:diamond>, boreCrownDia,      <minecraft:diamond>],
    [boreCrownDia,        <ore:blockSteel>,  boreCrownDia],
    [<minecraft:diamond>, boreCrownDia,      <minecraft:diamond>]
]);

// Ognennyy kamen' (vechnoe toplivo, perezaryazhaetsya v lave) - vyrezan. Generatsiya vyklyuchena v railcraft.cfg.
recipes.remove(<Railcraft:firestone.refined>);
recipes.remove(<Railcraft:firestone.cut>);

// Droblenie kimberlita: kamen' bezdny -> graviy + 0.8% almaza (primerno 1 almaz na 2 staka porody).
mods.railcraft.RockCrusher.removeRecipe(<Railcraft:cube:6>);
mods.railcraft.RockCrusher.addRecipe(
    <Railcraft:cube:6>, true, false,
    [<minecraft:gravel>, <minecraft:diamond>],
    [1.0,                0.008]
);

// ====================================================================================
// PIROLIZ ORGANIKI (koksovaya pech' = piroliznaya pech')
//   opilki, mul'cha -> pyl' drevesnogo uglya (v dymnyy porokh) + 25 mB smoly
//   kost' -> 4 kostnoy muki (kostyanoy ugol'/zola, fosfor) + 25 mB kostyanogo masla (kak smola)
//   rezina (pererabotka shin) -> tekhnicheskiy uglerod (= ugol'naya pyl') + 100 mB piroliznoy smoly
// PARTII: yaschik Forestry (9 shtuk, upakovka v plotnike) idyot v pech' tselikom. Vremya - kak u 3 shtuk,
//   a ne u 9: pech' greet zagruzku razom. Ugol'nyy blok -> blok koksa tak zhe (bylo 9 kh vremya).
// V kontse fayla: esli ID yaschikov Forestry ne sovpadut, upadyot tol'ko etot blok.
// ====================================================================================
mods.railcraft.CokeOven.addRecipe(<Forestry:woodPulp>, true, false, <Railcraft:dust:3>, creosote * 25, 600);
mods.railcraft.CokeOven.addRecipe(<Forestry:mulch>, false, false, <Railcraft:dust:3>, creosote * 25, 600);
mods.railcraft.CokeOven.addRecipe(<minecraft:bone>, false, false, <minecraft:dye:15> * 4, creosote * 25, 600);
mods.railcraft.CokeOven.addRecipe(<IC2:itemRubber>, false, false, <IC2:itemDust:2>, creosote * 100, 1200);

mods.railcraft.CokeOven.addRecipe(<Forestry:cratedWood>, false, false, <minecraft:coal:1> * 9, creosote * 180, 5400);
mods.railcraft.CokeOven.addRecipe(<Forestry:cratedSpruceWood>, false, false, <minecraft:coal:1> * 9, creosote * 180, 5400);
mods.railcraft.CokeOven.addRecipe(<Forestry:cratedBirchWood>, false, false, <minecraft:coal:1> * 9, creosote * 180, 5400);
mods.railcraft.CokeOven.addRecipe(<Forestry:cratedJungleWood>, false, false, <minecraft:coal:1> * 9, creosote * 180, 5400);
mods.railcraft.CokeOven.addRecipe(<Forestry:cratedAcaciaWood>, false, false, <minecraft:coal:1> * 9, creosote * 180, 5400);
mods.railcraft.CokeOven.addRecipe(<Forestry:cratedDarkOakWood>, false, false, <minecraft:coal:1> * 9, creosote * 180, 5400);
mods.railcraft.CokeOven.addRecipe(<Forestry:cratedMulch>, false, false, <Railcraft:dust:3> * 9, creosote * 225, 2700);

// ====================================================================================
// PROKATKA VYGODNEE KOVKI (Zavod 1.26): prokatnyy stan - 4 slitka -> 6 plastin (tonkiy list), molot - 1:1.
// Zhest' (olovyannaya plastina Railcraft) - rodnoy retsept, ne trogaem.
// ====================================================================================
mods.railcraft.Rolling.removeRecipe(<Railcraft:part.plate:0>);
mods.railcraft.Rolling.addShaped(<Railcraft:part.plate:0> * 6, [[<ore:ingotIron>, <ore:ingotIron>], [<ore:ingotIron>, <ore:ingotIron>]]);
mods.railcraft.Rolling.removeRecipe(<Railcraft:part.plate:1>);
mods.railcraft.Rolling.addShaped(<Railcraft:part.plate:1> * 6, [[<ore:ingotSteel>, <ore:ingotSteel>], [<ore:ingotSteel>, <ore:ingotSteel>]]);
mods.railcraft.Rolling.removeRecipe(<Railcraft:part.plate:3>);
mods.railcraft.Rolling.addShaped(<Railcraft:part.plate:3> * 6, [[<ore:ingotCopper>, <ore:ingotCopper>], [<ore:ingotCopper>, <ore:ingotCopper>]]);
mods.railcraft.Rolling.removeRecipe(<Railcraft:part.plate:4>);
mods.railcraft.Rolling.addShaped(<Railcraft:part.plate:4> * 6, [[<ore:ingotLead>, <ore:ingotLead>], [<ore:ingotLead>, <ore:ingotLead>]]);

// ====================================================================================
// PUTEVYE MASHINY (Zavod 1.50): kran na stal'nykh trosakh vmesto porshney, almazov, nakovalen i razdatchikov.
// Puteukladchik (zven'evoy, s 1930-kh): portal'nyy kran s lebyodkoy opuskaet zveno puti - tros + stal'nye shesterni.
// Razborschik: tot zhe kran, rel'sy otryvayut armirovannymi lomami. Pereukladchik = ukladchik + razborschik v odnom sostave.
// Podbivschik ballasta (ballastoochistitel'): vyrezayuschaya tsep' s burovymi koronkami s tokarki vmesto almaznykh lopat.
// Zhyoltaya okraska (svintsovyy kron na skipidare, Zavod 1.56.12) i signal'nyy fonar' - kak u nastoyaschikh putevykh mashin.
// ====================================================================================
val wireRope = <zavod:wire_rope>;
val crowbarR = <Railcraft:tool.crowbar.reinforced>;
recipes.remove(<Railcraft:cart.track.layer>);
recipes.addShaped(<Railcraft:cart.track.layer>, [
    [<zavod:paint_yellow>, <minecraft:redstone_lamp>, <zavod:paint_yellow>],
    [wireRope,        <ore:blockSteel>,          wireRope],
    [gearSteel,       <minecraft:minecart>,      gearSteel]
]);
recipes.remove(<Railcraft:cart.track.remover>);
recipes.addShaped(<Railcraft:cart.track.remover>, [
    [<zavod:paint_yellow>, <minecraft:redstone_lamp>, <zavod:paint_yellow>],
    [wireRope,        <ore:blockSteel>,          wireRope],
    [crowbarR,        <minecraft:minecart>,      crowbarR]
]);
recipes.remove(<Railcraft:cart.track.relayer>);
recipes.addShaped(<Railcraft:cart.track.relayer>, [
    [<zavod:paint_yellow>,                <minecraft:redstone_lamp>, <zavod:paint_yellow>],
    [<Railcraft:cart.track.remover>, gearSteel,                 <Railcraft:cart.track.layer>]
]);
recipes.remove(<Railcraft:cart.undercutter>);
recipes.addShaped(<Railcraft:cart.undercutter>, [
    [<zavod:paint_yellow>, <minecraft:redstone_lamp>, <zavod:paint_yellow>],
    [gearSteel,       <ore:blockSteel>,          gearSteel],
    [boreCrown,       <minecraft:minecart>,      boreCrown]
]);

// ====================================================================================
// KOTYoL VYSOKOGO DAVLENIYa: uteplitel' - shlakovata Zavod (B1 chat 3; bylo - mineral'naya vata TE)
// ====================================================================================
recipes.remove(<Railcraft:machine.beta:4>);
recipes.addShaped(<Railcraft:machine.beta:4>, [[<ore:plateSteel>], [<zavod:slag_wool>], [<ore:plateSteel>]]);
// Medno-nikelevaya stal' (alloys.zs): prochnyy list - stenka ton'she, iz togo zhe kolichestva -> 2 baka
recipes.addShaped(<Railcraft:machine.beta:4> * 2, [[<zavod:plate_alloy_steel>], [<zavod:slag_wool>], [<zavod:plate_alloy_steel>]]);
