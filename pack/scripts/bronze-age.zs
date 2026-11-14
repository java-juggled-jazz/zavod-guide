// ====================================================================================
// BRONZOVYY VEK: DO PERVOGO ELEKTRIChESTVA
// POChEMU: bronza kraftilas' iz slitkov rukami (Forestry: 3 medi + olovo = 4 bronzy) - splav bez ognya.
//   A do pervykh mashin IC2 rudu nel'zya bylo dazhe razdrobit'.
// TEPER' stupeni:
//   1. Kuznechnyy molot: ruda -> droblyonaya ruda (1 sht., mashina dast 2), slitki -> kovanyy val.
//   2. Bronza tol'ko cherez ogon': 3 droblyonoy medi + 1 droblyonogo olova -> 4 bronzovoy pyli (retsept IC2)
//      -> pech' -> bronza. Ruchnoy splav iz slitkov Forestry udalyon.
//   3. Ruchnoy kineticheskiy generator IC2 (korpus + rychag) krutit tokarnyy stanok: kolenvaly, opravki,
//      valy - bez elektrichestva. Kovanye valy i shesterni (1.56.60) nuzhny, chtoby sobrat' sam stanok.
//   4. Par i val: kotyol Railcraft -> parovaya mashina Zavod -> stanki na valu (tolcheya, pilorama, prokatnyy stan,
//      volochil'nyy stan); RF - mufta. Generatory IC2 na toplive, Stirlingi, dvigateli RC, TE - vyrezany (B1).
//      Izolyatsiya kabeley - vosk i bumaga. Otsyuda lampovye skhemy -> pervye mashiny IC2.
// ====================================================================================

val hammer = <IC2:itemToolForgeHammer>.anyDamage();

// --- 1. Ruchnoe droblenie rudy molotom ---
recipes.addShapeless(<IC2:itemCrushedOre:0>, [<ore:oreIron>,   hammer]);
recipes.addShapeless(<IC2:itemCrushedOre:1>, [<ore:oreCopper>, hammer]);
recipes.addShapeless(<IC2:itemCrushedOre:2>, [<ore:oreGold>,   hammer]);
recipes.addShapeless(<IC2:itemCrushedOre:3>, [<ore:oreTin>,    hammer]);
recipes.addShapeless(<IC2:itemCrushedOre:5>, [<ore:oreSilver>, hammer]);
recipes.addShapeless(<IC2:itemCrushedOre:6>, [<ore:oreLead>,   hammer]);
// Nikel': u IC2 net droblyonogo nikelya, molot dayot srazu nikelevuyu pyl' (nasha, B1)
recipes.addShapeless(<zavod:dust_nickel>, [<ore:oreNickel>, hammer]);

// Droblyonaya ruda -> pyl' (vtoroy udar molotom): dlya ruchnogo smeshivaniya splavov (invar: 2 zheleznoy + 1 nikelevaya pyl')
recipes.addShapeless(<IC2:itemDust:5>, [<IC2:itemCrushedOre:0>, hammer]);
recipes.addShapeless(<IC2:itemDust:3>, [<IC2:itemCrushedOre:1>, hammer]);
recipes.addShapeless(<IC2:itemDust:4>, [<IC2:itemCrushedOre:2>, hammer]);
recipes.addShapeless(<IC2:itemDust:7>, [<IC2:itemCrushedOre:3>, hammer]);
recipes.addShapeless(<IC2:itemDust:10>, [<IC2:itemCrushedOre:6>, hammer]);

// --- Kovanyy val: 3 slitka pod molotom -> 1 val (tokarka - iz 2 slitkov + obolochka; metalloformovschik: blok -> 3 vala,
//     config/ic2/metal_former_extruding.ini). Stal' - ne supermaterial, kuyotsya tak zhe. Vtoroy put' k stal'nomu valu -
//     tsementatsiya zheleznogo v domne IC2. ---
recipes.addShaped(<IC2:itemRecipePart:11>, [
    [null,   <ore:ingotIron>, null],
    [hammer, <ore:ingotIron>, null],
    [null,   <ore:ingotIron>, null]
]);
recipes.addShaped(<IC2:itemRecipePart:12>, [
    [null,   <ore:ingotSteel>, null],
    [hammer, <ore:ingotSteel>, null],
    [null,   <ore:ingotSteel>, null]
]);

// --- Tokarnyy stanok IC2 (Turning Table): + zheleznaya i bronzovaya shesterni (1.56.60; bylo: 3 plastiny bez shesterney) ---
recipes.remove(<IC2:blockMachine3:8>);
recipes.addShaped(<IC2:blockMachine3:8>, [
    [<ore:plateIron>,      <ore:gearIron>,         <ore:plateIron>],
    [<IC2:itemRecipePart:11>, <IC2:blockMachine:0>, <IC2:itemRecipePart:11>],
    [<IC2:itemCasing:4>,   <ore:gearBronze>,       <IC2:itemCasing:4>]
]);

// --- Pyl' drevesnogo uglya molotom (B1 chat 4): chyornyy porokh epokhi 1 bez mashin; mashina (tolcheya, matserator) - bystree ---
recipes.addShapeless(<Railcraft:dust:3>, [<minecraft:coal:1>, hammer]);

// --- 2. Ruchnoy splav bronzy iz slitkov (Forestry) - udalyon. V KONTsE FAYLA: pri nevernom ID upadyot tol'ko on. ---
recipes.remove(<Forestry:ingotBronze>);
