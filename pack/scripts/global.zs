// ====================================================================================
//        GLOBAL'NYY PAK USLOZhNENIY "KhARDKORNAYa LOGISTIKA" (v3, ispravlennyy)
//     IC2 Experimental, Thermal Expansion, Forestry, BuildCraft, Railcraft
// ------------------------------------------------------------------------------------
// VAZhNO PRO MINETWEAKER 1.7.10: esli ID predmeta ne nayden, on prevraschaetsya v null.
//  - recipes.remove(null)      -> NullPointerException -> VES' OSTATOK FAYLA NE VYPOLNYaETSYa
//  - null vnutri addShaped     -> pustaya kletka (retsept stanovitsya drugim)
//  - pustoy <ore:...>          -> retsept dobavlen, no skraftit' ego nevozmozhno
// Poetomu posle kazhdogo izmeneniya smotri minetweaker.log na "Could not resolve" i "Error executing".
// ====================================================================================

// ====================================================================================
// 0. PEREMENNYE
// ====================================================================================

// --- Stal'naya shesternya: ni odin mod sborki ne registriruet <ore:gearSteel>.
// Railcraft imeet Steel Gear (part.gear:2), no ne kladyot eyo v slovar'. Kladyom sami.
<ore:gearSteel>.add(<Railcraft:part.gear:2>);

// --- BAZOVYE KOMPONENTY ---
val reBattery          = <IC2:itemBatREDischarged>;         // RE-batareya (BYLO: dvoynoy kondensator EnderIO)

val machineFrameIC2    = <IC2:blockMachine>;                 // Bazovyy korpus IC2 (meta 0)
val advMachineFrameIC2 = <IC2:blockMachine:12>;              // PRODVINUTYY korpus IC2 (meta 12, NE 8 - 8 eto pompa)
val copperCoil         = <IC2:itemRecipePart>;               // Katushka IC2 (meta 0, NE 3 - 3 eto malyy silovoy blok)
val motorIC2           = <IC2:itemRecipePart:1>;             // Elektromotor
val heatConductor      = <IC2:itemRecipePart:5>;             // Teploprovodnik
val circuitIC2         = <IC2:itemPartCircuit>;
val advCircuit         = <IC2:itemPartCircuitAdv>;
// Kuznechnyy molot. BEZ .transformDamage(): u molota IC2 uzhe est' "predmet-konteyner",
// on sam ostayotsya v setke s -1 prochnosti. transformDamage poverkh etogo dayot DYuP molota.
val hammer             = <IC2:itemToolForgeHammer>.anyDamage();
val piston             = <minecraft:piston>;
val tankBC             = <BuildCraft|Factory:tankBlock>;
val reinforcedGlass    = <IC2:blockAlloyGlass>;             // armirovannoe steklo IC2 (BYLO: kvartsevoe steklo EnderIO)
val blastBrick         = <Railcraft:machine.alpha:12>;       // Domennyy kirpich (NE cube:2 - eto blok stali!)

// --- ChIPY BUILDCRAFT (slovar' BC: chipsetRedstone/Iron/Gold/Diamond/Quartz, a NE chipRedstone)

// --- PROKAT I SPLAVY ---
val plateIron   = <ore:plateIron>;
val plateCopper = <ore:plateCopper>;
val plateTin    = <ore:plateTin>;
val plateBronze = <ore:plateBronze>;
val plateSteel  = <ore:plateSteel>;
val plateGold   = <ore:plateGold>;

val oreSteel    = <ore:ingotSteel>;        // slovar' - dlya verstaka (podkhodit i stal' IC2)
val ingotBronze = <ore:ingotBronze>;
val ingotInvar  = <ore:ingotInvar>;
val blockInvar  = <ore:blockInvar>;
val steelBlock  = <ore:blockSteel>;

val itemPlateSteel  = <IC2:itemPlates:5>;   // Stal'naya plastina IC2 (dlya vykhodov retseptov)

// --- KINETIChESKAYa MATRITsA ShESTEREN ---
val gearSteel  = <ore:gearSteel>;  // Vysokiy moment (drobiteli, prokat, DVS)
val gearBronze = <ore:gearBronze>; // Vysokie oboroty (tsentrifugi, pompy, turbiny)
val gearInvar  = <ore:gearInvar>;  // Termostoykaya kinetika (pechi, termo-uzly)

// --- PLOTNYE PLASTINY IC2 ---
val denseBronze = <IC2:itemDensePlates:2>;
val denseCopper = <IC2:itemDensePlates:0>;

// ====================================================================================
// 1. VYREZANIE KhALYaVY
// ====================================================================================
// Kar'er BC NE vyrezan: dorogoy retsept s almaznymi koronkami - v buildcraft.zs.

recipes.remove(<IC2:itemArmorJetpackElectric>);     // Elektroranets IC2

// Vyvod iz ekspluatatsii derevyannykh, zheleznykh i olovyannykh shesteren.
// BYLO: material:128 - eto MEDNAYa shesternya, na ney visyat Pul'verizator i Ekstruder TE (stali nekraftabel'ny).
recipes.remove(<BuildCraft|Core:woodenGearItem>);

// ====================================================================================
// 2. KUZNEChNOE DELO: MOLOT I DVUKhUROVNEVYY KRAFT BRONI (ruchnoy s molotom = -1 slitok)
// ====================================================================================
recipes.remove(<IC2:itemToolForgeHammer>);
recipes.addShaped(<IC2:itemToolForgeHammer>, [
    [<ore:nuggetIron>, <ore:nuggetIron>, <ore:nuggetIron>],
    [<ore:nuggetIron>, <minecraft:stick>, <ore:nuggetIron>],
    [null,             <minecraft:stick>, null]
]);

// Ruchnaya kovka stal'noy plastiny (BYLO: na vykhode shesternya serebra material:130)
recipes.addShapeless(itemPlateSteel, [oreSteel, hammer]);

// --- BRONZOVAYa BRONYa IC2 (ponozhi/botinki ostavleny vanil'nymi) ---
recipes.remove(<IC2:itemArmorBronzeHelmet>);
recipes.remove(<IC2:itemArmorBronzeChestplate>);
recipes.remove(<IC2:itemArmorBronzeLegs>);

recipes.addShaped(<IC2:itemArmorBronzeHelmet>,     [[ingotBronze, hammer, ingotBronze], [ingotBronze, null, ingotBronze]]);
recipes.addShaped(<IC2:itemArmorBronzeHelmet>,     [[ingotBronze, ingotBronze, ingotBronze], [ingotBronze, null, ingotBronze]]);
recipes.addShaped(<IC2:itemArmorBronzeChestplate>, [[ingotBronze, hammer, ingotBronze], [ingotBronze, ingotBronze, ingotBronze], [ingotBronze, ingotBronze, ingotBronze]]);
recipes.addShaped(<IC2:itemArmorBronzeChestplate>, [[ingotBronze, null, ingotBronze], [ingotBronze, ingotBronze, ingotBronze], [ingotBronze, ingotBronze, ingotBronze]]);
recipes.addShaped(<IC2:itemArmorBronzeLegs>,   [[ingotBronze, hammer, ingotBronze], [ingotBronze, null, ingotBronze], [ingotBronze, null, ingotBronze]]);
recipes.addShaped(<IC2:itemArmorBronzeLegs>,   [[ingotBronze, ingotBronze, ingotBronze], [ingotBronze, null, ingotBronze], [ingotBronze, null, ingotBronze]]);
// BYLO: ponozhi i botinki udalyalis' bez zameny - ikh nel'zya bylo skraftit'. Botinki teper' ne trogaem.

// --- STAL'NAYa BRONYa RAILCRAFT ---
// BYLO: <Railcraft:armor.steel.chest> - takogo predmeta net (pravil'no armor.steel.plate).
// IMENNO ETA STROKA ronyala global.zs: vsyo, chto nizhe neyo, NE PRIMENYaLOS'.
recipes.remove(<Railcraft:armor.steel.helmet>);
recipes.remove(<Railcraft:armor.steel.plate>);
recipes.remove(<Railcraft:armor.steel.legs>);

recipes.addShaped(<Railcraft:armor.steel.helmet>, [[oreSteel, hammer, oreSteel], [oreSteel, null, oreSteel]]);
recipes.addShaped(<Railcraft:armor.steel.helmet>, [[oreSteel, oreSteel, oreSteel], [oreSteel, null, oreSteel]]);
recipes.addShaped(<Railcraft:armor.steel.plate>,  [[oreSteel, hammer, oreSteel], [oreSteel, oreSteel, oreSteel], [oreSteel, oreSteel, oreSteel]]);
recipes.addShaped(<Railcraft:armor.steel.plate>,  [[oreSteel, null, oreSteel], [oreSteel, oreSteel, oreSteel], [oreSteel, oreSteel, oreSteel]]);
recipes.addShaped(<Railcraft:armor.steel.legs>,   [[oreSteel, hammer, oreSteel], [oreSteel, null, oreSteel], [oreSteel, null, oreSteel]]);
recipes.addShaped(<Railcraft:armor.steel.legs>,   [[oreSteel, oreSteel, oreSteel], [oreSteel, null, oreSteel], [oreSteel, null, oreSteel]]);

// Lopatki parovoy turbiny Railcraft - turbina RC vyrezana (B1, railcraft.zs), retsepty snyaty.
recipes.remove(<Railcraft:part.turbine.blade>);

// ====================================================================================
// 3. PERVAYa STAL': DOMENNYY KIRPICh RAILCRAFT (do Nezera i do kompressora)
// BYLO: cube:2 = blok stali -> iz 2 zheleznykh plastin poluchalos' 4 bloka stali (36 slitkov).
// ====================================================================================
recipes.remove(blastBrick);
recipes.addShaped(blastBrick * 4, [
    [<minecraft:brick>, plateIron,       <minecraft:brick>],
    [<Railcraft:machine.alpha:7>, <minecraft:clay>, <Railcraft:machine.alpha:7>],   // shamot: koksovyy kirpich kak ogneupornyy napolnitel' + blok gliny
    [<minecraft:brick>, plateIron,       <minecraft:brick>]
]);
// (Zavod 1.49) Dinas: kirpich na kremnezyome (obozhzhyonnyy kremen') vmesto obychnogo - ogneupornee, vykhod bol'she: 6 vmesto 4.
recipes.addShaped(blastBrick * 6, [
    [<zavod:calcined_flint>, plateIron,       <zavod:calcined_flint>],
    [<Railcraft:machine.alpha:7>, <minecraft:clay>, <Railcraft:machine.alpha:7>],
    [<zavod:calcined_flint>, plateIron,       <zavod:calcined_flint>]
]);

// ====================================================================================
// 4. BRONZOVAYa GIDRODINAMIKA
// ====================================================================================
// MODPACK: nasos BC - v buildcraft.zs (rezinovye uplotneniya), staryy retsept zdes' ubran.

// Vodyanoy nakopitel' TE (Machine:8) - snyat v water.zs (Zavod 1.56.31, B5: voda konechna vne reki i morya).

// Vodyanaya mel'nitsa IC2 (blockKineticGenerator:4) - bronzovyy vek: zheleznyy korpus mashiny, kovanye valy, bronza.
// BYLO: prodvinutye skhema i korpus - mel'nitsa poyavlyalas' pozzhe, chem byla nuzhna.
recipes.remove(<IC2:blockKineticGenerator:4>);
recipes.addShaped(<IC2:blockKineticGenerator:4>, [
    [<ore:plateBronze>,      <ore:gearBronze>, <ore:plateBronze>],
    [<IC2:itemRecipePart:11>, <IC2:blockMachine>, <IC2:itemRecipePart:11>],
    [<ore:plateBronze>,      <ore:gearBronze>, <ore:plateBronze>]
]);

// Rotory: derevyannyy (diametr 5, 3 chasa raboty) - 4 derevyannye lopasti na kovanom valu.
// Zheleznyy, stal'noy i uglerodnyy - standartnye retsepty IC2 (zheleznyy: 4 zheleznye lopasti + zheleznyy val).
recipes.remove(<IC2:itemwoodrotor>);
recipes.addShaped(<IC2:itemwoodrotor>, [
    [null,                  <IC2:itemRecipePart:7>,  null],
    [<IC2:itemRecipePart:7>, <IC2:itemRecipePart:11>, <IC2:itemRecipePart:7>],
    [null,                  <IC2:itemRecipePart:7>,  null]
]);

// ====================================================================================
// 5. MEKhANIZMY IC2 EXPERIMENTAL
// Metadannye: blockMachine 2 elektropech', 3 drobitel', 4 ekstraktor, 5 kompressor,
// 12 PRODVINUTYY KORPUS, 13 induktsionnaya pech'; blockMachine2 3 termotsentrifuga, 4 metalloformovschik.
// BYLO: udalyalsya retsept prodvinutogo korpusa (blockMachine:12) i Crop-Matron'a (blockMachine2:2).
// ====================================================================================
recipes.remove(<IC2:blockMachine:3>);    // Drobitel'
recipes.remove(<IC2:blockMachine:5>);    // Kompressor
recipes.remove(<IC2:blockMachine:2>);    // Elektropech'
recipes.remove(<IC2:blockMachine:4>);    // Ekstraktor
recipes.remove(<IC2:blockMachine2:4>);   // Metalloformovschik
recipes.remove(<IC2:blockMachine:13>);   // Induktsionnaya pech'
recipes.remove(<IC2:blockMachine2:3>);   // Termotsentrifuga

// Drobitel' (schyoki iz kremnya + porshen' + stal' + bronzovyy reduktor)
recipes.addShaped(<IC2:blockMachine:3>, [
    [<minecraft:flint>, piston,          <minecraft:flint>],
    [plateSteel,        machineFrameIC2, plateSteel],
    [gearBronze,        circuitIC2,      gearBronze]
]);

// Kompressor (protivokhodnye porshni + stal'naya obshivka)
recipes.addShaped(<IC2:blockMachine:5>, [
    [piston,     plateSteel,      piston],
    [plateSteel, machineFrameIC2, plateSteel],
    [piston,     circuitIC2,      piston]
]);

// Elektropech' (teploprovodniki + domennyy kirpich)
recipes.addShaped(<IC2:blockMachine:2>, [
    [heatConductor, heatConductor,   heatConductor],
    [blastBrick,    machineFrameIC2, blastBrick],
    [plateSteel,    circuitIC2,      plateSteel]
]);

// Ekstraktor (press-porshen' + bronza + baki BC)
recipes.addShaped(<IC2:blockMachine:4>, [
    [plateBronze, piston,          plateBronze],
    [tankBC,      machineFrameIC2, tankBC],
    [plateBronze, circuitIC2,      plateBronze]
]);

// Metalloformovschik (stal'nye shesterni + motory + molot; v plotnike - bez molota)
recipes.addShaped(<IC2:blockMachine2:4>, [
    [gearSteel,  hammer,          gearSteel],
    [plateSteel, machineFrameIC2, plateSteel],
    [motorIC2,   circuitIC2,      motorIC2]
]);
mods.forestry.Carpenter.addRecipe(<IC2:blockMachine2:4>, [[gearSteel, null, gearSteel], [plateSteel, machineFrameIC2, plateSteel], [motorIC2, circuitIC2, motorIC2]], 40);   // plotnik: to zhe bez instrumenta (Zavod 1.40)

// Induktsionnaya pech' (katushki + invarovyy ekran + teploprovodniki)
recipes.addShaped(<IC2:blockMachine:13>, [
    [copperCoil,    advCircuit,         copperCoil],
    [heatConductor, advMachineFrameIC2, heatConductor],
    [ingotInvar,    copperCoil,         ingotInvar]
]);

// Termotsentrifuga (bronzovye shesterni + motor + invar, bez lazera)
recipes.addShaped(<IC2:blockMachine2:3>, [
    [gearBronze, motorIC2,           gearBronze],
    [ingotInvar, advMachineFrameIC2, ingotInvar],
    [gearBronze, advCircuit,         gearBronze]
]);

// MODPACK: ruchnoy retsept skhemy IC2 ubran - skhema tol'ko v plotnike (electronics.zs).

// ====================================================================================
// 6. KAMNELOM RAILCRAFT I GLUBOKAYa PERERABOTKA
// ====================================================================================
recipes.remove(<Railcraft:machine.alpha:15>);
recipes.addShaped(<Railcraft:machine.alpha:15> * 4, [
    [plateSteel, steelBlock, plateSteel],
    [gearBronze, motorIC2,   gearBronze],
    [plateSteel, piston,     plateSteel]
]);

// Graviy v kamnelome: pesok + glina + kremen'. Metallov net: vechnyy bulyzhnik (ekstruder, generator) = vechnyy metall.
mods.railcraft.RockCrusher.removeRecipe(<minecraft:gravel>);
mods.railcraft.RockCrusher.addRecipe(
    <minecraft:gravel>, true, false,
    [<minecraft:sand>, <minecraft:clay_ball>, <minecraft:flint>],
    [1.0,              0.35,                  0.20]
);

// Bulyzhnik -> graviy + kamennaya kroshka (meloch' drobleniya, pyl' kamnya IC2): zapolnitel' betona i stroitel'noy peny.
// Tsepochka: bulyzhnik -> graviy -> pesok, glina, kremen'.
mods.railcraft.RockCrusher.removeRecipe(<minecraft:cobblestone>);
mods.railcraft.RockCrusher.addRecipe(
    <minecraft:cobblestone>, true, false,
    [<minecraft:gravel>, <IC2:itemDust:9>],
    [1.0,                0.25]
);

// ====================================================================================
// ZhELEZOBETON: armatura + shlakotsement + kamennaya kroshka (zapolnitel') + voda, v plotnike (betonomeshalka).
// BYLO: 4 armatury + 5 kamnya vruchnuyu -> 8. TEPER': 4 armatury + 1 shlak + 4 kamennoy kroshki + 1000 mB vody -> 8.
// Kroshka - pobochka drobleniya bulyzhnika v kamnelome (global.zs) i promyvki rudy IC2.
// ====================================================================================
recipes.remove(<Railcraft:cube:1>);
mods.forestry.Carpenter.addRecipe(<Railcraft:cube:1> * 8, [
    [<IC2:itemDust:9>,      <Railcraft:part.rebar>, <IC2:itemDust:9>],
    [<Railcraft:part.rebar>, <ore:crystalSlag>,     <Railcraft:part.rebar>],
    [<IC2:itemDust:9>,      <Railcraft:part.rebar>, <IC2:itemDust:9>]
], <liquid:water> * 1000, 60);
// (Zavod 1.49.1) Zola-unos (pepel IC2 iz tverdotoplivnogo teplogeneratora) - putstsolan, zamenitel' tsementa (s 1930-kh):
// 2 pepla vmesto 1 shlaka (vyazhuschego v zole men'she), odna kroshka ustupaet mesto vtoromu peplu.
mods.forestry.Carpenter.addRecipe(<Railcraft:cube:1> * 8, [
    [<IC2:itemDust:9>,      <Railcraft:part.rebar>, <IC2:itemDust:9>],
    [<Railcraft:part.rebar>, <IC2:itemDust2:3>,     <Railcraft:part.rebar>],
    [<IC2:itemDust:9>,      <Railcraft:part.rebar>, <IC2:itemDust2:3>]
], <liquid:water> * 1000, 60);

// Glubokaya pererabotka zemli
// Otmuchivanie vruchnuyu: zemlyu razmeshivayut v vode, pesok osedaet, glina ostayotsya vzves'yu i otstaivaetsya.
// 8 zemli + vedro vody -> 2 komka gliny, vedro vozvraschaetsya. Dorogo po zemle, no s pervogo dnya, bez mashin.
recipes.addShapeless(<minecraft:clay_ball> * 2, [<minecraft:dirt>, <minecraft:dirt>, <minecraft:dirt>, <minecraft:dirt>, <minecraft:dirt>, <minecraft:dirt>, <minecraft:dirt>, <minecraft:dirt>, <minecraft:water_bucket>]);
mods.ic2.OreWasher.addRecipe([<minecraft:sand>, <minecraft:clay_ball>, <IC2:itemDustSmall:0>], <minecraft:dirt>, 100);

// Gumus (soil:0). BYLO soil:1 - eto bolotnaya zemlya.
recipes.addShaped(<Forestry:soil:0> * 8, [[<minecraft:dirt>, <minecraft:dirt>, <minecraft:dirt>], [<minecraft:dirt>, <Forestry:ash>, <minecraft:dirt>], [<minecraft:dirt>, <minecraft:dirt>, <minecraft:dirt>]]);

// ====================================================================================
// 7. KhIMIYa UGLYa, SERA, RASTITEL'NOE MASLO I HPHT-SINTEZ ALMAZOV
// POChEMU: ugol'naya pyl' v sborke = prakticheski chistyy uglerod. Poluchit' eyo mozhno TOL'KO razmolom KOKSA
// (v koksovoy pechi ugol' uzhe otdal letuchie i kreozot). Sera - pobochka razmola.
// Syroy ugol' v pyl' bol'she ne meletsya.
// ====================================================================================
val coke        = <Railcraft:fuel.coke>;
val coalDust    = <IC2:itemDust:2>;                 // Ugol'naya pyl' IC2 = "pyl' koksa"

// --- Ubiraem pomol syrogo uglya ---


// IC2 Macerator - config/ic2/macerator.ini

// --- Pomol koksa ---
// Vruchnuyu, do drobilok: koks + kuznechnyy molot -> ugol'naya pyl' (nuzhna dlya domennogo kirpicha)
recipes.addShapeless(coalDust, [coke, hammer]);
// Drobitel' IC2: koks -> pyl' zadan v config/ic2/macerator.ini (tam zhe ubran pomol syrogo uglya)

// BYLO: promyvka 2 ugol'noy pyli -> koks + sera. S novoy logikoy eto krugovoy retsept - ubran.


// Uglevolokno - iz ugol'noy pyli (to est' iz koksa)
recipes.remove(<IC2:itemPartCarbonFibre>);
recipes.addShaped(<IC2:itemPartCarbonFibre>, [[<ore:dustCoal>, <ore:dustCoal>], [<ore:dustCoal>, <ore:dustCoal>]]);

// HPHT-sintez almazov: ugol'naya pyl' + maslo -> ugol'nyy shar -> 8 sharov + zhelezo -> szhatyy shar -> kompressor -> almaz
recipes.remove(<IC2:itemPartCoalBall>);
recipes.remove(<IC2:itemPartCoalBlock>);
recipes.remove(<IC2:itemPartCoalChunk>);  // Ugol'naya glyba (szhatyy shar + obsidian) vyrezana - almaz tol'ko HPHT-sintezom
recipes.remove(<minecraft:diamond>);      // VNIMANIE: eto ubiraet i razborku almaznogo bloka na 9 almazov
// B1 chat 3: transpozer TE -> plotnik (brikety na maslyanom svyazuyuschem)
mods.forestry.Carpenter.addRecipe(<IC2:itemPartCoalBall>, [[coalDust, coalDust], [coalDust, coalDust]], <liquid:seedoil> * 250, 40);
recipes.addShaped(<IC2:itemPartCoalBlock>, [[<IC2:itemPartCoalBall>, <IC2:itemPartCoalBall>, <IC2:itemPartCoalBall>], [<IC2:itemPartCoalBall>, <ore:dustIron>, <IC2:itemPartCoalBall>], [<IC2:itemPartCoalBall>, <IC2:itemPartCoalBall>, <IC2:itemPartCoalBall>]]);
mods.ic2.Compressor.addRecipe(<minecraft:diamond>, <IC2:itemPartCoalBlock>);

// SOZh ubrana. Rastitel'noe maslo v sborke:
//  - svyazuyuschee dlya ugol'nykh sharov (HPHT-sintez, vyshe);
//  - faktis: sera + maslo -> rezinopodobnyy material (nizhe);
//  - gidroupor zhidkostnykh trub BC v plotnike (buildcraft.zs);
//  (poluzhidkostnyy generator IC2 vyrezan - maslo bol'she ne toplivo, ic2-machines.zs)

// ====================================================================================
// 7b. UNIVERSAL'NYE PLASTINY
// BYLO: plastiny Railcraft (prokatnyy stan) ne byli v slovare -> ne godilis' dlya retseptov IC2/MT,
// a plastiny IC2 ne godyatsya dlya rodnykh retseptov Railcraft. Dva nesovmestimykh prokata.
// TEPER': plastiny prokatnogo stana zapisany v slovar' -> podkhodyat VEZDE (i v Railcraft, i v IC2/skripty).
// Prokatnyy stan: 4 slitka -> 4 plastiny (1:1, kak molot), plyus bronza i zoloto (plastiny IC2).
// ====================================================================================
<ore:plateIron>.add(<Railcraft:part.plate:0>);
<ore:plateSteel>.add(<Railcraft:part.plate:1>);
<ore:plateTin>.add(<Railcraft:part.plate:2>);
<ore:plateCopper>.add(<Railcraft:part.plate:3>);
<ore:plateLead>.add(<Railcraft:part.plate:4>);
mods.railcraft.Rolling.addShaped(<IC2:itemPlates:2> * 6, [[ingotBronze, ingotBronze], [ingotBronze, ingotBronze]]);
mods.railcraft.Rolling.addShaped(<IC2:itemPlates:3> * 6, [[<ore:ingotGold>, <ore:ingotGold>], [<ore:ingotGold>, <ore:ingotGold>]]);

// Faktis (maslo + sera) - perenesyon v parovoy avtoklav Zavod: vulkanizatsiya tol'ko tam.

// ====================================================================================
// 8. FORESTRY: BIMETALLIChESKIE KORPUSA
// factory: 2 tsentrifuga, 5 vyzhimatel', 6 peregonnyy kub, 7 vetryak-dozhdevik; factory2:0 termoemissionnyy zavod
// BYLO: factory:6/:7 - lomalis' Peregonnyy kub i Dozhdevik vmesto Tsentrifugi i Zavoda.
// ====================================================================================
recipes.remove(<Forestry:sturdyMachine>);
recipes.addShaped(<Forestry:sturdyMachine>, [[plateBronze, plateIron, plateBronze], [plateIron, hammer, plateIron], [plateBronze, plateIron, plateBronze]]);
mods.forestry.Carpenter.addRecipe(<Forestry:sturdyMachine>, [[plateBronze, plateIron, plateBronze], [plateIron, null, plateIron], [plateBronze, plateIron, plateBronze]], 40);   // plotnik: to zhe bez instrumenta (Zavod 1.40)

// Vyzhimatel'
recipes.remove(<Forestry:factory:5>);
recipes.addShaped(<Forestry:factory:5>, [[denseBronze, piston, denseBronze], [denseBronze, <Forestry:sturdyMachine>, denseBronze], [gearBronze, motorIC2, gearBronze]]);

// Tsentrifuga
recipes.remove(<Forestry:factory:2>);
recipes.addShaped(<Forestry:factory:2>, [[gearSteel, <minecraft:glass_pane>, gearSteel], [gearBronze, <Forestry:sturdyMachine>, gearBronze], [plateBronze, motorIC2, plateBronze]]);

// Termoemissionnyy zavod (na invare)
recipes.remove(<Forestry:factory2:0>);
recipes.addShaped(<Forestry:factory2:0>, [[ingotInvar, <minecraft:glass_pane>, ingotInvar], [copperCoil, <Forestry:sturdyMachine>, copperCoil], [gearInvar, <minecraft:chest>, gearInvar]]);

// ------------------------------------------------------------------------------------
// Ostal'nye mashiny Forestry (Zavod 1.56.11): klyopanye listy vmesto slitkov, smotrovoe steklo (paneli, ne bloki),
// bez porshney. factory: 0 razlivochnaya, 1 plotnik, 3 fermenter, 4 uvlazhnitel', 6 peregonnyy kub, 7 dozhdevik;
// factory2:1 bochka dlya dozhdya; engine:3 biogenerator. Verstak Forestry (factory2:2) - kak byl (kniga, verstak, sunduk).
// ------------------------------------------------------------------------------------
val paneF   = <minecraft:glass_pane>;
val sturdyF = <Forestry:sturdyMachine>;
val cauldronF = <minecraft:cauldron>;

// Plotnik: verstak i bak na prochnom korpuse, bronzovyy privod
recipes.remove(<Forestry:factory:1>);
recipes.addShaped(<Forestry:factory:1>, [[plateBronze, paneF, plateBronze], [gearBronze, sturdyF, gearBronze], [plateBronze, <minecraft:crafting_table>, plateBronze]]);
// Razlivochnaya mashina: olovyannyy korpus, banki, dozirovochnyy kotyol
recipes.remove(<Forestry:factory:0>);
recipes.addShaped(<Forestry:factory:0>, [[plateTin, paneF, plateTin], [<Forestry:canEmpty>, sturdyF, <Forestry:canEmpty>], [gearBronze, cauldronF, gearBronze]]);
// Fermenter: mednyy brodil'nyy chan s meshalkoy
recipes.remove(<Forestry:factory:3>);
recipes.addShaped(<Forestry:factory:3>, [[plateCopper, paneF, plateCopper], [plateCopper, sturdyF, plateCopper], [gearBronze, cauldronF, gearBronze]]);
// Uvlazhnitel': olovyannaya vlazhnaya kamera
recipes.remove(<Forestry:factory:4>);
recipes.addShaped(<Forestry:factory:4>, [[plateTin, paneF, plateTin], [plateTin, sturdyF, plateTin], [gearBronze, cauldronF, gearBronze]]);
// Peregonnyy kub: mednyy kub-alambik
recipes.remove(<Forestry:factory:6>);
recipes.addShaped(<Forestry:factory:6>, [[plateCopper, paneF, plateCopper], [plateCopper, sturdyF, plateCopper], [plateCopper, cauldronF, plateCopper]]);
// Dozhdevik (posev oblakov iodistym serebrom, 1946): stal'naya puskovaya ustanovka. Bylo: almaznyy korpus.
recipes.remove(<Forestry:factory:7>);
recipes.addShaped(<Forestry:factory:7>, [[plateSteel, gearSteel, plateSteel], [plateSteel, sturdyF, plateSteel], [gearSteel, motorIC2, gearSteel]]);
// Bochka dlya dozhdya: zheleznaya tsisterna s reshyotkoy, bez prochnogo korpusa
recipes.remove(<Forestry:factory2:1>);
recipes.addShaped(<Forestry:factory2:1>, [[plateIron, <minecraft:iron_bars>, plateIron], [plateIron, cauldronF, plateIron], [plateIron, plateIron, plateIron]]);
// Biogenerator Forestry (etanol -> EU) - VYREZAN (B1): spirt - toplivo kotlov i gazovoy turbiny
recipes.remove(<Forestry:engine:3>);

// Mul'tiferma: korpus - mednye listy vmesto slitkov; klapan - bronzovaya armatura vmesto steklyannykh blokov.
// Reduktor, lyuk, pul't - rodnye (shesterni <ore:gearTin> u nas = bronzovye). Na kazhduyu otdelku bloka (11) - svoy retsept.
recipes.remove(<Forestry:ffarm:0>);
recipes.remove(<Forestry:ffarm:4>);
recipes.addShaped(<Forestry:ffarm:0>.withTag({FarmBlock: 0}), [[plateCopper, <minecraft:stonebrick:0>, plateCopper], [<ore:slabWood>, <Forestry:thermionicTubes:1>, <ore:slabWood>]]);
recipes.addShaped(<Forestry:ffarm:4>.withTag({FarmBlock: 0}), [[null, <Forestry:ffarm:0>.withTag({FarmBlock: 0}), null], [plateBronze, <ore:gearTin>, plateBronze]]);
recipes.addShaped(<Forestry:ffarm:0>.withTag({FarmBlock: 1}), [[plateCopper, <minecraft:stonebrick:1>, plateCopper], [<ore:slabWood>, <Forestry:thermionicTubes:1>, <ore:slabWood>]]);
recipes.addShaped(<Forestry:ffarm:4>.withTag({FarmBlock: 1}), [[null, <Forestry:ffarm:0>.withTag({FarmBlock: 1}), null], [plateBronze, <ore:gearTin>, plateBronze]]);
recipes.addShaped(<Forestry:ffarm:0>.withTag({FarmBlock: 2}), [[plateCopper, <minecraft:stonebrick:2>, plateCopper], [<ore:slabWood>, <Forestry:thermionicTubes:1>, <ore:slabWood>]]);
recipes.addShaped(<Forestry:ffarm:4>.withTag({FarmBlock: 2}), [[null, <Forestry:ffarm:0>.withTag({FarmBlock: 2}), null], [plateBronze, <ore:gearTin>, plateBronze]]);
recipes.addShaped(<Forestry:ffarm:0>.withTag({FarmBlock: 3}), [[plateCopper, <minecraft:brick_block>, plateCopper], [<ore:slabWood>, <Forestry:thermionicTubes:1>, <ore:slabWood>]]);
recipes.addShaped(<Forestry:ffarm:4>.withTag({FarmBlock: 3}), [[null, <Forestry:ffarm:0>.withTag({FarmBlock: 3}), null], [plateBronze, <ore:gearTin>, plateBronze]]);
recipes.addShaped(<Forestry:ffarm:0>.withTag({FarmBlock: 4}), [[plateCopper, <minecraft:sandstone:2>, plateCopper], [<ore:slabWood>, <Forestry:thermionicTubes:1>, <ore:slabWood>]]);
recipes.addShaped(<Forestry:ffarm:4>.withTag({FarmBlock: 4}), [[null, <Forestry:ffarm:0>.withTag({FarmBlock: 4}), null], [plateBronze, <ore:gearTin>, plateBronze]]);
recipes.addShaped(<Forestry:ffarm:0>.withTag({FarmBlock: 5}), [[plateCopper, <minecraft:sandstone:1>, plateCopper], [<ore:slabWood>, <Forestry:thermionicTubes:1>, <ore:slabWood>]]);
recipes.addShaped(<Forestry:ffarm:4>.withTag({FarmBlock: 5}), [[null, <Forestry:ffarm:0>.withTag({FarmBlock: 5}), null], [plateBronze, <ore:gearTin>, plateBronze]]);
recipes.addShaped(<Forestry:ffarm:0>.withTag({FarmBlock: 6}), [[plateCopper, <minecraft:nether_brick>, plateCopper], [<ore:slabWood>, <Forestry:thermionicTubes:1>, <ore:slabWood>]]);
recipes.addShaped(<Forestry:ffarm:4>.withTag({FarmBlock: 6}), [[null, <Forestry:ffarm:0>.withTag({FarmBlock: 6}), null], [plateBronze, <ore:gearTin>, plateBronze]]);
recipes.addShaped(<Forestry:ffarm:0>.withTag({FarmBlock: 7}), [[plateCopper, <minecraft:stonebrick:3>, plateCopper], [<ore:slabWood>, <Forestry:thermionicTubes:1>, <ore:slabWood>]]);
recipes.addShaped(<Forestry:ffarm:4>.withTag({FarmBlock: 7}), [[null, <Forestry:ffarm:0>.withTag({FarmBlock: 7}), null], [plateBronze, <ore:gearTin>, plateBronze]]);
recipes.addShaped(<Forestry:ffarm:0>.withTag({FarmBlock: 8}), [[plateCopper, <minecraft:quartz_block:0>, plateCopper], [<ore:slabWood>, <Forestry:thermionicTubes:1>, <ore:slabWood>]]);
recipes.addShaped(<Forestry:ffarm:4>.withTag({FarmBlock: 8}), [[null, <Forestry:ffarm:0>.withTag({FarmBlock: 8}), null], [plateBronze, <ore:gearTin>, plateBronze]]);
recipes.addShaped(<Forestry:ffarm:0>.withTag({FarmBlock: 9}), [[plateCopper, <minecraft:quartz_block:1>, plateCopper], [<ore:slabWood>, <Forestry:thermionicTubes:1>, <ore:slabWood>]]);
recipes.addShaped(<Forestry:ffarm:4>.withTag({FarmBlock: 9}), [[null, <Forestry:ffarm:0>.withTag({FarmBlock: 9}), null], [plateBronze, <ore:gearTin>, plateBronze]]);
recipes.addShaped(<Forestry:ffarm:0>.withTag({FarmBlock: 10}), [[plateCopper, <minecraft:quartz_block:2>, plateCopper], [<ore:slabWood>, <Forestry:thermionicTubes:1>, <ore:slabWood>]]);
recipes.addShaped(<Forestry:ffarm:4>.withTag({FarmBlock: 10}), [[null, <Forestry:ffarm:0>.withTag({FarmBlock: 10}), null], [plateBronze, <ore:gearTin>, plateBronze]]);

// ====================================================================================
// 9. LAZERY BUILDCRAFT
// Aktivnyy element - izumrud (berill s khromom - real'naya lazernaya sreda, rodstvennik aleksandritovogo lazera)
// s serebryanymi zerkalami na tortsakh. BYLO: kvartsevyy blok.
recipes.addShaped(<zavod:laser_rod>, [[<ore:nuggetSilver>], [<minecraft:emerald>], [<ore:nuggetSilver>]]);
// ====================================================================================
// Lazer - 1960 god: bez chertezha net sborochnogo stola, a znachit almaznykh, kvartsevykh, izumrudnykh i prochikh chipsetov.
// Krasnyy i zolotoy chipsety mozhno sdelat' i bez lazera - fotolitografiey v plotnike (electronics.zs).
recipes.remove(<BuildCraft|Silicon:laserBlock>);
// Zavod 1.40: slozhnaya tekhnika - tol'ko v plotnike, chertyozh raskhoduetsya (kopiya - sin'ka, loot.zs)
mods.forestry.Carpenter.addRecipe(<BuildCraft|Silicon:laserBlock>, [[plateGold, <zavod:laser_rod>, plateGold], [copperCoil, reBattery, copperCoil], [denseCopper, ingotInvar, <zavod:blueprint_laser>]], 200);

// Sborochnyy stol (meta 0)
recipes.remove(<BuildCraft|Silicon:laserTableBlock>);
recipes.addShaped(<BuildCraft|Silicon:laserTableBlock>, [
    [ingotInvar, <minecraft:obsidian>,            ingotInvar],
    [circuitIC2, gearInvar,                       circuitIC2],
    [ingotInvar, <IC2:itemRecipePart:1>,           ingotInvar]   // B1: bylo Stirling BC (vyrezan) - elektromotor IC2
]);

// ====================================================================================
// 10. ENERGETIKA
// ====================================================================================
// DVS BuildCraft (stal'noy val vmesto nesuschestvuyuschego railbed.steel)
recipes.remove(<BuildCraft|Core:engineBlock:2>);
recipes.addShaped(<BuildCraft|Core:engineBlock:2>, [
    [<Railcraft:machine.beta:0>, blockInvar, <Railcraft:machine.beta:0>],
    [<ore:nuggetPlatinum>,       <IC2:itemTurningBlanks:271396>, <ore:nuggetPlatinum>],   // kolenval + platinovye svechi zazhiganiya
    [<IC2:itemRubber>,          circuitIC2, <IC2:itemRubber>]   // salniki i remen' GRM
]);

// Stirling BC
recipes.remove(<BuildCraft|Core:engineBlock:1>);


// Solnechnaya panel' IC2: kremnievye plastiny (tekhnicheskiy kremniy Zavod) pod armirovannym steklom
recipes.remove(<IC2:blockGenerator:3>);
// Zavod 1.40: slozhnaya tekhnika - tol'ko v plotnike, chertyozh raskhoduetsya (kopiya - sin'ka, loot.zs)
mods.forestry.Carpenter.addRecipe(<IC2:blockGenerator:3>, [[reinforcedGlass, reinforcedGlass, reinforcedGlass], [<zavod:silicon>, circuitIC2, <zavod:silicon>], [plateTin, <IC2:itemCable>, <zavod:blueprint_solar>]], 200);

// ====================================================================================
// 11. SELITRYaNITsA - proizvodstvo selitry iz organiki
// POChEMU: prirodnaya selitra - tol'ko v pustynyakh (Railcraft, u poverkhnosti peska). Istoricheski
// selitru "vyraschivali": kompost gnil, obrazuya nitraty, schyolok vyparivali s potashom (drevesnaya zola).
// TEPER': selitryanitsa Zavod (organika + zola + voda -> selitra za sutki). Put' cherez plavil'nyu TE snyat v B1 chat 3.
// ====================================================================================


