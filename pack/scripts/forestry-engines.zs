// ====================================================================================
// REFORMA DVIGATELEY FORESTRY (porshnevaya bio-energetika)
// engine: 1 torfyanoy, 2 biogazovyy - VYREZANY (B1, 1.56.53): torf i biogaz - toplivo kotlov i gazovoy turbiny
// ====================================================================================

val enginePeat   = <Forestry:engine:1>;
val engineBiogas = <Forestry:engine:2>;

val plateBronze  = <ore:plateBronze>;
val plateIron    = <ore:plateIron>;
val ingotInvar   = <ore:ingotInvar>;
val gearBronze   = <ore:gearBronze>;
val gearInvar    = <ore:gearInvar>;
val copperCoil   = <IC2:itemRecipePart>;           // Katushka IC2 (BYLO :3 - malyy silovoy blok)
val piston       = <minecraft:piston>;
val tankBC       = <BuildCraft|Factory:tankBlock>;
val brickBlock   = <minecraft:brick_block>;

recipes.remove(enginePeat);
recipes.remove(engineBiogas);

// ------------------------------------------------------------------------------------
// 3. ELEKTRODVIGATEL' (EU -> MJ): most IC2 -> BuildCraft. Motor IC2, katushki, olovyannyy korpus, skhema.
// ------------------------------------------------------------------------------------
recipes.remove(<Forestry:engine:0>);
recipes.addShaped(<Forestry:engine:0>, [
    [<ore:plateTin>, <IC2:itemPartCircuit>,  <ore:plateTin>],
    [copperCoil,     <IC2:itemRecipePart:1>, copperCoil],
    [gearBronze,     <zavod:shaft>,          gearBronze]   // vykhodnoy val motora (BYLO: porshen')
]);

// ------------------------------------------------------------------------------------
// 4. ChASOVOY DVIGATEL': nastoyaschiy chasovoy mekhanizm - bronzovye shesterni + stal'naya pruzhina.
// Besplatnaya energiya ot klikov ne dolzhna byt' deshevle samikh chasov.
// ------------------------------------------------------------------------------------
recipes.remove(<Forestry:engine:4>);
recipes.addShaped(<Forestry:engine:4>, [
    [plateBronze, <minecraft:clock>, plateBronze],
    [gearBronze,  <ore:plateSteel>,  gearBronze],
    [gearBronze,  <zavod:shaft>,     gearBronze]   // vykhodnoy val (BYLO: porshen')
]);
