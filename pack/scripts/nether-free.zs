// ====================================================================================
// BEZ NIZhNEGO MIRA: svetopyl', kvarts, adskiy kirpich, porokh ifrita v obychnoy tekhnike.
// POChEMU: Nizhniy mir v sborke - ne istochnik resursov. Vsyo, chto delaetsya v Verkhnem mire,
// delaetsya iz materialov Verkhnego mira. Ostalis' bez zameny tol'ko pozdnie i "magicheskie" veschi
// (kvantovoe yadro, irradiantnyy uran, uskoritel' GraviSuite, adskie fermy Forestry, osvetitel' TE).
// Svetopyl' pri etom dobyvaema: IC2 - redstoun + zolotaya pyl' (skrytyy retsept, v NEI ne viden).
// Retsepty, kotorye MT ne adresuet (put' posadki, payal'naya stantsiya LP, fonari BiblioCraft,
// signal'naya lampa RC, sborochnyy stol BC), menyaet zavod.jar (NetherSwap) - forma retsepta rodnaya, zamenyon odin ingredient.
// ====================================================================================

val cuCable    = <IC2:itemCable>;            // izolirovannyy mednyy kabel'
val circuit    = <ore:circuitBasic>;
val redstone   = <minecraft:redstone>;
val pane       = <minecraft:glass_pane>;
val glass      = <minecraft:glass>;
val plate      = <minecraft:stone_pressure_plate>;

// ------------------------------------------------------------------------------------
// VANIL'NAYa REDSTOUN-TEKhNIKA
// ------------------------------------------------------------------------------------
// Lampa: stekl'yannaya kolba, mednaya nit' nakala, redstoun-pitanie. BYLO: blok svetokamnya.
recipes.remove(<minecraft:redstone_lamp>);
recipes.addShaped(<minecraft:redstone_lamp>, [
    [null,     redstone, null],
    [redstone, glass,    redstone],
    [null,     cuCable,  null]
]);

// Komparator: mednaya plastina-kontakt (rele sravneniya). BYLO: adskiy kvarts.
recipes.remove(<minecraft:comparator>);
recipes.addShaped(<minecraft:comparator>, [
    [null,                      <minecraft:redstone_torch>, null],
    [<minecraft:redstone_torch>, <ore:plateCopper>,         <minecraft:redstone_torch>],
    [<minecraft:stone>,          <minecraft:stone>,          <minecraft:stone>]
]);

// Datchik dnevnogo sveta: kremnievyy fotoelement. BYLO: adskiy kvarts.
recipes.remove(<minecraft:daylight_detector>);
recipes.addShaped(<minecraft:daylight_detector>, [
    [glass,             glass,             glass],
    [<zavod:silicon>,   <zavod:silicon>,   <zavod:silicon>],
    [<ore:slabWood>,    <ore:slabWood>,    <ore:slabWood>]
]);

// ------------------------------------------------------------------------------------
// IC2: PRIBORY
// ------------------------------------------------------------------------------------
// EU-metr: steklo shkaly. BYLO: svetopyl'.
recipes.remove(<IC2:itemToolMEter>);
recipes.addShaped(<IC2:itemToolMEter>, [
    [null,    pane,    null],
    [cuCable, circuit, cuCable],
    [cuCable, null,    cuCable]
]);

// Pul't podryva: redstoun-tsep' vmesto svetopyli. Vtoroy (bez svetopyli) retsept vozvraschyon kak byl.
recipes.remove(<IC2:itemRemote>);
recipes.addShaped(<IC2:itemRemote>, [
    [null,              cuCable,           null],
    [redstone,          circuit,           redstone],
    [<minecraft:tnt>,   <minecraft:tnt>,   <minecraft:tnt>]
]);
recipes.addShaped(<IC2:itemRemote>, [
    [null,              cuCable,           null],
    [<IC2:itemCasing:1>, <ore:dustLapis>,  <IC2:itemCasing:1>],
    [null,              <IC2:itemFreq>,    null]
]);

// ------------------------------------------------------------------------------------
// RAILCRAFT
// ------------------------------------------------------------------------------------
// Detektory: material korpusa vmesto adskogo kirpicha/kvartsa (u kazhdogo detektora svoy material).
// Poezd - zheleznye plastiny (stsepka), lokomotiv - bronzovye (parovaya armatura), marshrut - mednye (kontakty bileta).
recipes.remove(<Railcraft:detector:12>);
recipes.addShaped(<Railcraft:detector:12>, [[<ore:plateIron>, <ore:plateIron>, <ore:plateIron>], [<ore:plateIron>, plate, <ore:plateIron>], [<ore:plateIron>, <ore:plateIron>, <ore:plateIron>]]);
recipes.remove(<Railcraft:detector:15>);
recipes.addShaped(<Railcraft:detector:15>, [[<ore:plateBronze>, <ore:plateBronze>, <ore:plateBronze>], [<ore:plateBronze>, plate, <ore:plateBronze>], [<ore:plateBronze>, <ore:plateBronze>, <ore:plateBronze>]]);
recipes.remove(<Railcraft:detector:16>);
recipes.addShaped(<Railcraft:detector:16>, [[<ore:plateCopper>, <ore:plateCopper>, <ore:plateCopper>], [<ore:plateCopper>, plate, <ore:plateCopper>], [<ore:plateCopper>, <ore:plateCopper>, <ore:plateCopper>]]);

// Skorostnoy rel's: tsementatsiya koksom (zakalka golovki rel'sa). BYLO: porokh ifrita.
mods.railcraft.Rolling.removeRecipe(<Railcraft:part.rail:3>);
mods.railcraft.Rolling.addShaped(<Railcraft:part.rail:3> * 8, [
    [<ore:ingotSteel>, <Railcraft:fuel.coke>, <ore:ingotGold>],
    [<ore:ingotSteel>, <Railcraft:fuel.coke>, <ore:ingotGold>],
    [<ore:ingotSteel>, <Railcraft:fuel.coke>, <ore:ingotGold>]
]);

// Putepereukladchik (BYLO: sterzhni ifrita) - s 1.50 v railcraft.zs, vmeste s ostal'nymi putevymi mashinami.

// ------------------------------------------------------------------------------------
// BUILDCRAFT
// ------------------------------------------------------------------------------------
// Kvartsevaya truba = truba iz chistogo plavlenogo stekla: opticheskoe steklo tiglya (kremen'/pesok + svinets/potash na
// kokse). BYLO: bloki adskogo kvartsa, potom (do 1.56.60) - prostoe steklo.
recipes.remove(<BuildCraft|Transport:item.buildcraftPipe.pipeitemsquartz>);
recipes.addShaped(<BuildCraft|Transport:item.buildcraftPipe.pipeitemsquartz> * 8, [[<zavod:optical_glass>, <zavod:optical_glass>, <zavod:optical_glass>]]);

// Kvartsevyy chipset (sborochnyy stol, posle chertezha lazera): kremniy vmesto adskogo kvartsa - v zavod.jar (NetherSwap),
// MT etot stol v BC 7 ne podderzhivaet. Bez chertezha kvartsevogo chipseta po-prezhnemu net.

// ------------------------------------------------------------------------------------
// FORESTRY / THERMAL EXPANSION
// ------------------------------------------------------------------------------------
// Stabilizator ul'ya: svintsovyy ekran ot mutatsiy. BYLO: adskiy kvarts.
recipes.remove(<Forestry:alveary:6>);
recipes.addShaped(<Forestry:alveary:6>, [
    [<ore:plateLead>, null,               <ore:plateLead>],
    [<ore:plateLead>, <Forestry:alveary>, <ore:plateLead>],
    [<ore:plateLead>, null,               <ore:plateLead>]
]);

// Ekskursionnaya plita TE: zakalyonnoe steklo vmesto blokov kvartsa.

