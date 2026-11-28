// ====================================================================================
// NEFTEKhIMIYa (neft' BuildCraft kak syr'yo, a ne tol'ko toplivo). Dobycha i peregonka - oil.zs (1.56.30).
// Neftepregonnyy zavod BC bez retsepta (1.56.30, snyat v zavod.jar): benzin - s atmosfernoy kolonny i krekinga.
// Pobochnye produkty iz nefti i topliva - v plotnike Forestry.
// Balans syroy nefti v DVS - cherez config/buildcraft/main.cfg (sm. README).
// ====================================================================================

// --- Pekovoe uglevolokno: ugol'naya pyl', propitannaya neftyanym pekom ---
// BYLO tol'ko 4 ugol'noy pyli (= koksa) na 1 volokno. TEPER' vtoroy put': 2 pyli + 250 mB nefti -> 2 volokna.
mods.forestry.Carpenter.addRecipe(<IC2:itemPartCarbonFibre> * 2, [
    [<IC2:itemDust:2>, null, <IC2:itemDust:2>]
], <liquid:oil> * 250, 40);

// --- Trotil: sm. explosives.zs (azotnaya kislota + toplivo). ---

// --- Sinteticheskiy kauchuk: butadien-stirol'nyy (SKS) iz lyogkoy fraktsii ---
// Butadien i stirol poluchayut krekingom benzinovoy fraktsii (toplivo); emul'sionnaya polimerizatsiya
// na kanifol'nom myle dayot sinteticheskiy LATEKS. Vulkanizatsiya - v parovom avtoklave, kak u natural'nogo.
mods.forestry.Carpenter.addRecipe(<IC2:itemHarz> * 4, [
    [<zavod:rosin>]
], <liquid:fuel> * 500, 60);

// --- Sinteticheskiy kauchuk: butadien iz krekinga nefti - v khimreaktore Zavod (Zavod 1.56.8; bylo v transpozere TE) ---

// --- Sinteticheskoe volokno (akril): propilen iz nefti + azot iz selitry -> 8 nitey (= 2 shersti) ---
mods.forestry.Carpenter.addRecipe(<minecraft:string> * 8, [
    [<Railcraft:dust:2>]
], <liquid:oil> * 500, 60);

// --- Sinteticheskaya neft' iz uglya (gazifikatsiya parom + sintez Fishera-Tropsha, kak u Sasol) ---
// Ugol' + par -> sintez-gaz -> zhidkie uglevodorody. Konserviruyuschaya mashina IC2 kak reaktor.
// Zhyostkiy vykhod: 8 uglya + 1000 mB para -> 200 mB nefti (s 1 uglya ~25 mB). Neft' dal'she - v peregonku.
// V zavod.jar (Ic2Enrich): <liquid:oil> * 200, <liquid:steam> * 1000, <minecraft:coal> * 8 - MT ne otkatyvaet obogaschenie IC2, skript padal pri vkhode v mir
// V zavod.jar (Ic2Enrich): <liquid:oil> * 200, <liquid:ic2steam> * 1000, <minecraft:coal> * 8 - MT ne otkatyvaet obogaschenie IC2, skript padal pri vkhode v mir

// Sinteticheskiy kauchuk po Lebedevu (SSSR, 1932) - v khimreaktore Zavod (Zavod 1.56.8; bylo v transpozere TE).

// ====================================================================================
// POROKh
// Dymnyy (selitra + sera + drevesnyy ugol', verstak): 2 selitry + sera + ugol' -> 1 porokh (BYLO u Railcraft 2).
// Bezdymnyy (nitrotsellyuloza, plotnik) - woodworking.zs: te zhe 2 selitry dayut 4 porokha.
// Udalyon skrytyy retsept IC2 "redstoun + ugol'naya pyl' -> 3 porokha" (porokh bez selitry).
// Izvlechenie sery iz porokha v ekstraktore otklyucheno (config/ic2/extractor.ini).
// ====================================================================================
recipes.remove(<minecraft:gunpowder>);
recipes.addShapeless(<minecraft:gunpowder>, [<Railcraft:dust:2>, <Railcraft:dust:2>, <ore:dustSulfur>, <ore:dustCharcoal>]);
