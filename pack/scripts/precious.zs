// ====================================================================================
// DRAGOTsENNYE METALLY: KISLOTNYY AFFINAZh
// Kisloty - iz khimtsekha (mashiny Zavod): zoloto - azotnaya kislota, platinoidy - tsarskaya vodka.
// (affinazh trebuet chistykh reaktivov: soli iz obychnoy vody zagryaznyayut metall).
//   Zoloto: azotnaya kislota rastvoryaet vsyo, krome zolota ("razdelenie kislotoy").
//   Platinoidy: sernaya kislota vyschelachivaet nikel' i med' iz anodnogo shlama, platinoidy ostayutsya
//     kontsentratom (tak rabotayut nikelevye zavody). Kontsentrat = platinovaya pyl' (zavod:dust_platinum, B1).
//   Iridiy: tyazhyolaya nerastvorimaya fraktsiya kontsentrata - otdelyaetsya v termotsentrifuge IC2
//     (9 pyli kontsentrata -> 8 platinovoy pyli + 1 oskolok iridiya (1/9 rudy) + samorodok zolota),
//     config/ic2/thermal_centrifuge.ini.
// Anodnyy shlam (zavod:anode_slime) - TOL'KO ot elektroliticheskogo rafinirovaniya medi i nikelya (nizhe).
// ====================================================================================

val anodeSlime = <zavod:anode_slime>;               // anodnyy shlam (mod Zavod)

// --- Zoloto: 3 droblyonoy zolotoy rudy + selitra + 1000 mB vody -> 4 zolotoy pyli ---
// (vanil'nyy put' IC2 cherez moyku i tsentrifugu dayot primerno 2.2 pyli s rudy, zdes' 2.67 - no tratitsya selitra)
mods.forestry.Carpenter.addRecipe(<IC2:itemDust:4> * 4, [
    [<ore:crushedGold>, <ore:crushedGold>, <ore:crushedGold>]
], <liquid:nitricacid> * 250, 80);

// --- Platinoidy: 2 anodnogo shlama + sera + 1000 mB vody -> 1 pyl' platinovogo kontsentrata ---
mods.forestry.Carpenter.addRecipe(<zavod:dust_platinum>, [
    [anodeSlime, anodeSlime]
], <liquid:aquaregia> * 500, 80);

// --- Elektroliticheskoe rafinirovanie: elektroliznaya vanna Zavod (B1 chat 3, v mode; bylo - plavil'nya TE) ---
// Mednyy kuporos: med' + sernaya kislota (sera + voda, kislota delaetsya na meste) -> elektrolit.
// (kuporos - iz khimicheskogo reaktora Zavod + kristallizatsiya, chem.zs)
// Med': 8 mednoy pyli + kuporos (podpitka elektrolita) -> 8 slitkov + 40% anodnogo shlama

// Nikel': 8 nikelevoy pyli + sera (sul'fatnyy elektrolit) -> 8 slitkov + 60% anodnogo shlama (noril'skaya skhema)

// ====================================================================================
// ShLAK: ODIN MATERIAL IZ LYuBOY METALLURGII
// Shlak IC2 (domennaya pech', konverter) - slovar' crystalSlag.
// Tsentrifugirovanie shlaka v zoloto i ugol'nuyu pyl' ubrano (config/ic2/thermal_centrifuge.ini).
// Primenenie kak v real'nosti: shlakotsement i tomasshlak (fosfornoe udobrenie).
// Shlakovata Zavod: 2 shlaka v tigel'noy pechi na kokse -> 2 (uteplitel' kotla VD, aparatury VD) - v mode.
// ====================================================================================
<ore:crystalSlag>.add(<IC2:itemSlag>);
// Shlakotsement -> stroitel'naya pena IC2 (vmesto 6 kamennoy pyli)
recipes.addShapeless(<IC2:itemPartCFPowder> * 2, [<ore:crystalSlag>, <ore:crystalSlag>, <minecraft:sand>, <minecraft:clay_ball>]);
// (Zavod 1.49.1) To zhe na zole-unose (pepel IC2): 4 pepla vmesto 2 shlakov. V tomasshlak i shlakovatu pepel ne idyot.
recipes.addShapeless(<IC2:itemPartCFPowder> * 2, [<IC2:itemDust2:3>, <IC2:itemDust2:3>, <IC2:itemDust2:3>, <IC2:itemDust2:3>, <minecraft:sand>, <minecraft:clay_ball>]);
// Tomasshlak: molotyy shlak -> udobrenie IC2
mods.ic2.Macerator.addRecipe(<IC2:itemFertilizer> * 2, <IC2:itemSlag>);

// ====================================================================================
// PLATINA V TEKhNIKE (real'nye primeneniya)
//   (nefteperegonnyy zavod BC s platinovym katalizatorom - ubran v 1.56.30: peregonka - kolonna Shukhova, oil.zs);
//   svechi zazhiganiya -> DVS BC (global.zs);
//   fil'ery dlya steklovolokna -> steklovolokonnyy kabel' IC2 (nizhe);
// ====================================================================================

// --- Steklovolokonnyy kabel' IC2: tol'ko termoionnyy fabrikator Forestry ---
// Rasplavlennoe steklo tyanut cherez platinovuyu fil'eru (slitok platiny - shablon, NE raskhoduetsya).
// Vruchnuyu bol'she ne kraftitsya. 1000 mB stekla + 2 energievoy pyli + serebryanaya pyl' -> 2 kabelya.
recipes.remove(<IC2:itemCable:9>);
mods.forestry.ThermionicFabricator.addCast(<IC2:itemCable:9> * 2, [
    [<IC2:itemDust2:2>, <ore:dustSilver>, <IC2:itemDust2:2>]
], 1000, <zavod:ingot_platinum>);
