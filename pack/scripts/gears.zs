// ====================================================================================
//                    EDINYY STANDART ShESTERYoN I VTULOK
// POChEMU: shesternya - eto ne "4 slitka vokrug palki". Eto venets iz prokata na vtulke-podshipnike.
// TEPER': lyubaya metallicheskaya shesternya = 4 plastiny + vtulka Railcraft + kuznechnyy molot.
//         Net plastin u metalla (invar) - slitki + molot.
// Vtulka (Tin Bushing, part.gear:3) - vkladysh iz babbita (olovo + med', alloys.zs). Ona zhe idyot v kolyosnye pary vagonetok.
// Derevyannoy shesterni net (vyrezana v global.zs) - kamennaya sobiraetsya na vtulke.
// ====================================================================================

val hammer   = <IC2:itemToolForgeHammer>.anyDamage();
val bushing  = <Railcraft:part.gear:3>;

val plateIron   = <ore:plateIron>;
val plateSteel  = <ore:plateSteel>;
val plateCopper = <ore:plateCopper>;
val plateBronze = <ore:plateBronze>;
val plateGold   = <ore:plateGold>;
val cobble      = <ore:cobblestone>;

// --- Vtulka: babbitovyy vkladysh (BYLO: chistoe olovo) ---
recipes.remove(bushing);
// Vruchnuyu 4 plastiny -> 1 vtulka. Na tokarnoy opravke (zagotovka 2-2-2-2-2, ne raskhoduetsya) -> 4 vtulki.
recipes.addShaped(bushing, [[<zavod:ingot_babbitt>, <zavod:ingot_babbitt>], [<zavod:ingot_babbitt>, <zavod:ingot_babbitt>]]);
recipes.addShaped(bushing * 4, [[null, <zavod:ingot_babbitt>, null], [<zavod:ingot_babbitt>, <IC2:itemTurningBlanks:139810>.reuse(), <zavod:ingot_babbitt>], [null, <zavod:ingot_babbitt>, null]]);
// Metalloformovschik (ekstruziya): blok olova -> truba -> 9 vtulok. Osnovnoy put', kak tol'ko est' EU.
// Ruchnoy kraft 4 -> 1 nuzhen tol'ko chtoby sobrat' sam metalloformovschik (2 stal'nye shesterni = 2 vtulki).
mods.ic2.MetalFormer.addExtrudingRecipe(bushing * 2, <zavod:ingot_babbitt>);

// --- Kamennaya shesternya BC (nuzhna gaechnomu klyuchu, avtoverstaku, nasosu-skvazhine, voronke, dvizhku na krasnom kamne) ---
// BYLO: delalas' iz derevyannoy, kotoruyu my vyrezali -> vsya lineyka BC-shesteryon i Redstone Engine umerli.
recipes.remove(<BuildCraft|Core:stoneGearItem>);
recipes.addShaped(<BuildCraft|Core:stoneGearItem>, [[null, cobble, null], [cobble, bushing, cobble], [null, cobble, null]]);

// --- Metallicheskie shesterni: [molot, plastina, -] / [plastina, vtulka, plastina] / [-, plastina, -] ---
// Zheleznye
recipes.remove(<BuildCraft|Core:ironGearItem>);
recipes.addShaped(<BuildCraft|Core:ironGearItem>, [[hammer, plateIron, null], [plateIron, bushing, plateIron], [null, plateIron, null]]);
recipes.remove(<Railcraft:part.gear:1>);

recipes.addShapeless(<Railcraft:part.gear:1>, [<BuildCraft|Core:ironGearItem>]); // odna i ta zhe shesternya raznykh modov: odinakovyy shaped - verstak otdayot tol'ko pervuyu
recipes.addShapeless(<BuildCraft|Core:ironGearItem>, [<Railcraft:part.gear:1>]); // B1: krug BC <-> RC (TF iz kruga vynut)

// Stal'naya (Railcraft, ona zhe <ore:gearSteel>)
recipes.remove(<Railcraft:part.gear:2>);
recipes.addShaped(<Railcraft:part.gear:2>, [[hammer, plateSteel, null], [plateSteel, bushing, plateSteel], [null, plateSteel, null]]);

// Zolotye
recipes.remove(<BuildCraft|Core:goldGearItem>);
recipes.addShaped(<BuildCraft|Core:goldGearItem>,       [[hammer, plateGold, null], [plateGold, bushing, plateGold], [null, plateGold, null]]);

// Mednye (Forestry; TF snyata v B1)

recipes.remove(<Forestry:gearCopper>);
recipes.addShaped(<Forestry:gearCopper>, [[hammer, plateCopper, null], [plateCopper, bushing, plateCopper], [null, plateCopper, null]]);

// Bronzovye (Forestry; TF snyata v B1)

recipes.remove(<Forestry:gearBronze>);
recipes.addShaped(<Forestry:gearBronze>, [[hammer, plateBronze, null], [plateBronze, bushing, plateBronze], [null, plateBronze, null]]);

// Svintsovaya (TF)

// Invarovaya - nasha (zavod:gear_invar, metals.zs); TF snyata v B1

// OLOVYaNNYKh ShESTERYoN BOL'ShE NET: olovo srezhet zub'ya na pervom oborote.
// Vezde, gde modam nuzhna "olovyannaya shesternya" (mul'tiferma Forestry: reduktor, lyuk, klapan;
// dozhdevik; ramka mashiny TE i t.d.), teper' podkhodit BRONZOVAYa - bronza derzhit vysokie oboroty
// i dayot nizkoe trenie. Delaem eto cherez slovar': bronzovye shesterni dobavleny v <ore:gearTin>,
// a kraft samikh olovyannykh shesteryon (TF i Forestry) udalyon.
recipes.remove(<Forestry:gearTin>);
<ore:gearTin>.add(<Forestry:gearBronze>);
// Sami olovyannye shesterni iz slovarya ubiraem - zavalyavshiesya starye bol'she nikuda ne podkhodyat
<ore:gearTin>.remove(<Forestry:gearTin>);

// --- Dvizhok na krasnom kamne BC (nuzhen pompe BC): kamennye shesterni vmesto derevyannykh ---
recipes.remove(<BuildCraft|Core:engineBlock:0>);
recipes.addShaped(<BuildCraft|Core:engineBlock:0>, [
    [<ore:plankWood>,  <ore:plankWood>,  <ore:plankWood>],
    [null,             <ore:blockGlass>, null],
    [<ore:gearStone>,  <minecraft:piston>, <ore:gearStone>]
]);

// --- Zavod 1.55.4: ostal'nye shesterni TF - po tomu zhe standartu (BYLO: rodnoy retsept TF "4 slitka vokrug zheleza") ---
// Zheleznaya TF: rodnoy kraft ubran (vyshe), v krug ne vkhodit (B1)
// Olovyannoy net (sm. vyshe) - i kraft TF ubran

// Plastin etikh metallov v sborke net - kuyom iz slitkov na vtulke, kak invarovuyu

// --- Zavod 1.56.37 (A8): shesterni na prokatnom stane (avtoverstak BC retsepty s instrumentom ne delaet) ---
mods.railcraft.Rolling.addShaped(<BuildCraft|Core:ironGearItem>, [[null, plateIron, null], [plateIron, bushing, plateIron], [null, plateIron, null]]);
mods.railcraft.Rolling.addShaped(<Railcraft:part.gear:2>, [[null, plateSteel, null], [plateSteel, bushing, plateSteel], [null, plateSteel, null]]);
mods.railcraft.Rolling.addShaped(<BuildCraft|Core:goldGearItem>, [[null, plateGold, null], [plateGold, bushing, plateGold], [null, plateGold, null]]);
mods.railcraft.Rolling.addShaped(<Forestry:gearCopper>, [[null, plateCopper, null], [plateCopper, bushing, plateCopper], [null, plateCopper, null]]);
mods.railcraft.Rolling.addShaped(<Forestry:gearBronze>, [[null, plateBronze, null], [plateBronze, bushing, plateBronze], [null, plateBronze, null]]);

