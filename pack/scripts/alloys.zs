// ====================================================================================
// SPLAVY ZAVODA: tekhnicheskiy kremniy, elektrotekhnicheskaya stal', monel', medno-nikelevaya stal', babbit.
// Zamena splavov EnderIO (mod vyrezan). U kazhdogo splava - svoya rabota, oni ne vzaimozamenyaemy:
//   Kremniy: karbotermicheskoe vosstanovlenie kvartsevogo peska koksom (v real'nosti - dugovaya pech').
//   Elektrotekhnicheskaya stal': zhelezo + ~3% kremniya, bez ugleroda -> serdechniki transformatorov IC2.
//   MONEL' (1905): 2 nikelya + 1 med'. Ne rzhaveet v kislotakh i morskoy vode, derzhit eroziyu mokrym parom.
//     -> lopatki turbin (IC2, Zavod), futerovka kislotnoy apparatury.
//   MEDNO-NIKELEVAYa STAL' (korabel'naya HSLA): stal', legirovannaya monelem. Prochnee obychnoy, medlenno rzhaveet.
//     -> vsyo, chto derzhit davlenie i nagruzku: baki kotlov vysokogo davleniya, korpus reaktora vysokogo
//        davleniya, stupeni turbin Zavod. Ne nerzhaveyka: dlya nerzhaveyki nuzhen khrom, ego net.
//   Babbit: olovyannyy podshipnikovyy splav (olovo + med') -> vkladyshi-vtulki dlya vsekh shesteren i mekhanizmov.
// ====================================================================================
val hammer    = <ore:craftingToolForgeHammer>;

val monel     = <zavod:ingot_monel>;
val plMonel   = <zavod:plate_monel>;
val blMonel   = <zavod:block_monel>;
val alSteel   = <zavod:ingot_alloy_steel>;
val plAlSteel = <zavod:plate_alloy_steel>;
val blAlSteel = <zavod:block_alloy_steel>;

// --- Plavka (B1 chat 3; bylo - induktsionnaya plavil'nya TE): TIGEL'NAYa PECh' Zavod na KOKSE (retsepty - v mode,
// TileCrucible.ALLOYS): kremniy (2 peska + koks), elektrotekhnicheskaya stal' (4 zheleza + kremniy), monel'
// (2 nikelya + med', slitki ili pyl'), medno-nikelevaya stal' (4 stali + monel'), invar (metals.zs). ---

// Tigel'naya pech' (zavod.jar 1.22): shamotnaya kladka (blok koksovoy pechi), obozhzhyonnaya glina - tigel', topka,
// kolosniki iz kirpicha (1.56.90: bylo - zheleznaya reshyotka, stavila bronzu za zhelezo).
// 1.56.88: retsept vozvrashchyon - sluchayno snesyon v B1 chat 3 (d3a5ef1) vmeste s blokom TE.
recipes.addShaped(<zavod:crucible>, [
    [<Railcraft:machine.alpha:7>, <minecraft:hardened_clay>, <Railcraft:machine.alpha:7>],
    [<minecraft:brick_block>,     <minecraft:furnace>,       <minecraft:brick_block>],
    [<Railcraft:machine.alpha:7>, <minecraft:brick>,         <Railcraft:machine.alpha:7>]
]);

// --- Plastiny: molot vruchnuyu, prokatnyy stan, parovoy molot Zavod (sam po slovaryu rud) ---
recipes.addShapeless(plMonel, [monel, hammer]);
mods.railcraft.Rolling.addShaped(plMonel * 4, [[monel, monel], [monel, monel]]);
recipes.addShapeless(plAlSteel, [alSteel, hammer]);
mods.railcraft.Rolling.addShaped(plAlSteel * 4, [[alSteel, alSteel], [alSteel, alSteel]]);
// Alyuminiy (Zavod 1.42; 1.56.88 - vozvrashchyon, snesyon v d3a5ef1): molot i prokatnyy stan, kak u monelya.
recipes.addShapeless(<zavod:plate_aluminum>, [<ore:ingotAluminum>, hammer]);
mods.railcraft.Rolling.addShaped(<zavod:plate_aluminum> * 4, [[<ore:ingotAluminum>, <ore:ingotAluminum>], [<ore:ingotAluminum>, <ore:ingotAluminum>]]);

// --- Bloki: 9 slitkov <-> blok ---
recipes.addShaped(blMonel, [[monel, monel, monel], [monel, monel, monel], [monel, monel, monel]]);
recipes.addShapeless(monel * 9, [blMonel]);
recipes.addShaped(blAlSteel, [[alSteel, alSteel, alSteel], [alSteel, alSteel, alSteel], [alSteel, alSteel, alSteel]]);
recipes.addShapeless(alSteel * 9, [blAlSteel]);

// --- Rannie puti bez koksovogo tiglya (kak bronza): smes' pyley na verstake -> pech'. Pyl' - molotom iz droblyonoy rudy. ---
// Babbit plavitsya pri ~240 C, monel' - pri ~1300 C (nizhe zheleza): obe smesi berutsya obychnoy pech'yu.
// Retsepty shikhty (8 olova + 1 med' -> 9; 2 nikelya + 1 med' -> 3) i plavka v pechi - v samom Zavod (Java), ne zdes'.
// Babbit slitkami - v tigel'noy pechi (lyuboe toplivo).
