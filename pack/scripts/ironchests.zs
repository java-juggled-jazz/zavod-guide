// ====================================================================================
// IRON CHESTS: SUNDUKI NA PLASTINAKH SBORKI
// Lestnitsa: med' (45) -> zhelezo (54) -> serebro (72) -> zoloto (81) -> obsidianovyy seyf (108, vzryvostoykiy).
// Med', zhelezo, zoloto - plastiny; serebro - slitki (serebryanykh plastin v sborke net).
// Vyrezany: almaznyy i khrustal'nyy sunduki (almazy v mebel' - ne realizm), "Dirt Chest 9000" (shutka).
// Obsidianovyy seyf - iz zolotogo sunduka + 8 obsidianovykh plastin (blokorezka, almaznyy disk).
// Uluchsheniya na meste (s sokhraneniem soderzhimogo) - te zhe materialy; almaznye uluchsheniya vyrezany.
// ====================================================================================

val ch     = <IronChest:BlockIronChest:*>;
val chIron = <IronChest:BlockIronChest:0>;
val chGold = <IronChest:BlockIronChest:1>;
val chCu   = <IronChest:BlockIronChest:3>;
val chAg   = <IronChest:BlockIronChest:4>;
val chObs  = <IronChest:BlockIronChest:6>;
val plCu   = <ore:plateCopper>;
val plFe   = <ore:plateIron>;
val plAu   = <ore:plateGold>;
val agI    = <ore:ingotSilver>;
val plObs  = <IC2:itemPlates:7>;
val glass  = <minecraft:glass>;
val plank  = <ore:plankWood>;
val chest  = <minecraft:chest>;

recipes.remove(ch);
recipes.addShaped(chCu,   [[plCu, plCu, plCu], [plCu, chest, plCu], [plCu, plCu, plCu]]);
recipes.addShaped(chIron, [[plFe, plFe, plFe], [plFe, chest, plFe], [plFe, plFe, plFe]]);
recipes.addShaped(chIron, [[plFe, glass, plFe], [glass, chCu, glass], [plFe, glass, plFe]]);
recipes.addShaped(chAg,   [[agI, agI, agI], [agI, chCu, agI], [agI, agI, agI]]);
recipes.addShaped(chAg,   [[agI, glass, agI], [glass, chIron, glass], [agI, glass, agI]]);
recipes.addShaped(chGold, [[plAu, plAu, plAu], [plAu, chIron, plAu], [plAu, plAu, plAu]]);
recipes.addShaped(chGold, [[plAu, glass, plAu], [glass, chAg, glass], [plAu, glass, plAu]]);
recipes.addShaped(chObs,  [[plObs, plObs, plObs], [plObs, chGold, plObs], [plObs, plObs, plObs]]);

recipes.remove(<IronChest:woodCopperUpgrade>);
recipes.remove(<IronChest:woodIronUpgrade>);
recipes.remove(<IronChest:copperIronUpgrade>);
recipes.remove(<IronChest:copperSilverUpgrade>);
recipes.remove(<IronChest:ironGoldUpgrade>);
recipes.remove(<IronChest:silverGoldUpgrade>);
recipes.remove(<IronChest:goldDiamondUpgrade>);
recipes.remove(<IronChest:diamondCrystalUpgrade>);
recipes.remove(<IronChest:diamondObsidianUpgrade>);
recipes.addShaped(<IronChest:woodCopperUpgrade>,   [[plCu, plCu, plCu], [plCu, plank, plCu], [plCu, plCu, plCu]]);
recipes.addShaped(<IronChest:woodIronUpgrade>,     [[plFe, plFe, plFe], [plFe, plank, plFe], [plFe, plFe, plFe]]);
recipes.addShaped(<IronChest:copperIronUpgrade>,   [[plFe, glass, plFe], [glass, plCu, glass], [plFe, glass, plFe]]);
recipes.addShaped(<IronChest:copperSilverUpgrade>, [[agI, agI, agI], [agI, plCu, agI], [agI, agI, agI]]);
recipes.addShaped(<IronChest:ironGoldUpgrade>,     [[plAu, plAu, plAu], [plAu, plFe, plAu], [plAu, plAu, plAu]]);
recipes.addShaped(<IronChest:silverGoldUpgrade>,   [[plAu, glass, plAu], [glass, agI, glass], [plAu, glass, plAu]]);
