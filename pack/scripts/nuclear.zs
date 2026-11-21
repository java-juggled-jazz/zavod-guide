// ====================================================================================
// URAN I PLUTONIY (Zavod 1.32): kak v zhizni, s khimiey. Ftora v sborke net - obogashchenie tol'ko kalyutronom.
//  1. Droblyonaya uranovaya ruda + sernaya kislota (khimreaktor)   -> rastvor uranilsul'fata
//  2. Uranilsul'fat + ammiak (khimreaktor)                         -> zhyoltyy kek (diuranat ammoniya) x2
//  3. Zhyoltyy kek + vodorod (reaktor vysokogo davleniya)          -> dioksid urana prirodnyy
//  4. Dioksid urana -> KALYuTRON (EU IC2, do HV, 100 000 EU)       -> malyy uran-235 + 3 urana-238 (otval)
//  5. Toplivo IC2: 6 urana-238 + 3 malykh 235 (verstak); obolochka tvela - legirovannaya stal' (metalloformovshchik).
//  6. Otrabotannye sterzhni + azotnaya (VD, PUREX)                 -> plutoniy + rastvor uranilnitrata
//     uranilnitrat + ammiak                                        -> uran-238 (obratno v MOX i toplivo)
//  7. Plutoniy: MOX (6 urana-238 + 3 plutoniya, retsept IC2) i RITEG-tabletki (nizhe).
//  Termotsentrifuga IC2 urana i otrabotannykh sterzhney bol'she ne beryot.
// ====================================================================================
val denseCopper = <IC2:itemDensePlates:0>;
val denseSteel  = <IC2:itemDensePlates:5>;
val denseLead   = <IC2:itemDensePlates:6>;
val copperCoil  = <IC2:itemRecipePart>;
val advCasing   = <IC2:blockMachine:12>;
val advCircuit  = <IC2:itemPartCircuitAdv>;
val hvTrans     = <IC2:blockElectric:5>;
val plutonium   = <IC2:itemPlutonium>;

// Kalyutron: elektromagnit (mednye katushki na plotnoy medi), vakuumnaya kamera v prodvinutom korpuse,
// pitanie - transformator HV, upravlenie puchkom - prodvinutye skhemy.
recipes.addShaped(<zavod:calutron>, [
    [denseCopper, copperCoil, denseCopper],
    [copperCoil,  advCasing,  copperCoil],
    [advCircuit,  hvTrans,    advCircuit]
]);

// RITEG-tabletka: BYLO 3 plutoniya v 6 plotnykh zheleznykh plastinakh. TEPER' stal'naya kapsula v svintsovoy zashchite.
recipes.remove(<IC2:itemRTGPellet>);
recipes.addShaped(<IC2:itemRTGPellet>, [
    [denseSteel, plutonium, denseSteel],
    [denseLead,  plutonium, denseLead],
    [denseSteel, plutonium, denseSteel]
]);

// Sektsiya treka kalyutrona (Y-12 "reystrek", 1.33): eshchyo odin vakuumnyy bak v obshchem magnite.
// Stavitsya v ryad ZA kalyutronom (do 8). Pul't, transformator i skhemy - odni na ves' trek, potomu sektsiya deshevle mashiny.
recipes.addShaped(<zavod:calutron_section>, [
    [copperCoil, denseCopper,      copperCoil],
    [<ore:plateSteel>, <IC2:blockAlloyGlass>, <ore:plateSteel>],
    [copperCoil, denseCopper,      copperCoil]
]);

// ====================================================================================
// GRAFIT I TYaZhYoLAYa VODA (B6 chat 1)
//  Ugol'naya zagotovka: neftekoks + bitum (svyazuyushchee, kak elektrody Acheson) -> elektroliznaya vanna (EU) -> grafit.
//  Grafit: kladka reaktornoy kamery (zamedlitel', ic2-machines.zs) i neytronnyy otrazhatel'.
//  Tyazhyolaya voda: ta zhe vanna s vodoy v bake (kaskad Vemorka, 4000 vody -> 25 mB) -> tolstyy otrazhatel' (plotnik).
// ====================================================================================
recipes.addShapeless(<zavod:carbon_blank> * 3, [<zavod:petcoke>, <zavod:petcoke>, <zavod:petcoke>, <zavod:bitumen>]);

// Neytronnyy otrazhatel': grafitovye bloki v zhestyanoy obolochke na mednoy osnove (BYLO: pyl' olova + ugol'naya pyl')
recipes.remove(<IC2:reactorReflector:*>);
recipes.addShaped(<IC2:reactorReflector:1>, [
    [<zavod:graphite>,  <ore:plateTin>,    <zavod:graphite>],
    [<ore:plateTin>,    <ore:plateCopper>, <ore:plateTin>],
    [<zavod:graphite>,  <ore:plateTin>,    <zavod:graphite>]
]);

// Tolstyy otrazhatel': 4 otrazhatelya vokrug stal'nogo baka s tyazhyoloy vodoy (BYLO: 5 mednykh plastin, verstak)
recipes.remove(<IC2:reactorReflectorThick:*>);
mods.forestry.Carpenter.addRecipe(<IC2:reactorReflectorThick:1>, [
    [<ore:plateCopper>,         <IC2:reactorReflector:1>, <ore:plateCopper>],
    [<IC2:reactorReflector:1>,  <ore:plateSteel>,         <IC2:reactorReflector:1>],
    [<ore:plateCopper>,         <IC2:reactorReflector:1>, <ore:plateCopper>]
], <liquid:heavywater> * 1000, 100);
