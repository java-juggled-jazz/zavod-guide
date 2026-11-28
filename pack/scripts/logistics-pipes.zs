// ====================================================================================
// 13. REFORMA LOGISTICS PIPES (ispravlennyy)
// BYLO: <ore:chipRedstone> / <ore:chipGold> - pustye zapisi slovarya (BC registriruet chipsetRedstone...),
// poetomu VSE logisticheskie truby byli nekraftabel'ny.
// ====================================================================================

val logBasicPipe    = <LogisticsPipes:item.PipeItemsBasicLogistics>;
val logRequestPipe  = <LogisticsPipes:item.PipeItemsRequestLogistics>;
val logCraftingPipe = <LogisticsPipes:item.PipeItemsCraftingLogistics>;
val logChassis1     = <LogisticsPipes:item.PipeLogisticsChassiMk1>;

val chipRed        = <BuildCraft|Silicon:redstoneChipset>;    // Krasnyy chipset BC
val chipGold       = <BuildCraft|Silicon:redstoneChipset:2>;  // Zolotoy chipset BC
val siliconChipBC  = <BuildCraft|Silicon:redstoneChipset:5>;  // Kvartsevyy chipset BC
val pipeGold       = <BuildCraft|Transport:item.buildcraftPipe.pipeitemsgold>;
val plateBronze    = <ore:plateBronze>;
val ingotInvar     = <ore:ingotInvar>;
val gearBronze     = <ore:gearBronze>;
val gearSteel      = <ore:gearSteel>;
val circuitIC2     = <IC2:itemPartCircuit>;
val copperCoil     = <IC2:itemRecipePart>;                     // Katushka IC2 (meta 0)

recipes.remove(logBasicPipe);
recipes.remove(logRequestPipe);
recipes.remove(logCraftingPipe);
recipes.remove(logChassis1);

// 1. Bazovaya logisticheskaya truba - zolotaya truba BC + krasnyy chipset + skhema IC2
recipes.addShaped(logBasicPipe * 2, [
    [null,        chipRed,    null],
    [plateBronze, pipeGold,   plateBronze],
    [null,        circuitIC2, null]
]);

// 2. Truba zaprosa - zolotoy chipset + katushki upravleniya
recipes.addShaped(logRequestPipe, [
    [copperCoil,  chipGold,      copperCoil],
    [plateBronze, logBasicPipe,  plateBronze],
    [gearBronze,  siliconChipBC, gearBronze]
]);

// 3. Truba avtokrafta - stal'noy privod + kvartsevyy chipset
recipes.addShaped(logCraftingPipe, [
    [gearSteel,   chipGold,      gearSteel],
    [plateBronze, logBasicPipe,  plateBronze],
    [copperCoil,  siliconChipBC, copperCoil]
]);

// 4. Shassi Mk1 - invarovaya stanina + logicheskaya truba
recipes.addShaped(logChassis1, [
    [ingotInvar,  chipRed,      ingotInvar],
    [plateBronze, logBasicPipe, plateBronze],
    [ingotInvar,  circuitIC2,   ingotInvar]
]);
