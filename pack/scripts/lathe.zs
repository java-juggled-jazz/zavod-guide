// ====================================================================================
// TOKARNYY STANOK IC2 (Turning Table, blockMachine3:8) - TsEKh VALOV, VTULOK I KORONOK
// POChEMU: stanok byl nuzhen dlya dvukh-tryokh retseptov. A val, kolenval i burovaya koronka - eto tokarka.
// KAK: zheleznaya zagotovka (2 slitka + zheleznaya obolochka) stavitsya v stanok, rezets snimaet metall
//   po 5 segmentam. Profil' = radiusy segmentov ot 5 do 1. Stanok pitaetsya kinetikoy (kU).
//   Profil' khranitsya v NBT zagotovki (state: l0..l4). Nesimmetrichnye koronki - v lyubuyu storonu.
// Profili sborki:
//   3-3-3-3-3  val                -> zheleznyy val IC2 (dal'she - tsementatsiya v stal')
//   4-2-4-2-4  kolenval         -> DVS BC, torfyanoy i biogazovyy dvigateli Forestry,
//                                             kommercheskiy i promyshlennyy parovye dvigateli Railcraft
//   2-2-2-2-2  opravka (ne raskhoduetsya) -> 4 vtulki iz 4 olovyannykh plastin
//   4-4-3-2-1  burovaya koronka    -> bur IC2
//   4-3-2-1-1  almaznaya koronka   -> almaznyy bur (lategame.zs)
// Rannyaya igra ne blokiruetsya: vtulki vruchnuyu (1 iz 4 plastin), val iz bloka zheleza v metalloformovschike.
// ====================================================================================

// Val: tochyonaya zagotovka -> zheleznyy val IC2 (BYLO tol'ko blok zheleza v metalloformovschike = 9 slitkov)
recipes.addShapeless(<IC2:itemRecipePart:11>, [<IC2:itemTurningBlanks:209715>]);
// Stal'noy val: zheleznyy val -> domennaya pech' IC2 (tsementatsiya), config/ic2/blast_furnace.ini

// Bur IC2: BYLO 6 zheleznykh plastin + silovoy blok. TEPER' tochyonaya koronka + zheleznyy reduktor.
recipes.remove(<IC2:itemToolDrill>);
recipes.addShaped(<IC2:itemToolDrill>, [
    [null,            (<IC2:itemTurningBlanks:279329> | <IC2:itemTurningBlanks:74564>), null],
    [<ore:plateIron>, <ore:gearIron>,                 <ore:plateIron>],
    [<ore:plateIron>, <IC2:itemRecipePart:2>,         <ore:plateIron>]
]);
