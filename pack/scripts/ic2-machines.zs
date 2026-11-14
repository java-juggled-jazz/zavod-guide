// ====================================================================================
//          TYaZhYoLAYa REFORMA MAShIN IC2: ELEKTRONIKA, AES, UU-MATERIYa, AGROTEKh
// Logika stupeney:
//   bazovyy korpus IC2 + skhema          -> sredniy uroven' (pompa, elektrolizyor, rudomoyka)
//   prodvinutaya skhema (lazery BC)       -> avtomatizatsiya (pererabotchik, fermy)
//   prodvinutyy korpus (ugleplastik)    -> tyazhyolye mashiny (AES, UU, terraformer)
// Proverka: v minetweaker.log posle kazhdogo "Removing N recipes" idyot
// "Adding recipe for <IMYa>" - imya dolzhno sovpast' s mashinoy iz kommentariya.
// ====================================================================================

// --- peremennye ---
val machineFrameIC2 = <IC2:blockMachine>;          // Bazovyy korpus
val advCasing       = <IC2:blockMachine:12>;       // Prodvinutyy korpus
val circuitIC2      = <IC2:itemPartCircuit>;
val advCircuit      = <IC2:itemPartCircuitAdv>;
val copperCoil      = <IC2:itemRecipePart>;        // Katushka
val motorIC2        = <IC2:itemRecipePart:1>;      // Elektromotor
val heatConductor   = <IC2:itemRecipePart:5>;      // Teploprovodnik
val advAlloy        = <IC2:itemPartAlloy>;         // Kompozit
val carbonPlate     = <IC2:itemPartCarbonPlate>;   // Ugleplastik
val iridiumPlate    = <IC2:itemPartIridium>;
val crystalMemory   = <IC2:itemcrystalmemory>;
val miningPipe      = <IC2:blockMiningPipe>;
val energyCrystal   = <IC2:itemBatCrystal:*>;      // lyuboy zaryad
val lapotron        = <IC2:itemBatLamaCrystal:*>;  // lyuboy zaryad

val denseSteel  = <IC2:itemDensePlates:5>;
val denseBronze = <IC2:itemDensePlates:2>;
val denseLead   = <IC2:itemDensePlates:6>;
val plateSteel  = <ore:plateSteel>;
val plateBronze = <ore:plateBronze>;
val plateLead   = <ore:plateLead>;
val plateIron   = <ore:plateIron>;
val plateGold   = <ore:plateGold>;
val plateTin    = <ore:plateTin>;
val ingotInvar  = <ore:ingotInvar>;
val gearSteel   = <ore:gearSteel>;
val gearBronze  = <ore:gearBronze>;

val chipGold    = <BuildCraft|Silicon:redstoneChipset:2>;
val chipDiamond = <BuildCraft|Silicon:redstoneChipset:3>;
val chipQuartz  = <BuildCraft|Silicon:redstoneChipset:5>;
val chipEmerald = <BuildCraft|Silicon:redstoneChipset:7>;
val laserBC     = <BuildCraft|Silicon:laserBlock>;

val tankBC          = <BuildCraft|Factory:tankBlock>;
val fusedQuartz     = <IC2:blockAlloyGlass>;        // armirovannoe steklo IC2 (BYLO: kvartsevoe EnderIO)
val doubleCapacitor = <IC2:itemBatREDischarged>;    // RE-batareya (BYLO: dvoynoy kondensator EnderIO)
val octadicCap      = <IC2:itemBatLamaCrystal:*>;   // lapotronnyy kristall (BYLO: oktadnyy kondensator EnderIO)

// ====================================================================================
// 1. PRODVINUTAYa SKhEMA - mnogosloynaya plata. Travitsya tol'ko lazerami BC:
// zolotoy i kvartsevye chipsety delaet Sborochnyy stol. Eto i est' "zamena AE2".
// ====================================================================================
// Prodvinutaya skhema perenesena v electronics.zs (tol'ko plotnik).

// ====================================================================================
// 2. PRODVINUTYY KORPUS - ugleplastikovaya obshivka (koks -> volokno -> setka -> plastina)
// + kompozit + plotnaya stal'.
// ====================================================================================
recipes.remove(advCasing);
recipes.addShaped(advCasing, [
    [carbonPlate, denseSteel,      carbonPlate],
    [advAlloy,    machineFrameIC2, advAlloy],
    [carbonPlate, denseSteel,      carbonPlate]
]);

// ====================================================================================
// 3. DOBYChA
// ====================================================================================
// Obychnyy Miner - VYREZAN. Tol'ko Advanced Miner (retsept v lategame.zs).
recipes.remove(<IC2:blockMachine:7>);

// Pompa: bronzovaya gidravlika, dva motora, zabornaya truba
recipes.remove(<IC2:blockMachine:8>);
recipes.addShaped(<IC2:blockMachine:8>, [
    [gearBronze, circuitIC2,      gearBronze],
    [tankBC,     machineFrameIC2, tankBC],
    [motorIC2,   miningPipe,      motorIC2]
]);

// ====================================================================================
// 4. ELEKTROTEKhNIKA
// ====================================================================================
// Namagnichivatel': shest' katushek na zheleznom serdechnike + dvoynoy kondensator
recipes.remove(<IC2:blockMachine:9>);
recipes.addShaped(<IC2:blockMachine:9>, [
    [copperCoil, copperCoil,      copperCoil],
    [plateIron,  machineFrameIC2, plateIron],
    [copperCoil, doubleCapacitor, copperCoil]
]);

// Elektrolizyor: svintsovye elektrody, vanna iz bakov, kvartsevoe smotrovoe okno
recipes.remove(<IC2:blockMachine:10>);
// Nikelevye elektrody: promyshlennyy schelochnoy elektroliz vody idyot na nikele (platina - tol'ko v membrannykh, PEM)
recipes.addShaped(<IC2:blockMachine:10>, [
    [plateLead,  <ore:ingotNickel>, plateLead],
    [tankBC,     machineFrameIC2, tankBC],
    [copperCoil, circuitIC2,      copperCoil]
]);

// ====================================================================================
// 5. PERERABOTKA
// ====================================================================================
// Rudopromyvochnaya mashina: tyazhyolaya bronzovaya gidravlika
// Serdtse - namagnichivatel': magnitnaya separatsiya otdelyaet rudnye zyorna ot pustoy porody
recipes.remove(<IC2:blockMachine2:5>);
recipes.addShaped(<IC2:blockMachine2:5>, [
    [denseBronze, <minecraft:cauldron>, denseBronze],
    [tankBC,      <IC2:blockMachine:9>, tankBC],
    [gearBronze,  motorIC2,             gearBronze]
]);

// Utilizator (istochnik util'syr'ya dlya UU): drobilka + kompressor na stal'nom privode
recipes.remove(<IC2:blockMachine:11>);
recipes.addShaped(<IC2:blockMachine:11>, [
    [gearSteel,  <IC2:blockMachine:3>, gearSteel],
    [denseSteel, <IC2:blockMachine:5>, denseSteel],
    [gearSteel,  advCircuit,           gearSteel]
]);

// ====================================================================================
// 6. AGROTEKh (avtosbor dolzhen stoit' deneg)
// ====================================================================================
// Avtosadovnik (Crop-Matron)
recipes.remove(<IC2:blockMachine2:2>);
recipes.addShaped(<IC2:blockMachine2:2>, [
    [denseBronze, advCircuit,      denseBronze],
    [tankBC,      machineFrameIC2, tankBC],
    [gearBronze,  <minecraft:chest>, gearBronze]
]);

// Sborschik urozhaya (Crop Harvester): stal'nye nozhnitsy Railcraft kak rezhuschiy uzel
recipes.remove(<IC2:blockMachine3:7>);
recipes.addShaped(<IC2:blockMachine3:7>, [
    [<Railcraft:tool.steel.shears>, advCircuit,      <Railcraft:tool.steel.shears>],
    [gearSteel,                     machineFrameIC2, gearSteel],
    [motorIC2,                      <minecraft:chest>, motorIC2]
]);

// Terraformer
recipes.remove(<IC2:blockMachine:15>);
recipes.addShaped(<IC2:blockMachine:15>, [
    [denseSteel,           chipDiamond, denseSteel],
    [<IC2:blockMachine:8>, advCasing,   <IC2:blockMachine:9>],
    [advCircuit,           energyCrystal, advCircuit]
]);

// ====================================================================================
// 7. ATOMNAYa ENERGETIKA
// ====================================================================================
// Reaktornaya kamera: 4 plotnykh svintsa biozaschity + teploprovodniki + grafitovaya kladka-zamedlitel'
// (B6: Chicago Pile-1 / Hanford - grafit iz elektroliznoy vanny, Acheson; BYLO: invarovyy karkas)
val reactorChamber = <IC2:blockReactorChamber>;
recipes.remove(reactorChamber);
recipes.addShaped(reactorChamber, [
    [denseLead,  heatConductor,   denseLead],
    [<zavod:graphite>, machineFrameIC2, <zavod:graphite>],
    [denseLead,  heatConductor,   denseLead]
]);

// Yadernyy reaktor - istochnik tepla, a ne generator: vnizu teploobmennik (otdacha tepla teplonositelyu).
// Pryamoy EU s reaktora vyklyuchen (config/IC2.ini, nuclear = 0): rabotaet tol'ko zhidkostnyy rezhim v korpuse.
// BYLO: parovaya turbina Railcraft v retsepte.
recipes.remove(<IC2:blockGenerator:5>);
// Zavod 1.40: slozhnaya tekhnika - tol'ko v plotnike, chertyozh raskhoduetsya (kopiya - sin'ka, loot.zs)
mods.forestry.Carpenter.addRecipe(<IC2:blockGenerator:5>, [[denseLead, advCircuit, denseLead], [reactorChamber, advCasing, reactorChamber], [denseLead, <IC2:reactorHeatSwitch:1>, <zavod:blueprint_reactor>]], 200);

// ------------------------------------------------------------------------------------
// 7b. KhLADAGENT I KAPSULY OKhLAZhDENIYa
// Khladagent IC2 (zhidkost'): antifriz - 1000 distillyata + 250 bioetanola v khimreaktore Zavod (1.30).
// 1.35: put' "distillyat + redstoun" v konserviruyushchey mashine ubran - redstounu v khladagente ne mesto.
// VNIMANIE: rodnoy retsept IC2 "voda + lazuritovaya pyl'" MineTweaker udalit' ne mozhet - on ostanetsya.
// ------------------------------------------------------------------------------------

// Kapsula 10k: olovyannaya germetichnaya obolochka vokrug universal'noy kapsuly s khladagentom
val coolantFluidCell = <IC2:itemFluidCell>.onlyWithTag({Fluid: {FluidName: "ic2coolant", Amount: 1000}});
recipes.remove(<IC2:reactorCoolantSimple:*>);
recipes.addShaped(<IC2:reactorCoolantSimple:1>, [
    [null,      plateTin,         null],
    [plateTin,  coolantFluidCell, plateTin],
    [null,      plateTin,         null]
]);

// ------------------------------------------------------------------------------------
// 7c. KORPUS ZhIDKOSTNOGO REAKTORA: ukreplyonnyy kamen' + svintsovaya biozaschita
// ------------------------------------------------------------------------------------
val vessel = <IC2:blockreactorvessel>;
recipes.remove(vessel);
// Obsidianovaya futerovka (plastiny tol'ko iz blokorezki, almaznyy disk)
recipes.addShaped(vessel * 2, [[plateLead, <IC2:blockAlloy>, plateLead], [null, <IC2:itemPlates:7>, null]]);

// Lyuk dostupa: stal'naya rama, motor privoda, lyuk
recipes.remove(<IC2:blockReactorAccessHatch>);
// Rezinovyy uplotnitel' lyuka
recipes.addShaped(<IC2:blockReactorAccessHatch>, [
    [plateSteel, motorIC2,              plateSteel],
    [<IC2:itemRubber>, vessel, <IC2:itemRubber>],
    [plateSteel, <minecraft:trapdoor>,  plateSteel]
]);

// Zhidkostnyy port: pompa IC2 + zhidkostnye truby
recipes.remove(<IC2:blockReactorFluidPort>);
// Rezinovye uplotneniya porta (khladagent pod davleniem)
recipes.addShaped(<IC2:blockReactorFluidPort>, [
    [<IC2:itemRubber>,                                         <IC2:blockMachine:8>, <IC2:itemRubber>],
    [<BuildCraft|Transport:item.buildcraftPipe.pipefluidsiron>, vessel,              <BuildCraft|Transport:item.buildcraftPipe.pipefluidsiron>]
]);

// Redstoun-port: skhema upravleniya
recipes.remove(<IC2:blockReactorRedstonePort>);
recipes.addShaped(<IC2:blockReactorRedstonePort>, [
    [null,                 circuitIC2, null],
    [<minecraft:redstone>, vessel,     <minecraft:redstone>]
]);

// ------------------------------------------------------------------------------------
// 7d. REAKTORNYE KOMPONENTY
// Ventilyatory - eto real'nye ventilyatory: reshyotki + elektromotor IC2.
// Teploobmenniki - teploprovodniki + med'. Obshivka - kompozit + svinets.
// ------------------------------------------------------------------------------------
val denseCopper  = <IC2:itemDensePlates:0>;
val plating      = <IC2:reactorPlating>;
val ironBars     = <minecraft:iron_bars>;

// Reaktornaya obshivka
recipes.remove(plating);
recipes.addShaped(plating, [[advAlloy, denseLead, advAlloy]]);
// Teployomkaya obshivka
recipes.remove(<IC2:reactorPlatingHeat>);
recipes.addShaped(<IC2:reactorPlatingHeat>, [[denseCopper, plating, denseCopper]]);
// Zaschitnaya (sderzhivayuschaya) obshivka
recipes.remove(<IC2:reactorPlatingExplosive>);
recipes.addShaped(<IC2:reactorPlatingExplosive>, [[denseSteel, plating, denseSteel]]);

// Teplootvod
val vent = <IC2:reactorVent:*>;
recipes.remove(vent);
recipes.addShaped(<IC2:reactorVent:1>, [
    [plateSteel, ironBars, plateSteel],
    [ironBars,   motorIC2, ironBars],
    [plateSteel, ironBars, plateSteel]
]);
// Reaktornyy teplootvod
recipes.remove(<IC2:reactorVentCore:*>);
recipes.addShaped(<IC2:reactorVentCore:1>, [
    [heatConductor, vent,    heatConductor],
    [null,          plating, null]
]);
// Razognannyy teplootvod
recipes.remove(<IC2:reactorVentGold:*>);
recipes.addShaped(<IC2:reactorVentGold:1>, [
    [plateGold, <IC2:reactorVentCore:*>, plateGold],
    [null,      motorIC2,                null]
]);
// Prodvinutyy teplootvod
recipes.remove(<IC2:reactorVentDiamond:*>);
recipes.addShaped(<IC2:reactorVentDiamond:1>, [
    [<minecraft:diamond>, vent,     <minecraft:diamond>],
    [ironBars,            motorIC2, ironBars]
]);
// Komponentnyy teplootvod
recipes.remove(<IC2:reactorVentSpread:*>);
recipes.addShaped(<IC2:reactorVentSpread:1>, [
    [ironBars,    plateBronze, ironBars],
    [plateBronze, vent,        plateBronze],
    [ironBars,    plateBronze, ironBars]
]);

// Teploobmennik
val heatSwitch = <IC2:reactorHeatSwitch:*>;
recipes.remove(heatSwitch);
recipes.addShaped(<IC2:reactorHeatSwitch:1>, [
    [heatConductor, circuitIC2,       heatConductor],
    [denseCopper,   <ore:ingotInvar>, denseCopper]
]);
// Reaktornyy teploobmennik
recipes.remove(<IC2:reactorHeatSwitchCore:*>);
recipes.addShaped(<IC2:reactorHeatSwitchCore:1>, [[denseCopper, heatSwitch, denseCopper]]);
// Komponentnyy teploobmennik
recipes.remove(<IC2:reactorHeatSwitchSpread:*>);
recipes.addShaped(<IC2:reactorHeatSwitchSpread:1>, [[plateGold, heatSwitch, plateGold]]);
// Prodvinutyy teploobmennik
recipes.remove(<IC2:reactorHeatSwitchDiamond:*>);
recipes.addShaped(<IC2:reactorHeatSwitchDiamond:1>, [
    [heatSwitch,  advCircuit,          heatSwitch],
    [denseCopper, <minecraft:diamond>, denseCopper]
]);

// ====================================================================================
// 8. UU-MATERIYa - VENETs TEKhNOLOGIY, TOL'KO POSLE AES
// ====================================================================================
// Generator materii (Mass Fabricator): iridievaya obshivka + bufer na akkumulyatorakh (CESU) + HV-vvod + svintsovaya zaschita.
// Lapotronov zdes' NET: lapotrony i energokristally rastyat na UU-materii (cutter.zs, electronics.zs) - inache zamknutyy krug.
// Chertyozh - nakhodka ili konstruktorskoe byuro.
recipes.remove(<IC2:blockMachine:14>);
// Zavod 1.40: slozhnaya tekhnika - tol'ko v plotnike, chertyozh raskhoduetsya (kopiya - sin'ka, loot.zs)
mods.forestry.Carpenter.addRecipe(<IC2:blockMachine:14>, [[iridiumPlate, chipEmerald, iridiumPlate], [<IC2:blockElectric:7>, advCasing, <IC2:blockElectric:7>], [denseLead, <IC2:blockElectric:5>, <zavod:blueprint_mass_fab>]], 200);

// Khranilische shablonov
recipes.remove(<IC2:blockMachine2:6>);
recipes.addShaped(<IC2:blockMachine2:6>, [
    [crystalMemory, chipDiamond, crystalMemory],
    [advCircuit,    advCasing,   advCircuit],
    [denseSteel,    octadicCap,  denseSteel]
]);

// Skaner: skaniruet lazerom BC cherez kvartsevye okna
recipes.remove(<IC2:blockMachine2:7>);
recipes.addShaped(<IC2:blockMachine2:7>, [
    [fusedQuartz, laserBC,    fusedQuartz],
    [chipDiamond, advCasing,  chipDiamond],
    [denseLead,   advCircuit, denseLead]
]);

// Replikator: lazernyy "sborschik materii" (BYLO: teleporter IC2 - vyrezan)
recipes.remove(<IC2:blockMachine2:8>);
// Zavod 1.40: slozhnaya tekhnika - tol'ko v plotnike, chertyozh raskhoduetsya (kopiya - sin'ka, loot.zs)
mods.forestry.Carpenter.addRecipe(<IC2:blockMachine2:8>, [[iridiumPlate, laserBC, iridiumPlate], [chipEmerald, advCasing, chipEmerald], [denseLead, lapotron, <zavod:blueprint_replicator>]], 200);

// Usilitel' materii: util'syr'yo v 10 raz slabee (eto i byl "scrapFactor = 0.1").
// Po umolchaniyu: util' 5000, korobka utilya 45000. Perezapisyvaet znachenie IC2.
mods.ic2.MatterAmplifier.setAmplifier(<IC2:itemScrap>, 500);
mods.ic2.MatterAmplifier.setAmplifier(<IC2:itemScrapbox>, 4500);

// ====================================================================================
// 9. PROMYShLENNYY DINAMIT = AMMIAChNAYa SELITRA + DIZTOPLIVO (ANFO)
// POChEMU: ITNT sokhranyaet 100% blokov, a nashi zhily ogromnye - deshyovyy ITNT prevraschal dobychu
// v "vzorval zhilu - sobral vsyo" v obkhod Advanced Miner.
// TEPER': selitra Railcraft + dinamit + 500 mB topliva BC v Plotnike Forestry -> 2 ITNT.
// Toplivo - eto neftepererabotka, t.e. seredina igry.
// Moschnost' vzryva ITNT v IC2 konfigom ne menyaetsya.
// ====================================================================================
val saltpeter = <Railcraft:dust:2>;
recipes.remove(<IC2:blockITNT>);
// TEPER' nastoyaschiy ANFO: ammiachnaya selitra (reaktor Zavod: ammiak + azotnaya) + toplivo, TNT - promezhutochnyy detonator.
mods.forestry.Carpenter.addRecipe(<IC2:blockITNT> * 4, [
    [<zavod:ammonium_nitrate>, <zavod:ammonium_nitrate>, <zavod:ammonium_nitrate>],
    [<zavod:ammonium_nitrate>, <minecraft:tnt>,          <zavod:ammonium_nitrate>],
    [<zavod:ammonium_nitrate>, <zavod:ammonium_nitrate>, <zavod:ammonium_nitrate>]
], <liquid:fuel> * 500, 20);

// ====================================================================================
// 10. POLUZhIDKOSTNYY GENERATOR - VYREZAN
// Eto obychnyy dizel'-generator: zhzhyot neft'/toplivo/biomassu/etanol/biogaz pryamo v EU.
// Zhidkoe toplivo dolzhno idti v turbiny (gazovaya Zavod, dizel') i kotly, a ne v "korobku".
// ====================================================================================
recipes.remove(<IC2:blockGenerator:7>);

// ====================================================================================
// 11. PAROVAYa TURBINA IC2 - ChISTAYa MEKhANIKA
// Parovoy kineticheskiy generator (par -> kinetika): tolstyy stal'noy korpus, stal'noy val,
// stal'nye reduktory, parovpusk i vykhlop - zheleznye zhidkostnye truby BC.
// Kineticheskiy generator (kinetika -> EU): val vraschaet elektromashinu (motor IC2 v rezhime generatora)
// s obmotkami-katushkami, cherez stal'noy reduktor.
// Moschnost' turbiny udvoena v IC2.ini (steam = 2.0), generator Stirlinga - rannyaya stupen' (Stirling = 2.0).
// ====================================================================================
val steelShaft  = <IC2:itemRecipePart:12>;
val fluidPipeFe = <BuildCraft|Transport:item.buildcraftPipe.pipefluidsiron>;

recipes.remove(<IC2:blockKineticGenerator:1>);
recipes.addShaped(<IC2:blockKineticGenerator:1>, [
    [denseSteel,  gearSteel,  denseSteel],
    [fluidPipeFe, steelShaft, fluidPipeFe],
    [denseSteel,  gearSteel,  denseSteel]
]);

recipes.remove(<IC2:blockGenerator:9>);
recipes.addShaped(<IC2:blockGenerator:9>, [
    [plateSteel, copperCoil, plateSteel],
    [steelShaft, motorIC2,   gearSteel],
    [plateSteel, copperCoil, plateSteel]
]);

// ====================================================================================
// 12. GENERATOR IC2 (tvyordoe toplivo -> EU) - VYREZAN
// Zheleznaya pechka, kotoraya zhzhyot ugol' pryamo v elektrichestvo, bez kotla, para i mashiny. Tak ne byvaet.
// Ugol' -> EU teper' tol'ko po-chestnomu: topka (tverdotoplivnyy teplogenerator) -> Stirling -> dinamo,
// ili kotyol -> par -> turbina. V retseptakh drugikh generatorov ego zamenil elektromotor IC2
// (motor i dinamo - odna mashina) ili termoelementy. Uzhe postavlennye generatory rabotayut.
// ====================================================================================
recipes.remove(<IC2:blockGenerator>);

// ====================================================================================
// 13. GEOTERMAL'NYY GENERATOR IC2 (lava -> EU) - VYREZAN (B1, 1.56.53): lava -> EU bez nishi ne nuzhna.
// ====================================================================================
recipes.remove(<IC2:blockGenerator:1>);

// ====================================================================================
// KOROBKA LOMA VYREZANA: utilizator + korobka prevraschali bulyzhnik v rudu, almazy i ugol'nuyu pyl'.
// Udalit' soderzhimoe korobki skriptom nel'zya (MineTweaker umeet tol'ko dobavlyat'), poetomu ubran eyo kraft.
// Lom ostayotsya usilitelem generatora materii.
// ====================================================================================
recipes.remove(<IC2:itemScrapbox>);

// ====================================================================================
// VYREZANO: teleporter IC2 (teleporty vyrezany vo vsekh modakh), starye generatory IC2 -
// vodyanaya mel'nitsa i vetryak dayut EU naprjamuyu v obkhod kinetiki (rotory, kineticheskie generatory).
// ====================================================================================
recipes.remove(<IC2:blockMachine2:0>);
recipes.remove(<IC2:blockGenerator:2>);
recipes.remove(<IC2:blockGenerator:4>);

// ====================================================================================
// 14. BAZOVYE DETALI IC2 DOROZhE (Zavod 1.30): ot nikh zavisit vsya elektrotekhnika
// Korpus mashiny: BYLO 8 zheleznykh plastin. TEPER' stal'naya rama (ugly) + zheleznaya obshivka.
// Elektromotor: BYLO slitok zheleza vmesto vala. TEPER' tochyonyy zheleznyy val na babbitovykh podshipnikakh.
// ====================================================================================
recipes.remove(machineFrameIC2);
recipes.addShaped(machineFrameIC2, [
    [<ore:plateSteel>, <ore:plateIron>, <ore:plateSteel>],
    [<ore:plateIron>,  null,            <ore:plateIron>],
    [<ore:plateSteel>, <ore:plateIron>, <ore:plateSteel>]
]);
recipes.remove(motorIC2);
recipes.addShaped(motorIC2, [
    [<zavod:ingot_babbitt>, <IC2:itemCasing:1>,      <zavod:ingot_babbitt>],   // podshipniki skol'zheniya
    [copperCoil,            <IC2:itemRecipePart:11>, copperCoil],              // obmotki na zheleznom valu
    [null,                  <IC2:itemCasing:1>,      null]
]);

// ====================================================================================
// 15. SVINTsOVO-KISLOTNYY AKKUMULYaTOR BEZ RF (Zavod 1.30)
// Sukhozaryazhennyy akkumulyator (plastiny, ebonitovyy korpus, vyvod) sobiraetsya na verstake,
// elektrolit (250 mB sernoy kisloty) zalivaetsya v khimreaktore Zavod -> akkumulyator RE.
// Put' cherez plotnik Forestry (distillyat + sera) ostalsya.
// ====================================================================================
recipes.addShaped(<zavod:battery_dry> * 2, [
    [null,            <IC2:itemCable:13>,  null],
    [<ore:plateLead>, <ore:dustLead>,       <ore:plateLead>],   // aktivnaya massa: svintsovyy poroshok (pasta Fora, 1881), pri formovke - dioksid svintsa
    [<ore:plateLead>, <IC2:itemRubber>,     <ore:plateLead>]
]);
