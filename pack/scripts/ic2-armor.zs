// ====================================================================================
// IC2: SILOVAYa BRONYa, LAZER, SABLYa, REAKTIVNYY RANETs - OChEN' DOROGO
// POChEMU: po umolchaniyu nano-bronya - ugleplastik i energokristall, lazer i sablya - para almazov.
// TEPER': nano-bronya = ekzoskelet: elektromotory v sustavakh (privody), kompozit (bronya), ugleplastik,
//   prodvinutye skhemy (upravlenie), energokristall (pitanie). Kvant = nano + iridiy + lapotron + kremnievye
//   chipy BC. Lazer - promyshlennyy lazer BC + lapotron + almaznaya optika. Sablya - iridievoe lezvie.
// Reaktivnyy ranets (toplivnyy): stal'noy korpus, bak BC, toplivoprovody (zhidkostnye truby BC), invarovye sopla.
// Kvantovyy nagrudnik - v lategame.zs.
// Zavod 1.37: nano i kvant - tol'ko po chertezhu (konstruktorskoe byuro ili nakhodka).
// Zavod 1.40: sborka - tol'ko v plotnike, chertyozh raskhoduetsya (kopiya - sin'ka). Chertyozh zanimaet mesto odnoy detali.
// ====================================================================================
val carbon    = <IC2:itemPartCarbonPlate>;
val alloyIC2  = <IC2:itemPartAlloy>;
val advCirc   = <IC2:itemPartCircuitAdv>;
val circ      = <IC2:itemPartCircuit>;
val motor     = <IC2:itemRecipePart:1>;
val crystal   = <IC2:itemBatCrystal:*>;
val lapo      = <IC2:itemBatLamaCrystal:*>;
val iridium   = <IC2:itemPartIridium>;
val chipSi    = <BuildCraft|Silicon:redstoneChipset:3>;
val plSteelA  = <ore:plateSteel>;
val pipeFuel  = <BuildCraft|Transport:item.buildcraftPipe.pipefluidsiron>;

// --- Nano-bronya ---
recipes.remove(<IC2:itemArmorNanoHelmet>);
// Zavod 1.40: slozhnaya tekhnika - tol'ko v plotnike, chertyozh raskhoduetsya (kopiya - sin'ka, loot.zs)
mods.forestry.Carpenter.addRecipe(<IC2:itemArmorNanoHelmet>, [[carbon, crystal, carbon], [alloyIC2, <IC2:itemNightvisionGoggles>.anyDamage(), alloyIC2], [advCirc, <zavod:blueprint_nano>, advCirc]], 200);
recipes.remove(<IC2:itemArmorNanoChestplate>);
// Zavod 1.40: slozhnaya tekhnika - tol'ko v plotnike, chertyozh raskhoduetsya (kopiya - sin'ka, loot.zs)
mods.forestry.Carpenter.addRecipe(<IC2:itemArmorNanoChestplate>, [[carbon, advCirc, carbon], [motor, crystal, motor], [alloyIC2, <zavod:blueprint_nano>, alloyIC2]], 200);
recipes.remove(<IC2:itemArmorNanoLegs>);
// Zavod 1.40: slozhnaya tekhnika - tol'ko v plotnike, chertyozh raskhoduetsya (kopiya - sin'ka, loot.zs)
mods.forestry.Carpenter.addRecipe(<IC2:itemArmorNanoLegs>, [[carbon, crystal, carbon], [motor, advCirc, motor], [alloyIC2, <zavod:blueprint_nano>, alloyIC2]], 200);
recipes.remove(<IC2:itemArmorNanoBoots>);
// Zavod 1.40: slozhnaya tekhnika - tol'ko v plotnike, chertyozh raskhoduetsya (kopiya - sin'ka, loot.zs)
mods.forestry.Carpenter.addRecipe(<IC2:itemArmorNanoBoots>, [[motor, advCirc, motor], [carbon, crystal, carbon], [alloyIC2, <zavod:blueprint_nano>, alloyIC2]], 200);

// --- Kvantovaya bronya (krome nagrudnika) ---
recipes.remove(<IC2:itemArmorQuantumHelmet>);
// Zavod 1.40: slozhnaya tekhnika - tol'ko v plotnike, chertyozh raskhoduetsya (kopiya - sin'ka, loot.zs)
mods.forestry.Carpenter.addRecipe(<IC2:itemArmorQuantumHelmet>, [[iridium, lapo, iridium], [chipSi, <IC2:itemArmorNanoHelmet>.anyDamage(), chipSi], [<IC2:blockAlloyGlass>, <IC2:itemArmorHazmatHelmet>.anyDamage(), <zavod:blueprint_quantum>]], 200);
recipes.remove(<IC2:itemArmorQuantumLegs>);
// Zavod 1.40: slozhnaya tekhnika - tol'ko v plotnike, chertyozh raskhoduetsya (kopiya - sin'ka, loot.zs)
mods.forestry.Carpenter.addRecipe(<IC2:itemArmorQuantumLegs>, [[iridium, lapo, iridium], [chipSi, <IC2:itemArmorNanoLegs>.anyDamage(), chipSi], [motor, <IC2:itemArmorHazmatLeggings>.anyDamage(), <zavod:blueprint_quantum>]], 200);
recipes.remove(<IC2:itemArmorQuantumBoots>);
// Zavod 1.40: slozhnaya tekhnika - tol'ko v plotnike, chertyozh raskhoduetsya (kopiya - sin'ka, loot.zs)
mods.forestry.Carpenter.addRecipe(<IC2:itemArmorQuantumBoots>, [[iridium, lapo, iridium], [chipSi, <IC2:itemArmorNanoBoots>.anyDamage(), chipSi], [motor, <IC2:itemArmorRubBoots>.anyDamage(), <zavod:blueprint_quantum>]], 200);

// --- Gornyy lazer: promyshlennyy lazer BC, lapotronnaya nakachka, vtoroy izumrudnyy aktivnyy element ---
recipes.remove(<IC2:itemToolMiningLaser>);
recipes.addShaped(<IC2:itemToolMiningLaser>, [
    [<zavod:laser_rod>,   alloyIC2,                                alloyIC2],
    [advCirc,             <BuildCraft|Silicon:laserBlock>,         lapo],
    [alloyIC2,            alloyIC2,                                advCirc]
]);

// --- Nano-sablya: iridievoe lezvie, ugleplastikovaya rukoyat', lapotron ---
recipes.remove(<IC2:itemNanoSaber>);
recipes.addShaped(<IC2:itemNanoSaber>, [
    [null,    iridium, null],
    [carbon,  iridium, carbon],
    [advCirc, lapo,    advCirc]
]);

// --- Reaktivnyy ranets (toplivnyy) ---
recipes.remove(<IC2:itemArmorJetpack>);
recipes.addShaped(<IC2:itemArmorJetpack>, [
    [plSteelA,          circ,                           plSteelA],
    [pipeFuel,          <BuildCraft|Factory:tankBlock>, pipeFuel],
    [<ore:ingotInvar>,  null,                           <ore:ingotInvar>]
]);
