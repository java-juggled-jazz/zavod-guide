// ====================================================================================
//                 LUT SUNDUKOV: BEZ OBKhODA METALLURGII
// Sunduki dandzhey, shakht, piramid, kreposti, derevni i bonusnyy sunduk ne dayut
// promyshlennykh slitkov i rud (zhelezo, med', olovo, svinets, nikel', platina, stali, splavy) -
// eto tol'ko iz rudy cherez zavod. Sokrovischa ostayutsya: almazy, izumrudy, zoloto, serebro.
// Plyus nagrada za risk v teme sborki: patrony, porokh, kapsyuli, bint, detali stvolov.
// ====================================================================================

val chests = [
    "dungeonChest", "mineshaftCorridor", "pyramidDesertyChest", "pyramidJungleChest",
    "pyramidJungleDispenser", "strongholdCorridor", "strongholdLibrary", "strongholdCrossing",
    "villageBlacksmith", "bonusChest"
] as string[];

// --- 1. Vyrezano (vanil' i mody, kotorye dokladyvayut svoyo v eti sunduki) ---
// Bez import: kazhdyy predmet otdel'noy strokoy.
for chest in chests {
    vanilla.loot.removeChestLoot(chest, <ore:blockDiamond>);
    vanilla.loot.removeChestLoot(chest, <ore:blockEmerald>);
    vanilla.loot.removeChestLoot(chest, <ore:ingotIron>);
    vanilla.loot.removeChestLoot(chest, <ore:blockIron>);
    vanilla.loot.removeChestLoot(chest, <ore:blockGold>);
    vanilla.loot.removeChestLoot(chest, <ore:ingotCopper>);
    vanilla.loot.removeChestLoot(chest, <ore:ingotTin>);
    vanilla.loot.removeChestLoot(chest, <ore:ingotLead>);
    vanilla.loot.removeChestLoot(chest, <ore:ingotNickel>);
    vanilla.loot.removeChestLoot(chest, <ore:ingotPlatinum>);
    vanilla.loot.removeChestLoot(chest, <ore:ingotBronze>);
    vanilla.loot.removeChestLoot(chest, <ore:ingotSteel>);
    vanilla.loot.removeChestLoot(chest, <ore:ingotInvar>);
    vanilla.loot.removeChestLoot(chest, <ore:ingotUranium>);
    vanilla.loot.removeChestLoot(chest, <ore:ingotRefinedIron>);
    vanilla.loot.removeChestLoot(chest, <ore:oreIron>);
    vanilla.loot.removeChestLoot(chest, <ore:oreGold>);
    vanilla.loot.removeChestLoot(chest, <ore:oreCopper>);
    vanilla.loot.removeChestLoot(chest, <ore:oreTin>);
    vanilla.loot.removeChestLoot(chest, <ore:oreSilver>);
    vanilla.loot.removeChestLoot(chest, <ore:oreLead>);
    vanilla.loot.removeChestLoot(chest, <ore:oreNickel>);
    vanilla.loot.removeChestLoot(chest, <ore:oreDiamond>);
    vanilla.loot.removeChestLoot(chest, <ore:oreEmerald>);
    vanilla.loot.removeChestLoot(chest, <ore:oreUranium>);
    // Bloki promyshlennykh metallov (Railcraft kladyot stal'noy blok v shakhty i kuznitsu derevni).
    vanilla.loot.removeChestLoot(chest, <ore:blockSteel>);
    vanilla.loot.removeChestLoot(chest, <ore:blockCopper>);
    vanilla.loot.removeChestLoot(chest, <ore:blockTin>);
    vanilla.loot.removeChestLoot(chest, <ore:blockLead>);
    vanilla.loot.removeChestLoot(chest, <ore:blockBronze>);
    vanilla.loot.removeChestLoot(chest, <ore:blockNickel>);
    vanilla.loot.removeChestLoot(chest, <ore:blockInvar>);
    vanilla.loot.removeChestLoot(chest, <ore:blockPlatinum>);
    vanilla.loot.removeChestLoot(chest, <ore:nuggetSteel>);
    // Rodnoy iridiy IC2 (v dandzhe ves 100, po 6-14 oskolkov) - vmesto nego nash, redkiy (razdel 4).
    vanilla.loot.removeChestLoot(chest, <IC2:itemShardIridium>);
    vanilla.loot.removeChestLoot(chest, <IC2:itemOreIridium>);
}

// --- 2. Dobavleno: bivuak strelka ---
// Ves (.weight, NE %: "% N" v MT 1.7.10 = shans N/100, a sunduk beryot (int) -> 0, predmet ne vypadaet nikogda) - kak u vanil'nykh predmetov dandzheya (sedlo, khleb, porokh = 10).
val combat = ["dungeonChest", "mineshaftCorridor", "pyramidDesertyChest", "pyramidJungleChest",
              "strongholdCorridor", "strongholdCrossing"] as string[];

for chest in combat {
    vanilla.loot.addChestLoot(chest, <zavod:cartridge_pistol>.weight(10), 2, 8);
    vanilla.loot.addChestLoot(chest, <zavod:shell_shotgun>.weight(6), 2, 6);
    vanilla.loot.addChestLoot(chest, <zavod:cartridge_rifle>.weight(5), 2, 6);
    vanilla.loot.addChestLoot(chest, <zavod:cartridge_intermediate>.weight(4), 2, 6);
    vanilla.loot.addChestLoot(chest, <zavod:powder_smokeless>.weight(5), 1, 4);
    vanilla.loot.addChestLoot(chest, <zavod:primer>.weight(5), 2, 6);
    vanilla.loot.addChestLoot(chest, <zavod:bandage>.weight(8), 1, 3);
    vanilla.loot.addChestLoot(chest, <flansmod:ww2MedKit>.weight(1), 1, 1);
    vanilla.loot.addChestLoot(chest, <zavod:barrel_short>.weight(2), 1, 1);
    vanilla.loot.addChestLoot(chest, <zavod:receiver_stamped>.weight(1), 1, 1);
}

// Kuznitsa derevni: kuznets - ne oruzheynik, tol'ko rasprodazha melochi.
vanilla.loot.addChestLoot("villageBlacksmith", <zavod:bandage>.weight(6), 1, 3);
vanilla.loot.addChestLoot("villageBlacksmith", <zavod:cartridge_pistol>.weight(4), 1, 4);

// --- 3. TROFEI: tol'ko iz sundukov, kraft vyklyuchen ---
// Opticheskiy pritsel i BAR - trofey ILI kraft (Zavod 1.37-1.38, flans.zs); bronezhilet spetsnaza (flans.zs),
// zacharovannoe zolotoe yabloko (vanil'nyy retsept iz 8 zolotykh blokov ubran), pribor nochnogo videniya IC2.
recipes.remove(<minecraft:golden_apple:1>);
// Pribor nochnogo videniya IC2 - trofeynaya optika, kak i pritsel (on zhe nuzhen dlya kvantovogo shlema, ic2-armor.zs).
recipes.remove(<IC2:itemNightvisionGoggles:*>);

val trophy = ["dungeonChest", "mineshaftCorridor", "pyramidDesertyChest", "pyramidJungleChest",
              "strongholdCorridor", "strongholdCrossing"] as string[];

for chest in trophy {
    vanilla.loot.addChestLoot(chest, <zavod:scope_optic>.weight(2), 1, 1);
    vanilla.loot.addChestLoot(chest, <flansmod:BAR>.weight(1), 1, 1);
    vanilla.loot.addChestLoot(chest, <flansmod:spetsnazBody>.weight(1), 1, 1);
    vanilla.loot.addChestLoot(chest, <minecraft:golden_apple:1>.weight(1), 1, 1);
    vanilla.loot.addChestLoot(chest, <IC2:itemNightvisionGoggles>.weight(1), 1, 1);
}

// --- 4. Iridiy: tol'ko iz meteoritov - starye kratery v mire (zavod.Meteorites, 1.56.58; byla Luna GC).
// V sundukakh iridiya net (loot IC2 ubran vyshe), kamen' Kraya ego ne dayot.
// Krepost' - samoe opasnoe mesto: pritsel tam chasche.
vanilla.loot.addChestLoot("strongholdLibrary", <zavod:scope_optic>.weight(3), 1, 1);

// --- 5. ChERTEZhI: nakhodka ili konstruktorskoe byuro (Zavod 1.37, zavod-machines.zs).
// Zavod 1.40: vsya tekhnika po chertezhu sobiraetsya TOL'KO V PLOTNIKE Forestry, chertyozh raskhoduetsya - delay kopii (sin'ka nizhe).
// BAR (flans.zs), nano- i kvantovaya bronya (ic2-armor.zs, lategame.zs) - tozhe po chertezhu.
// Reaktor VD, kontaktnyy apparat (zavod-machines.zs), dizel' i gazovaya turbina (transmission.zs, 1.56.66), shina sputnika (satellites.zs, 1.56.77), yadernyy reaktor IC2, generator materii, replikator (ic2-machines.zs),
// avtomaty AK-47 i M16A4 (flans.zs), vse yakorya Railcraft - mirovoy, lichnyy, passivnyy (railcraft.zs, lategame.zs),
// lazer BuildCraft i solnechnaya panel' IC2 (global.zs). Lazer - vorota v elektroniku: v biblioteke chasche ostal'nykh.
// Kopiya - sin'ka: original (ostayotsya) + bumaga + zheleznaya pyl' (zhelezistaya svetochuvstvitel'naya bumaga).
recipes.addShapeless(<zavod:blueprint_hp_reactor>, [<zavod:blueprint_hp_reactor>.reuse(), <minecraft:paper>, <ore:dustIron>]);
recipes.addShapeless(<zavod:blueprint_contact>, [<zavod:blueprint_contact>.reuse(), <minecraft:paper>, <ore:dustIron>]);
recipes.addShapeless(<zavod:blueprint_reactor>, [<zavod:blueprint_reactor>.reuse(), <minecraft:paper>, <ore:dustIron>]);
recipes.addShapeless(<zavod:blueprint_rifle>, [<zavod:blueprint_rifle>.reuse(), <minecraft:paper>, <ore:dustIron>]);
recipes.addShapeless(<zavod:blueprint_replicator>, [<zavod:blueprint_replicator>.reuse(), <minecraft:paper>, <ore:dustIron>]);
recipes.addShapeless(<zavod:blueprint_anchor>, [<zavod:blueprint_anchor>.reuse(), <minecraft:paper>, <ore:dustIron>]);
recipes.addShapeless(<zavod:blueprint_mass_fab>, [<zavod:blueprint_mass_fab>.reuse(), <minecraft:paper>, <ore:dustIron>]);
recipes.addShapeless(<zavod:blueprint_laser>, [<zavod:blueprint_laser>.reuse(), <minecraft:paper>, <ore:dustIron>]);
recipes.addShapeless(<zavod:blueprint_solar>, [<zavod:blueprint_solar>.reuse(), <minecraft:paper>, <ore:dustIron>]);
recipes.addShapeless(<zavod:blueprint_diesel>, [<zavod:blueprint_diesel>.reuse(), <minecraft:paper>, <ore:dustIron>]);
recipes.addShapeless(<zavod:blueprint_gas_turbine>, [<zavod:blueprint_gas_turbine>.reuse(), <minecraft:paper>, <ore:dustIron>]);
recipes.addShapeless(<zavod:blueprint_satellite>, [<zavod:blueprint_satellite>.reuse(), <minecraft:paper>, <ore:dustIron>]);
recipes.addShapeless(<zavod:blueprint_bar>, [<zavod:blueprint_bar>.reuse(), <minecraft:paper>, <ore:dustIron>]);
recipes.addShapeless(<zavod:blueprint_nano>, [<zavod:blueprint_nano>.reuse(), <minecraft:paper>, <ore:dustIron>]);
recipes.addShapeless(<zavod:blueprint_quantum>, [<zavod:blueprint_quantum>.reuse(), <minecraft:paper>, <ore:dustIron>]);

// Biblioteka kreposti - glavnoe mesto chertezhey.
vanilla.loot.addChestLoot("strongholdLibrary", <zavod:blueprint_hp_reactor>.weight(4), 1, 1);
vanilla.loot.addChestLoot("strongholdLibrary", <zavod:blueprint_contact>.weight(4), 1, 1);
vanilla.loot.addChestLoot("strongholdLibrary", <zavod:blueprint_reactor>.weight(4), 1, 1);
vanilla.loot.addChestLoot("strongholdLibrary", <zavod:blueprint_rifle>.weight(4), 1, 1);
vanilla.loot.addChestLoot("strongholdLibrary", <zavod:blueprint_replicator>.weight(4), 1, 1);
vanilla.loot.addChestLoot("strongholdLibrary", <zavod:blueprint_anchor>.weight(4), 1, 1);
vanilla.loot.addChestLoot("strongholdLibrary", <zavod:blueprint_mass_fab>.weight(4), 1, 1);
vanilla.loot.addChestLoot("strongholdLibrary", <zavod:blueprint_laser>.weight(8), 1, 1);
vanilla.loot.addChestLoot("strongholdLibrary", <zavod:blueprint_solar>.weight(4), 1, 1);
vanilla.loot.addChestLoot("strongholdLibrary", <zavod:blueprint_diesel>.weight(4), 1, 1);
vanilla.loot.addChestLoot("strongholdLibrary", <zavod:blueprint_gas_turbine>.weight(4), 1, 1);
vanilla.loot.addChestLoot("strongholdLibrary", <zavod:blueprint_satellite>.weight(4), 1, 1);
vanilla.loot.addChestLoot("strongholdLibrary", <zavod:blueprint_bar>.weight(4), 1, 1);
vanilla.loot.addChestLoot("strongholdLibrary", <zavod:blueprint_nano>.weight(4), 1, 1);
vanilla.loot.addChestLoot("strongholdLibrary", <zavod:blueprint_quantum>.weight(4), 1, 1);
// Tol'ko krepost': koridory i perekryostki - redko. Dandzhi, shakhty, piramidy - bez chertezhey (tam ne arkhiv).
// Eshchyo - voennye forty Recurrent Complex (structures/active/ZavodFortChest.rcig).
val archive = ["strongholdCorridor", "strongholdCrossing"] as string[];
for chest in archive {
    vanilla.loot.addChestLoot(chest, <zavod:blueprint_hp_reactor>.weight(1), 1, 1);
    vanilla.loot.addChestLoot(chest, <zavod:blueprint_contact>.weight(1), 1, 1);
    vanilla.loot.addChestLoot(chest, <zavod:blueprint_reactor>.weight(1), 1, 1);
    vanilla.loot.addChestLoot(chest, <zavod:blueprint_rifle>.weight(1), 1, 1);
    vanilla.loot.addChestLoot(chest, <zavod:blueprint_replicator>.weight(1), 1, 1);
    vanilla.loot.addChestLoot(chest, <zavod:blueprint_anchor>.weight(1), 1, 1);
    vanilla.loot.addChestLoot(chest, <zavod:blueprint_mass_fab>.weight(1), 1, 1);
    vanilla.loot.addChestLoot(chest, <zavod:blueprint_laser>.weight(2), 1, 1);
    vanilla.loot.addChestLoot(chest, <zavod:blueprint_solar>.weight(1), 1, 1);
    vanilla.loot.addChestLoot(chest, <zavod:blueprint_diesel>.weight(1), 1, 1);
    vanilla.loot.addChestLoot(chest, <zavod:blueprint_gas_turbine>.weight(1), 1, 1);
    vanilla.loot.addChestLoot(chest, <zavod:blueprint_satellite>.weight(1), 1, 1);
    vanilla.loot.addChestLoot(chest, <zavod:blueprint_bar>.weight(1), 1, 1);
    vanilla.loot.addChestLoot(chest, <zavod:blueprint_nano>.weight(1), 1, 1);
    vanilla.loot.addChestLoot(chest, <zavod:blueprint_quantum>.weight(1), 1, 1);
}

// --- 6. NAKhODKI BEZ ZAPRETOV: kraft ostayotsya, v sundukakh - redkiy bonus ---
// Ochki dlya chteniya, tonirovannye ochki, monokl' (BiblioCraft), lupa i ochki puteytsa (Railcraft), ochki naturalista (Forestry).
// (V KONTsE FAYLA: esli ID chuzhikh modov ne sovpadut, upadyot tol'ko etot blok.)
for chest in trophy {
    vanilla.loot.addChestLoot(chest, <BiblioCraft:item.BiblioGlasses:0>.weight(2), 1, 1);
    vanilla.loot.addChestLoot(chest, <BiblioCraft:item.BiblioGlasses:1>.weight(2), 1, 1);
    vanilla.loot.addChestLoot(chest, <BiblioCraft:item.BiblioGlasses:2>.weight(1), 1, 1);
    vanilla.loot.addChestLoot(chest, <Railcraft:tool.magnifying.glass>.weight(2), 1, 1);
    vanilla.loot.addChestLoot(chest, <Railcraft:armor.goggles>.weight(1), 1, 1);
    vanilla.loot.addChestLoot(chest, <Forestry:naturalistHelmet>.weight(1), 1, 1);
}
vanilla.loot.addChestLoot("strongholdLibrary", <BiblioCraft:item.BiblioGlasses:0>.weight(4), 1, 1);
vanilla.loot.addChestLoot("strongholdLibrary", <BiblioCraft:item.BiblioGlasses:2>.weight(2), 1, 1);
vanilla.loot.addChestLoot("strongholdLibrary", <Railcraft:tool.magnifying.glass>.weight(3), 1, 1);
vanilla.loot.addChestLoot("villageBlacksmith", <Railcraft:armor.goggles>.weight(2), 1, 1);
