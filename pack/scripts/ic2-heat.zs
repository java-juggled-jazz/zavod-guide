// ====================================================================================
// TEPLOVAYa LINIYa IC2 EXP, DOMENNAYa PECh', FERMENTER, TRANSFORMATORY, KONSERVATOR
// Pravilo materialov teplovoy linii:
//   stal'  - rama i vsyo, chto derzhit davlenie snaruzhi;
//   med'   - teploobmenniki i kondensatory (teploprovodnost');
//   bronza - parovoy trakt vnutri (stoykost' k paru i vode);
//   invar  - TOL'KO zona plameni (topki teplovykh generatorov);
//   domennyy kirpich Railcraft - futerovka.
// ====================================================================================

val plateSteel   = <ore:plateSteel>;
val plateIron    = <ore:plateIron>;
val plateBronze  = <ore:plateBronze>;
val denseSteel   = <IC2:itemDensePlates:5>;
val denseCopper  = <IC2:itemDensePlates:0>;
val denseBronze  = <IC2:itemDensePlates:2>;
val denseLead    = <IC2:itemDensePlates:6>;
val ingotInvar   = <ore:ingotInvar>;
val elSteel      = <zavod:ingot_electrical_steel>;      // elektrotekhnicheskaya stal' (Zavod) = serdechnik transformatora

val machineFrameIC2 = <IC2:blockMachine>;
val advCasing    = <IC2:blockMachine:12>;
val circuitIC2   = <IC2:itemPartCircuit>;
val advCircuit   = <IC2:itemPartCircuitAdv>;
val copperCoil   = <IC2:itemRecipePart>;
val motorIC2     = <IC2:itemRecipePart:1>;
val heatCond     = <IC2:itemRecipePart:5>;              // teploprovodnik
val copperBoiler = <IC2:itemRecipePart:6>;              // mednyy kotyol
val ironFurnace  = <IC2:blockMachine:1>;
val reactorChamber = <IC2:blockReactorChamber>;
val blastBrick   = <Railcraft:machine.alpha:12>;
val tankBC       = <BuildCraft|Factory:tankBlock>;
val fluidPipeFe  = <BuildCraft|Transport:item.buildcraftPipe.pipefluidsiron>;
val piston       = <minecraft:piston>;

val tinCable     = <IC2:itemCable:13>;
val copperCable  = <IC2:itemCable>;
val goldCable    = <IC2:itemCable:3>;
val hvCable      = <IC2:itemCable:6>;
val glassFibre   = <IC2:itemCable:9>;

// ====================================================================================
// 1. ISTOChNIKI TEPLA (HU)
// ====================================================================================
// Tverdotoplivnyy: zheleznaya topka na ogneupore (1.28.1: rannyaya stupen' - bez stali i invara).
// Teplo - tekhnologicheskoe (domennaya IC2, fermenter), ne energiya: Stirlingi vyrezany (B1).
recipes.remove(<IC2:blockHeatGenerator>);
recipes.addShaped(<IC2:blockHeatGenerator>, [
    [plateIron,  heatCond,    plateIron],
    [plateIron,  ironFurnace, plateIron],
    [blastBrick, blastBrick,  blastBrick]
]);

// Zhidkotoplivnyy: invarovaya gorelka, toplivnyy nasos (motor), baki
recipes.remove(<IC2:blockHeatGenerator:1>);
recipes.addShaped(<IC2:blockHeatGenerator:1>, [
    [ingotInvar, heatCond,   ingotInvar],
    [tankBC,     blastBrick, tankBC],
    [plateSteel, motorIC2,   plateSteel]
]);

// Elektricheskiy: greyut katushki, kotorye vstavlyayutsya vnutr' (do 10). Korpus - stal', teplosyom - med'.
recipes.remove(<IC2:blockHeatGenerator:3>);
recipes.addShaped(<IC2:blockHeatGenerator:3>, [
    [plateSteel, copperCable,     plateSteel],
    [heatCond,   machineFrameIC2, heatCond],
    [plateSteel, circuitIC2,      plateSteel]
]);

// Radioizotopnyy (teplo) i RITEG (srazu EU): reaktornaya kamera v svintsovoy zaschite
recipes.remove(<IC2:blockHeatGenerator:2>);
recipes.addShaped(<IC2:blockHeatGenerator:2>, [
    [denseLead,  heatCond,       denseLead],
    [denseLead,  reactorChamber, denseLead],
    [plateSteel, heatCond,       plateSteel]
]);
recipes.remove(<IC2:blockGenerator:6>);
recipes.addShaped(<IC2:blockGenerator:6>, [
    [denseLead,  copperCoil,     denseLead],
    [denseLead,  reactorChamber, denseLead],
    [plateSteel, <zavod:plate_monel>, plateSteel]   // termoelementy med' - monel': ni odnoy dvizhuscheysya detali
]);

// Zhidkostnyy teploobmennik (lava ili goryachiy khladagent reaktora -> teplo): mednyy puchok v stal'nom korpuse
recipes.remove(<IC2:blockMachine2:12>);
recipes.addShaped(<IC2:blockMachine2:12>, [
    [plateSteel,  fluidPipeFe, plateSteel],
    [denseCopper, heatCond,    denseCopper],
    [plateSteel,  fluidPipeFe, plateSteel]
]);

// ====================================================================================
// 2. PAROVOY TRAKT
// ====================================================================================
// Parogenerator: mednyy kotyol v bronzovoy rubashke, stal'naya rama
recipes.remove(<IC2:blockMachine3>);
recipes.addShaped(<IC2:blockMachine3>, [
    [plateSteel,  fluidPipeFe,  plateSteel],
    [denseBronze, copperBoiler, denseBronze],
    [plateSteel,  heatCond,     plateSteel]
]);

// Kondensator: mednyy trubnyy puchok, stal'naya rama (ventilyatory stavyatsya v ego sloty)
recipes.remove(<IC2:blockMachine2:15>);
recipes.addShaped(<IC2:blockMachine2:15>, [
    [plateSteel,  fluidPipeFe,     plateSteel],
    [denseCopper, machineFrameIC2, denseCopper],
    [plateSteel,  circuitIC2,      plateSteel]
]);

// ====================================================================================
// 3. STIRLINGI - VYREZANY (B1, 1.56.53): teplo -> EU / kinetika v obkhod para. Ugol' -> EU - tol'ko
//    kotyol -> par -> turbina. Retsepty snyaty, v NEI skryty (nei-hide.zs).
// ====================================================================================
recipes.remove(<IC2:blockGenerator:8>);
recipes.remove(<IC2:blockKineticGenerator:5>);

// ====================================================================================
// 4. DOMENNAYa PECh' IC2: stal' + ogneupor. Rabotaet na teple (HU) i szhatom vozdukhe (dut'yo).
// ====================================================================================
recipes.remove(<IC2:blockMachine3:1>);
recipes.addShaped(<IC2:blockMachine3:1>, [
    [plateSteel, blastBrick,      plateSteel],
    [blastBrick, machineFrameIC2, blastBrick],
    [plateSteel, heatCond,        plateSteel]
]);

// ====================================================================================
// 5. FERMENTER (biomassa + teplo -> biogaz + udobrenie): metantenk
// Germetichnye baki, meshalka (motor), podogrev (teploprovodnik), stal'noy korpus.
// ====================================================================================
recipes.remove(<IC2:blockMachine2:13>);
recipes.addShaped(<IC2:blockMachine2:13>, [
    [plateSteel, tankBC,          plateSteel],
    [motorIC2,   machineFrameIC2, heatCond],
    [plateSteel, tankBC,          plateSteel]
]);
// Syr'yo: krome bioplevel IC2 - mul'cha Forestry (fermy -> mul'cha -> konservator -> biomassa)
// V zavod.jar (Ic2Enrich): <liquid:ic2biomass> * 1000, <liquid:water> * 1000, <Forestry:mulch> * 4 - MT ne otkatyvaet obogaschenie IC2, skript padal pri vkhode v mir

// ====================================================================================
// 6. TRANSFORMATORY: obmotki (katushki) na serdechnike iz elektrotekhnicheskoy stali (zhelezo + kremniy)
// Kazhdyy sleduyuschiy - iz predyduschego. BYLO: LV iz dosok, HV s akkumulyatorom vnutri.
// ====================================================================================
recipes.remove(<IC2:blockElectric:3>);
recipes.addShaped(<IC2:blockElectric:3>, [
    [elSteel,    tinCable, elSteel],
    [copperCoil, elSteel,  copperCoil],
    [elSteel,    tinCable, elSteel]
]);
recipes.remove(<IC2:blockElectric:4>);
recipes.addShaped(<IC2:blockElectric:4>, [
    [elSteel,    copperCable,         elSteel],
    [copperCoil, <IC2:blockElectric:3>, copperCoil],
    [elSteel,    copperCable,         elSteel]
]);
// (Zavod 1.49) Farforovyy izolyator: glina + obozhzhyonnyy kremen' (kremnezyom), obzhig v tigel'noy pechi Zavod na kokse (v mode).
// Vysokoe napryazhenie vyvoditsya iz baka cherez farforovye vvody - na HV i EV transformatorakh.

val insulator = <zavod:insulator>;

recipes.remove(<IC2:blockElectric:5>);
recipes.addShaped(<IC2:blockElectric:5>, [
    [insulator,  goldCable,           insulator],
    [copperCoil, <IC2:blockElectric:4>, copperCoil],
    [elSteel,    circuitIC2,          elSteel]
]);
recipes.remove(<IC2:blockElectric:6>);
recipes.addShaped(<IC2:blockElectric:6>, [
    [insulator,  hvCable,             insulator],
    [copperCoil, <IC2:blockElectric:5>, copperCoil],
    [elSteel,    advCircuit,          elSteel]
]);

// 7. (BYLO: teleporter IC2 - vyrezan v ic2-machines.zs; myortvyy retsept zdes' ubran)

// ====================================================================================
// PAROGENERATOR AES (Zavod 1.30): goryachiy khladagent zhidkostnogo reaktora IC2 -> par Railcraft (vtoroy kontur).
// Trubchatyy teploobmennik: mednye teploprovodniki v stal'nom korpuse, vkhod-vykhod - zheleznye zhidkostnye truby BC.
// ====================================================================================
recipes.addShaped(<zavod:steam_generator>, [
    [plateSteel,  heatCond, plateSteel],
    [fluidPipeFe, tankBC,   fluidPipeFe],
    [plateSteel,  heatCond, plateSteel]
]);
