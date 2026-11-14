// SVOI METALLY (Zavod 1.56.54, SPEC B1 chat 2): nikel', platina, serebro, invar vmesto Thermal Foundation.
// ====================================================================================
// Med', olovo, svinets, bronza - IC2 / Forestry / Railcraft (u nikh est' ruda, slitok, pyl', blok).
// Serebro: ruda - nasha (zavod:ore_silver, v svintsovykh zhilakh), slitok i pyl' - IC2, samorodok - nash.
// Nikel': ruda (pentlandit, v zheleznykh zhilakh), pyl', slitok, samorodok, blok - nashi.
// Platina: svoey rudy net - anodnyy shlam rafinirovaniya medi i nikelya -> kontsentrat (precious.zs).
// Invar (2 zheleza + 1 nikel'): slitok, shesternya, blok - nashi; plavka - tigel'naya pech' Zavod na kokse
// (do chata 3 B1), potom tigel'/svoya pech'.
// Slovar' rud - te zhe imena, chto u TF (ingotNickel, nuggetPlatinum, gearInvar...), registriruet zavod.jar.
// Mashiny Zavod iz slovarya vydayut nash predmet (Zavod.pick), dazhe poka TF stoit.
// Generatsiya rud - config/cofh/world/geology.json.
// ====================================================================================

val hammer   = <IC2:itemToolForgeHammer>.anyDamage();
val bushing  = <Railcraft:part.gear:3>;

val ingNi  = <zavod:ingot_nickel>;
val nugNi  = <zavod:nugget_nickel>;
val dustNi = <zavod:dust_nickel>;
val blkNi  = <zavod:block_nickel>;
val ingPt  = <zavod:ingot_platinum>;
val nugPt  = <zavod:nugget_platinum>;
val dustPt = <zavod:dust_platinum>;
val blkPt  = <zavod:block_platinum>;
val nugAg  = <zavod:nugget_silver>;
val ingAg  = <IC2:itemIngot:6>;
val ingInv = <zavod:ingot_invar>;
val blkInv = <zavod:block_invar>;
val gearInv = <zavod:gear_invar>;

// --- Bloki: 9 slitkov <-> blok ---
recipes.addShaped(blkNi, [[ingNi, ingNi, ingNi], [ingNi, ingNi, ingNi], [ingNi, ingNi, ingNi]]);
recipes.addShapeless(ingNi * 9, [blkNi]);
recipes.addShaped(blkPt, [[ingPt, ingPt, ingPt], [ingPt, ingPt, ingPt], [ingPt, ingPt, ingPt]]);
recipes.addShapeless(ingPt * 9, [blkPt]);
recipes.addShaped(blkInv, [[ingInv, ingInv, ingInv], [ingInv, ingInv, ingInv], [ingInv, ingInv, ingInv]]);
recipes.addShapeless(ingInv * 9, [blkInv]);

// --- Samorodki: slitok <-> 9 ---
recipes.addShapeless(nugNi * 9, [ingNi]);
recipes.addShapeless(ingNi, [nugNi, nugNi, nugNi, nugNi, nugNi, nugNi, nugNi, nugNi, nugNi]);
recipes.addShapeless(nugPt * 9, [ingPt]);
recipes.addShapeless(ingPt, [nugPt, nugPt, nugPt, nugPt, nugPt, nugPt, nugPt, nugPt, nugPt]);
recipes.addShapeless(nugAg * 9, [ingAg]);
recipes.addShapeless(ingAg, [nugAg, nugAg, nugAg, nugAg, nugAg, nugAg, nugAg, nugAg, nugAg]);

// --- Pech': pyl' -> slitok (kak bylo u TF); ruda serebra -> slitok IC2, nikelya -> slitok ---
furnace.addRecipe(ingNi, dustNi);
furnace.addRecipe(ingPt, dustPt);
furnace.addRecipe(ingNi, <zavod:ore_nickel>);
furnace.addRecipe(ingAg, <zavod:ore_silver>);

// --- Invar: tigel'naya pech' Zavod na kokse (v mode, TileCrucible): 2 zheleza + 1 nikel' -> 3, slitki ili pyl' ---

// --- Invarovaya shesternya: standart gears.zs - plastin invara net, kuyom slitki na vtulke ---
recipes.addShaped(gearInv, [[hammer, <ore:ingotInvar>, null], [<ore:ingotInvar>, bushing, <ore:ingotInvar>], [null, <ore:ingotInvar>, null]]);
mods.railcraft.Rolling.addShaped(gearInv, [[null, <ore:ingotInvar>, null], [<ore:ingotInvar>, bushing, <ore:ingotInvar>], [null, <ore:ingotInvar>, null]]);


