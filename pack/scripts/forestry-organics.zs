// ====================================================================================
// ORGANICS FORESTRY -> PROMYShLENNOST'
// POChEMU: Forestry - mod pro proizvodstvo organiki, a ego produkty pochti nikuda ne shli.
// TEPER': torf -> koks, vosk i bumaga -> izolyatsiya kabeley, kompost -> biogaz,
//   frukty i myod -> konservy, propolis -> kley, slozhnoe udobrenie -> udobrenie IC2.
// Uzhe rabotaet bez skripta: zhidkotoplivnyy generator tepla IC2 zhzhyot biomassu i bioetanol Forestry.
// ====================================================================================

// --- Torfyanoy koks: bituminoznyy torf v koksovoy pechi Railcraft (vozobnovlyaemyy koks) ---
mods.railcraft.CokeOven.addRecipe(<Forestry:bituminousPeat>, false, false, <Railcraft:fuel.coke>, <liquid:creosote> * 150, 1800);

// --- Bumazhno-voskovaya izolyatsiya (kak u rannikh kabeley) - tol'ko nizkoe napryazhenie ---
// Med' i olovo: golyy kabel' + bumaga + pchelinyy vosk. Zoloto i vysokovol'tnyy - tol'ko rezina.
// Rezinovaya izolyatsiya - TOL'KO plotnik (obolochku vydavlivayut na stanke): 3 mednykh/olovyannykh + 1 rezina -> 3;
//   2 zolotykh + 2 reziny -> 2; vysokovol'tnyy + 2 reziny -> 1. Vruchnuyu rezinoy ne izolirovat'.
// Vruchnuyu - tol'ko nizkoe napryazhenie (med', olovo): bumaga + pchelinyy vosk -> 1, ili 4 kabelya + sherst' -> 4 (opletka).
recipes.remove(<IC2:itemCable>);
recipes.remove(<IC2:itemCable:13>);
recipes.remove(<IC2:itemCable:3>);
recipes.remove(<IC2:itemCable:6>);
recipes.addShapeless(<IC2:itemCable>,    [<IC2:itemCable:1>,  <minecraft:paper>, <ore:itemBeeswax>]);
recipes.addShapeless(<IC2:itemCable:13>, [<IC2:itemCable:10>, <minecraft:paper>, <ore:itemBeeswax>]);
recipes.addShapeless(<IC2:itemCable> * 4,    [<IC2:itemCable:1>,  <IC2:itemCable:1>,  <IC2:itemCable:1>,  <IC2:itemCable:1>,  <minecraft:wool:*>]);
recipes.addShapeless(<IC2:itemCable:13> * 4, [<IC2:itemCable:10>, <IC2:itemCable:10>, <IC2:itemCable:10>, <IC2:itemCable:10>, <minecraft:wool:*>]);
mods.forestry.Carpenter.addRecipe(<IC2:itemCable> * 3,    [[<IC2:itemCable:1>,  <IC2:itemCable:1>,  <IC2:itemCable:1>],  [null, <ore:itemRubber>, null]], 20);
mods.forestry.Carpenter.addRecipe(<IC2:itemCable:13> * 3, [[<IC2:itemCable:10>, <IC2:itemCable:10>, <IC2:itemCable:10>], [null, <ore:itemRubber>, null]], 20);
mods.forestry.Carpenter.addRecipe(<IC2:itemCable:3> * 2,  [[<IC2:itemCable:2>,  <IC2:itemCable:2>], [<ore:itemRubber>, <ore:itemRubber>]], 30);
mods.forestry.Carpenter.addRecipe(<IC2:itemCable:6>,      [[<ore:itemRubber>, <IC2:itemCable:5>, <ore:itemRubber>]], 40);

// --- Kompost Forestry -> biomassa IC2 (dlya fermentera) ---
// V zavod.jar (Ic2Enrich): <liquid:ic2biomass> * 1000, <liquid:water> * 1000, <Forestry:fertilizerBio> * 2 - MT ne otkatyvaet obogaschenie IC2, skript padal pri vkhode v mir

// --- Konservy: frukty i myod Forestry v zhestyanye banki IC2 (eda dlya shlemov nano/kvant) ---
mods.ic2.Canner.addBottleRecipe(<IC2:itemTinCanFilled> * 2, <IC2:itemTinCan> * 2, <Forestry:fruits:*>);
mods.ic2.Canner.addBottleRecipe(<IC2:itemTinCanFilled> * 4, <IC2:itemTinCan> * 4, <Forestry:honeyedSlice>);
mods.ic2.Canner.addBottleRecipe(<IC2:itemTinCanFilled>,     <IC2:itemTinCan>,     <Forestry:honeyDrop>);

// --- Propolis - pchelinyy kley: vtoroy put' k lipkomu porshnyu (pervyy - lateks, rubber.zs) ---
recipes.addShapeless(<minecraft:sticky_piston>, [<minecraft:piston>, <Forestry:propolis:*>]);

// --- Slozhnoe udobrenie Forestry -> udobrenie IC2 (dlya Crop-Matron) ---
recipes.addShapeless(<IC2:itemFertilizer> * 2, [<Forestry:fertilizerCompound>, <Forestry:fertilizerCompound>]);

// ====================================================================================
// PROMYShLENNAYa ORGANIKA: KUDA DEVAT' UROZhAY
// ====================================================================================
// --- Metantenk est lyubuyu organiku: 8 edinits urozhaya + 1000 mB vody -> 1000 mB biomassy ---
// (kak real'nye biogazovye stantsii na pischevykh i sel'khozotkhodakh)
// V zavod.jar (Ic2Enrich): <liquid:ic2biomass> * 1000, <liquid:water> * 1000, <minecraft:potato> * 8 - MT ne otkatyvaet obogaschenie IC2, skript padal pri vkhode v mir
// V zavod.jar (Ic2Enrich): <liquid:ic2biomass> * 1000, <liquid:water> * 1000, <minecraft:carrot> * 8 - MT ne otkatyvaet obogaschenie IC2, skript padal pri vkhode v mir
// V zavod.jar (Ic2Enrich): <liquid:ic2biomass> * 1000, <liquid:water> * 1000, <minecraft:apple> * 8 - MT ne otkatyvaet obogaschenie IC2, skript padal pri vkhode v mir
// V zavod.jar (Ic2Enrich): <liquid:ic2biomass> * 1000, <liquid:water> * 1000, <minecraft:wheat> * 8 - MT ne otkatyvaet obogaschenie IC2, skript padal pri vkhode v mir
// V zavod.jar (Ic2Enrich): <liquid:ic2biomass> * 1000, <liquid:water> * 1000, <minecraft:reeds> * 8 - MT ne otkatyvaet obogaschenie IC2, skript padal pri vkhode v mir
// V zavod.jar (Ic2Enrich): <liquid:ic2biomass> * 1000, <liquid:water> * 1000, <minecraft:poisonous_potato> * 4 - MT ne otkatyvaet obogaschenie IC2, skript padal pri vkhode v mir

// --- Getinaks: plata iz bumagi, propitannoy smoloy (kreozot = kamennougol'naya smola) ---
// Tak delali nastoyaschie rannie platy. Vtoroy put' k bazovoy plate Forestry, vygodnee vanil'nogo (2 vmesto 1).
// Bumaga - iz trostnika (rezinovyy trostnik dayot trostnik) ili drevesnoy massy Forestry.
mods.forestry.Carpenter.addRecipe(<Forestry:chipsets> * 2, [
    [<minecraft:paper>,    <minecraft:paper>, <minecraft:paper>],
    [<ore:dustRedstone>,   <ore:ingotTin>,    <ore:dustRedstone>],
    [<minecraft:paper>,    <minecraft:paper>, <minecraft:paper>]
], <liquid:creosote> * 250, 40);
// Platy vyshe klassom - tot zhe getinaks, provodniki - stolbik metalla klassa (kak u Forestry: bronza / zhelezo / zoloto).
// Metall tot zhe, chto v rodnom retsepte (3 slitka), krasnoy pyli vtroe men'she, plat - 2 vmesto 1.
mods.forestry.Carpenter.addRecipe(<Forestry:chipsets:1> * 2, [
    [<minecraft:paper>,  <ore:ingotBronze>, <minecraft:paper>],
    [<ore:dustRedstone>, <ore:ingotBronze>, <ore:dustRedstone>],
    [<minecraft:paper>,  <ore:ingotBronze>, <minecraft:paper>]
], <liquid:creosote> * 250, 40);
mods.forestry.Carpenter.addRecipe(<Forestry:chipsets:2> * 2, [
    [<minecraft:paper>,  <ore:ingotIron>, <minecraft:paper>],
    [<ore:dustRedstone>, <ore:ingotIron>, <ore:dustRedstone>],
    [<minecraft:paper>,  <ore:ingotIron>, <minecraft:paper>]
], <liquid:creosote> * 250, 80);
mods.forestry.Carpenter.addRecipe(<Forestry:chipsets:3> * 2, [
    [<minecraft:paper>,  <ore:ingotGold>, <minecraft:paper>],
    [<ore:dustRedstone>, <ore:ingotGold>, <ore:dustRedstone>],
    [<minecraft:paper>,  <ore:ingotGold>, <minecraft:paper>]
], <liquid:creosote> * 250, 80);

// --- Rezina: prorezinennyy kostyum IC2 (zaschita ot radiatsii) - i tak na rezine, eto glavnyy eyo stok v AES ---

// ====================================================================================
// DOBYChA S MONSTROV -> KhIMIYa
// Superfosfat (kak u Lousa v 1842): kostnaya muka + sernaya kislota (sera) + voda -> 4 slozhnykh udobreniya Forestry.
// Gnilaya plot' -> metantenk: 8 shtuk + 1000 mB vody -> 1000 mB biomassy.
// ====================================================================================
mods.forestry.Carpenter.addRecipe(<Forestry:fertilizerCompound> * 4, [
    [<minecraft:dye:15>, <minecraft:dye:15>],
    [<minecraft:dye:15>, <minecraft:dye:15>]
], <liquid:sulfuricacid> * 500, 40);
// V zavod.jar (Ic2Enrich): <liquid:ic2biomass> * 1000, <liquid:water> * 1000, <minecraft:rotten_flesh> * 8 - MT ne otkatyvaet obogaschenie IC2, skript padal pri vkhode v mir

// ====================================================================================
// PEREGONNYY KUB FORESTRY - NE TOL'KO SPIRT
//   voda -> distillirovannaya voda IC2 (1:1): dlya parogeneratora (bez nakipi) i khladagenta reaktora
// ====================================================================================
mods.forestry.Still.addRecipe(<liquid:ic2distilledwater> * 10, <liquid:water> * 10, 20);
// Spirt (A12, 1.56.44) - brozhenie v zakrytoy bochke (suslo: voda + sakhar/zerno/kartoshka -> braga za sutki) i
// peregonka bragi v vyparnom apparate (spirt + barda-mul'cha). Biomassa -> bioetanol v peregonnom kube Forestry - snyat:
// listva i sazhentsy idut v biomassu -> biogaz (khimreaktor Zavod, anaerobnoe sbrazhivanie, vykhod malyy).
mods.forestry.Still.removeRecipe(<liquid:bioethanol>, <liquid:biomass>);
// (samogon EnderIO -> bioetanol: udaleno vmeste s EnderIO)

// ====================================================================================
// LESOKhIMIYa: LISTVA I KhVOYa (list'ya sobirayutsya nozhnitsami)
//   khvoya (listva eli) -> sokovyzhimalka: 8 shtuk -> 100 mB masla (khvoynoe maslo; kak rastitel'noe: olifa, lak, propitka)
//     + 30% mul'chi. Lakom na etom masle pokryvayut stal'nye gil'zy.
//   lyubaya listva -> fermenter Forestry -> biomassa (khvoya brodit khuzhe: smoly meshayut brozheniyu)
//   (uzhe bylo v IC2: 8 list'ev v drobitele -> bioplevely -> biomassa)
// Dyogot' iz beresty = kreozot: beryoza v koksovoy pechi i tak dayot ugol' + smolu.
// ====================================================================================
mods.forestry.Squeezer.addRecipe(<liquid:seedoil> * 100, <Forestry:mulch> % 30, [<minecraft:leaves:1> * 8], 40);
mods.forestry.Fermenter.addRecipe(<liquid:biomass>, <minecraft:leaves:0>, <liquid:water>, 100, 1.0);
mods.forestry.Fermenter.addRecipe(<liquid:biomass>, <minecraft:leaves:1>, <liquid:water>, 60, 1.0);
mods.forestry.Fermenter.addRecipe(<liquid:biomass>, <minecraft:leaves:2>, <liquid:water>, 100, 1.0);
mods.forestry.Fermenter.addRecipe(<liquid:biomass>, <minecraft:leaves:3>, <liquid:water>, 100, 1.0);
mods.forestry.Fermenter.addRecipe(<liquid:biomass>, <minecraft:leaves2:0>, <liquid:water>, 100, 1.0);
mods.forestry.Fermenter.addRecipe(<liquid:biomass>, <minecraft:leaves2:1>, <liquid:water>, 100, 1.0);
// Sazhentsy -> biomassa (Zavod 1.46): vanil'nye i Forestry brodyat i tak; zdes' - vse ostal'nye po slovaryu
// (kauchukonos IC2, frukty Pam's...). Kak vanil'nyy sazhenets: 250 mB.
for sapling in <ore:treeSapling>.items {
    mods.forestry.Fermenter.addRecipe(<liquid:biomass>, sapling, <liquid:water>, 250, 1.0);
}

// ====================================================================================
// AMMIAChNAYa SELITRA -> UDOBRENIE (Zavod 1.30): glavnoe primenenie selitry - ne vzryvchatka, a pole.
// Selitra (khimreaktor: ammiak + azotnaya) + pesok-napolnitel' -> udobrenie Forestry; + zemlya -> udobrenie IC2.
// ====================================================================================
recipes.addShapeless(<Forestry:fertilizerCompound> * 4, [<zavod:ammonium_nitrate>, <minecraft:sand>, <minecraft:sand>]);
recipes.addShapeless(<IC2:itemFertilizer> * 3, [<zavod:ammonium_nitrate>, <minecraft:dirt>]);

// ====================================================================================
// ZOLA = POTASh (Zavod 1.34): zola rasteniy bogata potashom (karbonat kaliya) - iz neyo veka delali kaliynuyu selitru.
// Drevesnye otkhody (opilki pilorami, mul'cha) szhigayutsya v pechi do zoly. Zol'niki topok Zavod (tigel', retorta)
// dayut zolu s drov i ugol'nuyu zolu s uglya (1.56.25, sm. potash.zs). Selitra: 750 mB azotnoy + zola v khimreaktore.
// ====================================================================================
furnace.addRecipe(<Forestry:ash>, <Forestry:woodPulp>);
furnace.addRecipe(<Forestry:ash>, <Forestry:mulch>);
