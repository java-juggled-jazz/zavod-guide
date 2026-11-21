// ====================================================================================
//   ZhIDKOSTNYE TRUBY BUILDCRAFT - TOL'KO V PLOTNIKE FORESTRY, NA RASTITEL'NOM MASLE
// POChEMU: olifa (rastitel'noe maslo) - istoricheskiy gidroupor: ey propityvali
// shvy i soedineniya, chtoby oni derzhali zhidkost'.
// TEPER': 8 trub dlya predmetov + rezinovaya prokladka + 250 mB masla -> 8 zhidkostnykh trub.
// Ruchnoy kraft "truba + germetik" i sam germetik vyrezany.
// ====================================================================================

val seedOil = <liquid:seedoil> * 250;
val rubber  = <ore:itemRubber>;

// Germetik trub bol'she ne nuzhen
recipes.remove(<BuildCraft|Transport:pipeWaterproof>);

// --- Derevyannaya ---
val iWood = <BuildCraft|Transport:item.buildcraftPipe.pipeitemswood>;
val fWood = <BuildCraft|Transport:item.buildcraftPipe.pipefluidswood>;
recipes.remove(fWood);
mods.forestry.Carpenter.addRecipe(fWood * 8, [[iWood, iWood, iWood], [iWood, rubber, iWood], [iWood, iWood, iWood]], seedOil, 10);

// --- Bulyzhnaya ---
val iCobble = <BuildCraft|Transport:item.buildcraftPipe.pipeitemscobblestone>;
val fCobble = <BuildCraft|Transport:item.buildcraftPipe.pipefluidscobblestone>;
recipes.remove(fCobble);
mods.forestry.Carpenter.addRecipe(fCobble * 8, [[iCobble, iCobble, iCobble], [iCobble, rubber, iCobble], [iCobble, iCobble, iCobble]], seedOil, 10);

// --- Kamennaya ---
val iStone = <BuildCraft|Transport:item.buildcraftPipe.pipeitemsstone>;
val fStone = <BuildCraft|Transport:item.buildcraftPipe.pipefluidsstone>;
recipes.remove(fStone);
mods.forestry.Carpenter.addRecipe(fStone * 8, [[iStone, iStone, iStone], [iStone, rubber, iStone], [iStone, iStone, iStone]], seedOil, 10);

// --- Peschanikovaya ---
val iSand = <BuildCraft|Transport:item.buildcraftPipe.pipeitemssandstone>;
val fSand = <BuildCraft|Transport:item.buildcraftPipe.pipefluidssandstone>;
recipes.remove(fSand);
mods.forestry.Carpenter.addRecipe(fSand * 8, [[iSand, iSand, iSand], [iSand, rubber, iSand], [iSand, iSand, iSand]], seedOil, 10);

// --- Kvartsevaya ---
val iQuartz = <BuildCraft|Transport:item.buildcraftPipe.pipeitemsquartz>;
val fQuartz = <BuildCraft|Transport:item.buildcraftPipe.pipefluidsquartz>;
recipes.remove(fQuartz);
mods.forestry.Carpenter.addRecipe(fQuartz * 8, [[iQuartz, iQuartz, iQuartz], [iQuartz, rubber, iQuartz], [iQuartz, iQuartz, iQuartz]], seedOil, 10);

// --- Glinyanaya ---
val iClay = <BuildCraft|Transport:item.buildcraftPipe.pipeitemsclay>;
val fClay = <BuildCraft|Transport:item.buildcraftPipe.pipefluidsclay>;
recipes.remove(fClay);
mods.forestry.Carpenter.addRecipe(fClay * 8, [[iClay, iClay, iClay], [iClay, rubber, iClay], [iClay, iClay, iClay]], seedOil, 10);

// --- Zheleznaya ---
val iIron = <BuildCraft|Transport:item.buildcraftPipe.pipeitemsiron>;
val fIron = <BuildCraft|Transport:item.buildcraftPipe.pipefluidsiron>;
recipes.remove(fIron);
mods.forestry.Carpenter.addRecipe(fIron * 8, [[iIron, iIron, iIron], [iIron, rubber, iIron], [iIron, iIron, iIron]], seedOil, 10);

// --- Zolotaya ---
val iGold = <BuildCraft|Transport:item.buildcraftPipe.pipeitemsgold>;
val fGold = <BuildCraft|Transport:item.buildcraftPipe.pipefluidsgold>;
recipes.remove(fGold);
mods.forestry.Carpenter.addRecipe(fGold * 8, [[iGold, iGold, iGold], [iGold, rubber, iGold], [iGold, iGold, iGold]], seedOil, 10);

// --- Izumrudnaya ---
val iEmerald = <BuildCraft|Transport:item.buildcraftPipe.pipeitemsemerald>;
val fEmerald = <BuildCraft|Transport:item.buildcraftPipe.pipefluidsemerald>;
recipes.remove(fEmerald);
mods.forestry.Carpenter.addRecipe(fEmerald * 8, [[iEmerald, iEmerald, iEmerald], [iEmerald, rubber, iEmerald], [iEmerald, iEmerald, iEmerald]], seedOil, 10);

// --- Almaznaya ---
val iDiamond = <BuildCraft|Transport:item.buildcraftPipe.pipeitemsdiamond>;
val fDiamond = <BuildCraft|Transport:item.buildcraftPipe.pipefluidsdiamond>;
recipes.remove(fDiamond);
mods.forestry.Carpenter.addRecipe(fDiamond * 8, [[iDiamond, iDiamond, iDiamond], [iDiamond, rubber, iDiamond], [iDiamond, iDiamond, iDiamond]], seedOil, 10);

// --- Pustotnaya ---
val iVoid = <BuildCraft|Transport:item.buildcraftPipe.pipeitemsvoid>;
val fVoid = <BuildCraft|Transport:item.buildcraftPipe.pipefluidsvoid>;
recipes.remove(fVoid);
mods.forestry.Carpenter.addRecipe(fVoid * 8, [[iVoid, iVoid, iVoid], [iVoid, rubber, iVoid], [iVoid, iVoid, iVoid]], seedOil, 10);

// ====================================================================================
// DOBYChA, NASOSY, ROBOTY (v kontse fayla: pri nevernom ID upadyot tol'ko etot blok)
// Shakhtnyy bur: BYLO zheleznaya kirka + shesternya - deshyovyy obkhod Advanced Miner. TEPER' koronka s tokarki, motor, stal'.
// Kar'er (Quarry): snyat v 1.56.32 (nizhe). Shakhtnyy bur: stal', koronka.
// Nasos i shlyuz-napolnitel': rezinovye uplotneniya. Robot: stal', prodvinutaya skhema, almaznye chipsety, motor.
// ====================================================================================
val bcCrown    = (<IC2:itemTurningBlanks:279329> | <IC2:itemTurningBlanks:74564>);

recipes.remove(<BuildCraft|Factory:miningWellBlock>);
recipes.addShaped(<BuildCraft|Factory:miningWellBlock>, [
    [<ore:plateSteel>, <ore:gearIron>,        <ore:plateSteel>],
    [<ore:plateSteel>, <IC2:itemRecipePart:1>, <ore:plateSteel>],
    [<ore:plateSteel>, bcCrown,               <ore:plateSteel>]
]);

// Kar'er BC (Quarry) - pod nozh (A6, 1.56.32): kar'er - nash ekskavator (kvadrat po tsentru, sektsii strely).
// Retsept snyat, v NEI skryt; stoyashchie v mire - ubrat' rukami.
recipes.remove(<BuildCraft|Builders:machineBlock>);
mods.nei.NEI.hide(<BuildCraft|Builders:machineBlock>);

recipes.remove(<BuildCraft|Factory:pumpBlock>);
recipes.addShaped(<BuildCraft|Factory:pumpBlock>, [
    [<ore:plateIron>,  <ore:dustRedstone>,           <ore:plateIron>],
    [<ore:itemRubber>, <ore:gearIron>,               <ore:itemRubber>],
    [<BuildCraft|Factory:tankBlock>, <minecraft:bucket>, <BuildCraft|Factory:tankBlock>]
]);

recipes.remove(<BuildCraft|Factory:floodGateBlock>);
recipes.addShaped(<BuildCraft|Factory:floodGateBlock>, [
    [<ore:plateIron>,       <ore:gearIron>,                 <ore:plateIron>],
    [<minecraft:iron_bars>, <BuildCraft|Factory:tankBlock>, <minecraft:iron_bars>],
    [<ore:plateIron>,       <ore:itemRubber>,               <ore:plateIron>]
]);

recipes.remove(<BuildCraft|Robotics:robot>);
recipes.addShaped(<BuildCraft|Robotics:robot>, [
    [<ore:plateSteel>, <IC2:itemPartCircuitAdv>, <ore:plateSteel>],
    [<ore:plateSteel>, <ore:crystalRedstone>,    <ore:plateSteel>],
    [<BuildCraft|Silicon:redstoneChipset:3>, <IC2:itemRecipePart:1>, <BuildCraft|Silicon:redstoneChipset:3>]
]);
