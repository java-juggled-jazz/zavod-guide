// ====================================================================================
// FLAN'S MOD: ORUZhIE IZ DETALEY, PATRONY IZ KOMPONENTOV
// Pakety Flan's ochishcheny (Flan/*_modpack.jar): ostalos' tol'ko soglasovannoe oruzhie, oruzheynye yashchiki ubrany,
// vse retsepty - zdes'. Detali i patrony - mod Zavod.
// DETALI: dlinnyy stvol (tokarka 4-3-3-3-3 + 2 stali), korotkiy stvol (tokarka 3-2-2-2-2 + stal' -> 2),
//   frezerovannaya korobka (5 stali + shesternya, vruchnuyu), shtampovannaya (prokatnyy stan, 4 stal'nye plastiny -> 3),
//   lozha (doski), opticheskiy pritsel (zheleznye plastiny + stekla).
// PATRONY: gil'za (med' molotom / stal' na transpozere s lakom), pulya (svinets molotom ili metalloformovshchik;
//   obolochechnaya - plotnik), kapsyul' (med' + sera + selitra), porokh (dymnyy ili bezdymnyy).
//   Vintovochnyy i pistoletnyy patron - na lyubom porokhe; promezhutochnyy (AK, M16, karabin M1) - tol'ko bezdymnyy.
// SNARYaZhENIE: obojmy do 8 patronov - vruchnuyu; magaziny 13-30 - konservnyy avtomat IC2
//   (korpus magazina = plastina, patrony zasypayutsya pachkoy).
// ====================================================================================

val hammer   = <IC2:itemToolForgeHammer>.anyDamage();
val steel    = <ore:ingotSteel>;
val plSteel  = <ore:plateSteel>;
val plIron   = <ore:plateIron>;
val plCopper = <ore:plateCopper>;
val gearSt   = <ore:gearSteel>;
val gearFe   = <ore:gearIron>;
val plank    = <ore:plankWood>;
val carbon   = <IC2:itemPartCarbonPlate>;
val nugFe    = <ore:nuggetIron>;
val nugSt    = <ore:nuggetSteel>;
val saltpeter = <Railcraft:dust:2>;

val BL = <zavod:barrel_long>;
val BS = <zavod:barrel_short>;
val RM = <zavod:receiver_milled>;
val RS = <zavod:receiver_stamped>;
val ST = <zavod:stock>;
val SC = <zavod:scope_optic>;

val casing = <zavod:casing_copper> | <zavod:casing_steel>;
val jacketed = <zavod:bullet_jacketed>;
val leadB = <zavod:bullet_lead>;
val primer = <zavod:primer>;
val powderAny = <minecraft:gunpowder> | <zavod:powder_smokeless>;
val smokeless = <zavod:powder_smokeless>;
val cR = <zavod:cartridge_rifle>;
val cI = <zavod:cartridge_intermediate>;
val cP = <zavod:cartridge_pistol>;
val cS = <zavod:shell_shotgun>;

// ---------------- DETALI ----------------
// Stvoly (Zavod 1.56.34, A10): srazu s tokarnogo stanka IC2 (patch LatheTransformer) - zheleznaya zagotovka s profilem
// 3-3-3-3-4 -> 1 dlinnyy stvol, 2-2-2-2-3 -> 2 korotkikh (v lyubuyu storonu). BYLO: tochyonaya zagotovka + stal' v verstake.
recipes.addShaped(RM, [[steel, steel, steel], [steel, gearFe, steel]]);
mods.railcraft.Rolling.addShaped(RS * 3, [[plSteel, plSteel], [plSteel, plSteel]]);
recipes.addShaped(ST, [[plank, plank], [<ore:stickWood>, plank]]);
// Opticheskiy pritsel (Zavod 1.38): kraft. Opticheskoe (svintsovoe, flintovoe) steklo - tigel'naya pech' Zavod na kokse (v mode):
// 2 stekla + svintsovaya pyl' -> 2 stekla (okis' svintsa - vysokiy pokazatel' prelomleniya). Linza - shlifovka u plotnika:
// steklo + pesok (abraziv) + zheleznaya pyl' (krokus, polirovka) + voda. Pritsel: 3 linzy (ob'ektiv, oborachivayushchaya,
// okulyar), stal'naya truba, latun'-med' kolets, setka iz pautiny (nit') - tak i delali do 1950-kh. Trofey ostayotsya.
// (Zavod 1.43.2) BYLO: pesok + svintsovaya pyl' - zanyato u TE (plavka pyli s peskom-flyusom), MT retsept propuskal.
// (Zavod 1.49) Nastoyaschiy flint-glass (Anglia, 1670-e, Ravenscroft): kremnezyom - tolchyonyy KREMEN', a ne pesok,
// plyus okis' svintsa. 2 kremnya + svintsovaya pyl' (TF ili IC2) -> 2 opticheskikh stekla. BYLO: 2 stekla + svinets.

mods.forestry.Carpenter.addRecipe(<zavod:lens>, [[<minecraft:sand>, <zavod:optical_glass>, <minecraft:sand>], [null, <ore:dustIron>, null]], <liquid:water> * 250, 100);
recipes.addShaped(SC, [[plSteel, plSteel, plSteel], [<zavod:lens>, <minecraft:string>, <zavod:lens>], [plCopper, <zavod:lens>, plCopper]]);

// ---------------- KOMPONENTY PATRONOV ----------------
recipes.addShapeless(<zavod:casing_copper> * 4, [plCopper, hammer]);
// Stal'nye gil'zy: glubokaya vytyazhka na presse so smazkoy (skipidar) - plotnik (Zavod 1.56.8; bylo v transpozere TE)
mods.forestry.Carpenter.addRecipe(<zavod:casing_steel> * 8, [[<ore:plateSteel>]], <liquid:turpentine> * 50, 60);
recipes.addShapeless(leadB * 4, [<ore:ingotLead>, hammer]);
mods.ic2.MetalFormer.addExtrudingRecipe(leadB * 8, <ore:ingotLead>);
mods.forestry.Carpenter.addRecipe(jacketed * 4, [[leadB, leadB, leadB], [leadB, plCopper, null]], 20);
recipes.addShapeless(primer * 8, [plCopper, <ore:dustSulfur>, saltpeter]);

// ---------------- PATRONY ----------------
// RUChNOE SNARYaZhENIE: porokh na glaz, s prosypaniem - 1 na patron (vintovochnyy 1.5). Patronnyy press (Zavod) - mernaya naveska, vchetvero ekonomnee.
recipes.addShapeless(cP * 2, [casing, casing, leadB, leadB, primer, primer, powderAny, powderAny]);
// Vintovochnyy patron - tol'ko bezdymnyy porokh (Mosin s 1891, Mauser s 1888 - srazu na piroksiline).
// Dymnyy porokh ostayotsya dlya pistoletnogo i ruzheynogo patrona.
// Pulya - tol'ko v obolochke (Zavod 1.37): na bezdymnom porokhe 800 m/s, golyy svinets sryvaet narezy i osvintsovyvaet stvol.
// Svintsovaya pulya - pistolet i drob' (skorost' nizkaya), obolochechnaya - vintovka i promezhutochnyy.
recipes.addShapeless(cR * 2, [casing, casing, jacketed, jacketed, primer, primer, smokeless, smokeless, smokeless]);
recipes.addShapeless(cI * 2, [casing, casing, jacketed, jacketed, primer, primer, smokeless, smokeless]);
recipes.addShapeless(cS * 2, [<minecraft:paper>, casing, casing, leadB, primer, primer, powderAny, powderAny]);

// ---------------- OBOJMY VRUChNUYu (do 8) ----------------
recipes.addShapeless(<flansmod:nagantAmmo>,    [cR, cR, cR, cR, cR, nugFe]);
recipes.addShapeless(<flansmod:kar98kAmmo>,    [cR, cR, cR, cR, cR, nugSt]);
recipes.addShapeless(<flansmod:m1GarandAmmo>,  [cR, cR, cR, cR, cR, cR, cR, cR, nugSt]);
recipes.addShapeless(<flansmod:webleyAmmo>,    [cP, cP, cP, cP, cP, cP]);
recipes.addShapeless(<flansmod:coltAmmo>,      [cP, cP, cP, cP, cP, cP, cP, nugSt]);
recipes.addShapeless(<flansmod:trenchgunAmmo>, [cS, cS, cS, cS, cS, cS, cS, cS]);

// ---------------- MAGAZINY: KONSERVNYY AVTOMAT IC2 (korpus + patrony pachkoy) ----------------
// Hi-Power i ego magazin snyaty (1.56.64): tekstura = Colt, dubl' -> skryty v NEI (nei-hide.zs)
mods.ic2.Canner.addBottleRecipe(<flansmod:ak47Ammo>,      plSteel, cI * 30);
// M16: magazin STANAG - alyuminiy; alyuminiya v sborke net (novykh resursov ne dobavlyaem) -> tonkostennyy korpus
// iz ochishchennogo zheleza IC2 (itemCasing:5). Ne plastina: "plastina + 30 promezhutochnykh" uzhe zanyato magazinom AK -
// konservnyy avtomat ne razlichaet dva retsepta s odinakovym vkhodom (BYLO: oshibka v minetweaker.log, flans.zs obryvalsya).
mods.ic2.Canner.addBottleRecipe(<flansmod:m16a4Ammo>,     <IC2:itemCasing:5>, cI * 30);
mods.ic2.Canner.addBottleRecipe(<flansmod:BARAmmo>,       plIron,  cR * 20);

// ---------------- GRANATY (Zavod 1.56.67): tol'ko prostye, bloki ne lomayut, mobam ne dayutsya ----------------
// Pak-papka Flan/zavod_grenades (model', tekstury, lang - v pake WW2). Zaryad - TNT (nitrovanie toluola v khimreaktore):
// 1 TNT na 4 granaty, kapsyul'-vosplamenitel' na kazhduyu. Mk2 - chugunnyy korpus (4 plastiny), kolotushka - ruchki.
recipes.addShaped(<flansmod:mk2Frag> * 4, [[plIron, primer, plIron], [primer, <minecraft:tnt>, primer], [plIron, primer, plIron]]);
recipes.addShaped(<flansmod:stielhandgranate> * 4, [[<ore:stickWood>, primer, <ore:stickWood>], [primer, <minecraft:tnt>, primer], [plIron, primer, plIron]]);

// ---------------- ARBALET (yarus -1) ----------------
recipes.addShaped(<flansmod:crossbow>, [[plank, (<ore:ingotIron> | <ore:ingotBronze>), plank], [<minecraft:string>, plank, <minecraft:string>], [null, plank, null]]);
recipes.addShaped(<flansmod:crossbowBolt> * 4, [[(<ore:nuggetIron> | <ore:nuggetBronze>)], [<ore:stickWood>], [<minecraft:feather>]]);
// Operenie iz bumagi vmesto pera (bumazhnye flazhki - kak na uchebnykh strelakh): tot zhe vykhod.
recipes.addShaped(<flansmod:crossbowBolt> * 4, [[(<ore:nuggetIron> | <ore:nuggetBronze>)], [<ore:stickWood>], [<minecraft:paper>]]);
recipes.addShaped(<minecraft:arrow> * 4, [[<minecraft:flint>], [<ore:stickWood>], [<minecraft:paper>]]);

// ---------------- YaRUS 0-1: rannee (vruchnuyu, frezerovannye korobki) ----------------
// Webley: revol'ver = stvol + rama + baraban. Rama kovanaya i frezerovannaya (frezerovannaya korobka), baraban - zheleznaya shesternya.
recipes.addShaped(<flansmod:webley>, [[BS, RM, gearFe], [null, null, plank]]);
recipes.addShaped(<flansmod:nagant>, [[BL, RM, ST]]);
recipes.addShaped(<flansmod:kar98k>, [[BL, RM, ST], [null, steel, gearFe]]);
recipes.addShaped(<flansmod:colt>, [[BS, RM, plank]]);
recipes.addShaped(<flansmod:trenchgun>, [[BL, RM, ST], [null, plank, null]]);
recipes.addShapeless(<flansmod:nagantSniper>, [<flansmod:nagant>, SC]);
recipes.addShapeless(<flansmod:kar98kSniper>, [<flansmod:kar98k>, SC]);

// ---------------- YaRUS 2: samozaryadnye i ruchnye pulemyoty (stal'nye shesterni) ----------------
recipes.addShaped(<flansmod:m1Garand>, [[BL, RM, ST], [gearSt, steel, gearSt]]);
// BAR (Zavod 1.37): po chertezhu (konstruktorskoe byuro ili nakhodka). Trofey v sundukakh ostayotsya.
// Stvol + frezerovannaya korobka + priklad, gazovyy porshen' i spusk - stal'nye shesterni, stal'naya plastina - kozhukh.
// Zavod 1.40: slozhnaya tekhnika - tol'ko v plotnike, chertyozh raskhoduetsya (kopiya - sin'ka, loot.zs)
mods.forestry.Carpenter.addRecipe(<flansmod:BAR>, [[BL, RM, ST], [gearSt, plSteel, gearSt], [steel, <zavod:blueprint_bar>, steel]], 200);

// ---------------- YaRUS 3: shtampovka i polimery ----------------
// Hi-Power snyat (1.56.64): dubl' Colt. Trench Gun - blizhniy boy: drob' gasnet za ~15 blokov (zavod.cfg weapons/bulletTicks)
// Avtomaty - tol'ko po chertezhu (byuro ili nakhodka).
// Zavod 1.40: slozhnaya tekhnika - tol'ko v plotnike, chertyozh raskhoduetsya (kopiya - sin'ka, loot.zs)
mods.forestry.Carpenter.addRecipe(<flansmod:ak47>, [[BL, RS, ST], [<zavod:blueprint_rifle>, gearSt, null]], 200);
// Zavod 1.40: slozhnaya tekhnika - tol'ko v plotnike, chertyozh raskhoduetsya (kopiya - sin'ka, loot.zs)
mods.forestry.Carpenter.addRecipe(<flansmod:m16a4>, [[BL, RS, carbon], [carbon, gearSt, <zavod:blueprint_rifle>]], 200);

// ---------------- PRITsELY, ZAShchITA, APTEChKI ----------------
// FORMA (Zavod 1.56.52, A17): armeyskaya forma WW2 (5 armiy x 4) - bez retseptov i skryta v NEI (nei-hide.zs): ona -
// trofey s gvardii i mobov MobGear. Svoya - neytral'naya, spetsnaz: pak Flan/zavod_uniform (shlem, bryuki, botinki;
// tekstury v modern-pake). Shit'yo - u plotnika iz parusiny (waxed_canvas, A14), nitki - shvy. BYLO: kaska = russianHelmet v verstake.
// Shlem: stal'naya kaska (4 lista) + podtulejnik iz parusiny.
mods.forestry.Carpenter.addRecipe(<flansmod:spetsnazHelmet>, [[plSteel, plSteel, plSteel], [plSteel, <zavod:waxed_canvas>, plSteel]], 60);
// Bryuki: 5 parusiny + nitki.
mods.forestry.Carpenter.addRecipe(<flansmod:spetsnazPants>, [[<zavod:waxed_canvas>, <minecraft:string>, <zavod:waxed_canvas>], [<zavod:waxed_canvas>, null, <zavod:waxed_canvas>], [<zavod:waxed_canvas>, null, null]], 60);
// Botinki: parusinovoe golenishche, kozhanaya podoshva.
mods.forestry.Carpenter.addRecipe(<flansmod:spetsnazBoots>, [[<zavod:waxed_canvas>, <minecraft:string>, <zavod:waxed_canvas>], [<minecraft:leather>, null, <minecraft:leather>]], 60);
// Bronezhilet spetsnaza (1.56.68): parusinovyy chekhol + 3 stal'nykh lista v karmanakh; trofey (loot.zs) ostaetsya.
mods.forestry.Carpenter.addRecipe(<flansmod:spetsnazBody>, [[<zavod:waxed_canvas>, null, <zavod:waxed_canvas>], [plSteel, <zavod:waxed_canvas>, plSteel], [<zavod:waxed_canvas>, plSteel, <zavod:waxed_canvas>]], 60);
// Aptechki bez zeliy: sterril'nye binty + rezinovyy zhgut + futlyar.
// Bint: 3 niti + 100 mB bioetanola (antiseptik, plotnik) -> 4, ili 3 niti v parovom avtoklave -> 4.
mods.forestry.Carpenter.addRecipe(<zavod:bandage> * 4, [[<minecraft:string>, <minecraft:string>, <minecraft:string>]], <liquid:bioethanol> * 100, 20);
// WW2: kozhanaya sumka, 4 binta, zhgut
recipes.addShaped(<flansmod:ww2MedKit>, [[<minecraft:leather>, <zavod:bandage>, <minecraft:leather>], [<zavod:bandage>, <IC2:itemRubber>, <zavod:bandage>], [<minecraft:leather>, <zavod:bandage>, <minecraft:leather>]]);
// Sovremennaya (IFAK): podsumok iz sinteticheskoy tkani (niti), 4 binta, zhgut, gemostatik - kaolin (glina),
// kak v Combat Gauze. Niti - lyubye: s ovets (veretenom) ili sinteticheskoe volokno iz nefti.
recipes.addShaped(<flansmod:mwMedKit>, [[<minecraft:string>, <zavod:bandage>, <minecraft:string>], [<zavod:bandage>, <IC2:itemRubber>, <zavod:bandage>], [<minecraft:clay_ball>, <zavod:bandage>, <minecraft:clay_ball>]]);

// --- Zavod 1.56.37 (A8): gil'zy i puli shtampuyutsya na prokatnom stane (vruchnuyu - molotom, kak bylo) ---
mods.railcraft.Rolling.addShaped(<zavod:casing_copper> * 4, [[plCopper]]);
mods.railcraft.Rolling.addShaped(leadB * 4, [[<ore:ingotLead>]]);
