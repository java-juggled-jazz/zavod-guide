// ====================================================================================
// BLOKOREZKA IC2 (Block Cutting Machine, blockMachine3:2) - TsEKh RASKROYa
// POChEMU: blokorezka delala to zhe, chto prokatka (blok -> 9 plastin) i pilorama. Svoey roli ne bylo.
// TEPER': tochnye ploskie detali, kotorye molotom i prokatom ne sdelat':
//   - plastiny lazurita (stal'noy disk) -> lapotronnye kristally
//   - plastiny obsidiana (almaznyy disk) -> futerovka korpusa reaktora
// Kompressor bol'she ne pressuet pyl' lazurita i obsidiana v plastiny (config/ic2/compressor.ini).
// Diski: zheleznyy - myagkie metally i derevo, stal'noy - zhelezo i lazurit, almaznyy - stal' i obsidian.
// ====================================================================================

val lapisPlate    = <IC2:itemPlates:8>;
val obsidianPlate = <IC2:itemPlates:7>;

// Lapotronnyy kristall: BYLO 6 pyli lazurita. TEPER' 6 tochno narezannykh plastin lazurita,
// tol'ko plotnik: kristall rastyat na UU-materii (BYLO: na distillyate).
recipes.remove(<IC2:itemBatLamaCrystal>);
mods.forestry.Carpenter.addRecipe(<IC2:itemBatLamaCrystal:27>, [
    [lapisPlate, <IC2:itemPartCircuitAdv>, lapisPlate],
    [lapisPlate, <IC2:itemBatCrystal:*>,   lapisPlate],
    [lapisPlate, <IC2:itemPartCircuitAdv>, lapisPlate]
], <liquid:ic2uumatter> * 5, 200);   // 5 mB UU ~ 15 mln EU

// Lopatka parovoy turbiny IC2 - NE blokorezka (pila ne delaet profil' lopatki), a KOVKA:
// plotnaya stal'naya plastina pod kuznechnym molotom. BYLO: 8 stal'nykh plastin + slitok na verstake.
recipes.remove(<IC2:itemSteamTurbineBlade>);
recipes.addShapeless(<IC2:itemSteamTurbineBlade>, [<IC2:itemDensePlates:5>, <IC2:itemToolForgeHammer>.anyDamage()]);
// Monel' (Zavod): 2 plastiny pod molotom -> lopatka - ne boitsya erozii mokrym parom, al'ternativa plotnoy stali
recipes.addShapeless(<IC2:itemSteamTurbineBlade>, [<zavod:plate_monel>, <zavod:plate_monel>, <IC2:itemToolForgeHammer>.anyDamage()]);
