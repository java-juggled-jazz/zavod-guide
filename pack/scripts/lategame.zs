// ====================================================================================
//                         LEYTGEYM (ispravlennyy)
// ====================================================================================


val motorIC2         = <IC2:itemRecipePart:1>;
val circuitIC2       = <IC2:itemPartCircuit>;
val advCircuit       = <IC2:itemPartCircuitAdv>;
val advMachineFrame  = <IC2:blockMachine:12>;      // Prodvinutyy korpus IC2

val octadicCapacitor = <IC2:itemBatLamaCrystal:*>;   // lapotronnyy kristall (BYLO: oktadnyy kondensator EnderIO)
val denseLead        = <IC2:itemDensePlates:6>;
val denseSteel       = <IC2:itemDensePlates:5>;
val siliconChipBC    = <BuildCraft|Silicon:redstoneChipset:5>; // Kvartsevyy chipset BC (BYLO: pustoy <ore:chipRedstone>)


// ====================================================================================
// 6. MIROVOY YaKOR' RAILCRAFT I ADVANCED MINER
// ====================================================================================
recipes.remove(<Railcraft:machine.alpha:0>);
// Zavod 1.40: slozhnaya tekhnika - tol'ko v plotnike, chertyozh raskhoduetsya (kopiya - sin'ka, loot.zs)
mods.forestry.Carpenter.addRecipe(<Railcraft:machine.alpha:0>, [[denseLead, <BuildCraft|Silicon:redstoneChipset:2>, denseLead], [<IC2:itemPartCircuitAdv>, <IC2:blockElectric:7>, <IC2:itemPartCircuitAdv>], [denseLead, motorIC2, <zavod:blueprint_anchor>]], 200);

// Advanced Miner (zamena kar'eru BC). Obychnyy Miner vyrezan (ic2-machines.zs),
// poetomu vmesto dvukh Miner'ov - almaznyy bur i burovye truby.
// BYLO: v tsentre stoyala POMPA (blockMachine:8) vmesto prodvinutogo korpusa.
// Namagnichivatel' sverkhu: magnitnyy zakhvat i pod'yom porody po burovomu stavu
recipes.remove(<IC2:blockMachine2:11>);
recipes.addShaped(<IC2:blockMachine2:11>, [
    [<ore:gearSteel>,    <IC2:blockMachine:9>,     <ore:gearSteel>],
    [<IC2:blockMiningPipe>, advMachineFrame,       <IC2:blockMiningPipe>],
    [advCircuit,         <IC2:itemToolDDrill:*>,   advCircuit]
]);

// ====================================================================================
// 7. ADVANCED ALLOY: ARMIROVANIE AES I BUROVYE FREZY
// ====================================================================================
// Ukreplyonnyy kamen' (IC2:blockAlloy) - tyazhyolyy beton: kamen' bezdny (plotnaya glubinnaya poroda, derzhit izluchenie)
// na kompozite, svyazka na obsidianovoy pyli (BYLO: obychnyy kamen' i ugol'naya pyl')
recipes.remove(<IC2:blockAlloy>);
recipes.addShaped(<IC2:blockAlloy> * 4, [
    [<Railcraft:cube:6>, <IC2:itemPartAlloy>, <Railcraft:cube:6>],
    [<IC2:itemPartAlloy>, <ore:dustObsidian>,  <IC2:itemPartAlloy>],
    [<Railcraft:cube:6>, <IC2:itemPartAlloy>, <Railcraft:cube:6>]
]);

// Almaznyy bur. BYLO: <IC2:itemToolDiamondDrill> ne suschestvuet -> NPE -> ves' ostatok lategame.zs ne rabotal.
// Bur v retsepte - s lyubym zaryadom (:*).
recipes.remove(<IC2:itemToolDDrill>);
recipes.addShaped(<IC2:itemToolDDrill>, [
// Koronka - tokarnaya zagotovka-konus 4-3-2-1-1, almazy vpayany po krayam.
    [<minecraft:diamond>, (<IC2:itemTurningBlanks:274961> | <IC2:itemTurningBlanks:70196>), <minecraft:diamond>],
    [<IC2:itemPartAlloy>, <IC2:itemToolDrill:*>, <IC2:itemPartAlloy>],
    [<ore:plateSteel>,    circuitIC2,           <ore:plateSteel>]
]);

// ====================================================================================
// 8. KhLADAGENT I KAPSULY - pereneseny v ic2-machines.zs (razdel AES)
// ====================================================================================

// ====================================================================================
// 9. IRIDIY I KVANT
// ====================================================================================
recipes.remove(<IC2:itemArmorQuantumChestplate>);
// Zavod 1.40: slozhnaya tekhnika - tol'ko v plotnike, chertyozh raskhoduetsya (kopiya - sin'ka, loot.zs)
mods.forestry.Carpenter.addRecipe(<IC2:itemArmorQuantumChestplate>, [[<IC2:itemPartIridium>, octadicCapacitor, <IC2:itemPartIridium>], [siliconChipBC, <IC2:itemArmorNanoChestplate>, siliconChipBC], [denseSteel, <IC2:itemArmorHazmatChestplate>, <zavod:blueprint_quantum>]], 200);

// Anodnyy shlam - tol'ko ot elektroliticheskogo rafinirovaniya medi i nikelya v elektroliznoy vanne Zavod (precious.zs).

// Zavod 1.46: iridiy iz kamnya Kraya ubran - iridiy tol'ko na Lune i v poyase asteroidov (metoritnaya ruda, zavod.jar).
