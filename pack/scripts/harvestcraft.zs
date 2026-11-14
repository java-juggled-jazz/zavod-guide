// ====================================================================================
// PAM'S HARVESTCRAFT: EDA - DA, DOBYCHA IZ NICHEGO - NET
// Sol' (config/harvestcraft.cfg): generatsiya i "sol' iz vody v kastryule" vyklyucheny. Sol' Zavod (solevarnya,
//   kamennaya sol') uzhe v slovare foodSalt / itemSalt / dustSalt - kulinariya Pam's beryot eyo napryamuyu (chem.zs).
// Rynok i lovushka na zhivotnykh vyrezany: zhivotnye za izumrudy i myaso/kozha bez edinogo moba.
// Rybolovnaya lovushka (versha) OSTAVLENA: morskie produkty Pam's (kraby, krevetki, kal'mary...) - tol'ko iz neyo.
//   Rabotaet v vode, nazhivka - nit' + 3 syroy ryby.
// Khlopok - nastoyaschee volokno: pryadut veretenom, kak i sherst' (BYLO: 3 khlopka -> 2 niti na verstake).
// Khlopok - pochti chistaya tsellyuloza: piroksilin ("khlopkovyy porokh", Shyonbeyn 1846) vykhodit luchshe, chem iz opilok.
// Masla Pam's (pressovka) - v semennoe maslo Forestry; sakharistye kul'tury - v brozhenie na bioetanol.
// Fayl idyot po alfavitu RAN'SHE zavod-machines.zs: tam posle udaleniya zanovo dobavlyayutsya niti iz shersti.
// ====================================================================================

val spindle = <zavod:spindle>.anyDamage().transformDamage();
val cotton  = <harvestcraft:cottonItem>;

// --- Niti: vse retsepty nitey (v sborke eto tol'ko khlopok Pam's) ubrany, dal'she - veretenom ---
recipes.remove(<minecraft:string>);
recipes.addShapeless(<minecraft:string> * 3, [cotton, cotton, cotton, spindle]);
// Kandleberri -> khlopok (yagody ne volokno) i "2 khlopka -> 2 khlopka" - ubrany. Khlopok rastyot na gryadke.
recipes.remove(cotton);

// --- Piroksilin iz khlopka - v khimreaktore Zavod (3 khlopka -> 6 na smesi, 3 na odnoy azotnoy); plotnik so l'dom ubran (A12) ---

// --- Rynok i lovushka na zhivotnykh ---
recipes.remove(<harvestcraft:market>);
recipes.remove(<harvestcraft:animaltrap>);
// --- Versha: karkas iz prut'ev, setka iz nitey, sadok (sunduk) dlya ulova. BYLO: udochka v retsepte. ---
recipes.remove(<harvestcraft:fishtrap>);
recipes.addShaped(<harvestcraft:fishtrap>, [
    [<ore:stickWood>,     <minecraft:string>, <ore:stickWood>],
    [<minecraft:string>, <minecraft:chest>,  <minecraft:string>],
    [<ore:stickWood>,     <minecraft:string>, <ore:stickWood>]
]);

// --- Masla i sakhar v promyshlennost' ---
// Olivkovoe maslo Pam's (iz oliv, podsolnechnika, kunzhuta, oreshkov) -> semennoe maslo Forestry: smazka, lak, biodizel'.
mods.forestry.Squeezer.addRecipe(<liquid:seedoil> * 150, 8, [<harvestcraft:oliveoilItem>]);
// Sakharnaya svyokla, kukuruza, vinograd -> brozhenie -> biomassa -> peregonnyy kub -> bioetanol.
mods.forestry.Fermenter.addRecipe(<liquid:biomass>, <harvestcraft:beetItem>, <liquid:water>, 200, 1.0);
mods.forestry.Fermenter.addRecipe(<liquid:biomass>, <harvestcraft:cornItem>, <liquid:water>, 200, 1.0);
mods.forestry.Fermenter.addRecipe(<liquid:biomass>, <harvestcraft:grapeItem>, <liquid:water>, 150, 1.0);

// ====================================================================================
// KOFE: ODIN NA DVA MODA (Zavod 1.50). Semena kofe Pam's sazhayut kofe IC2 na zherdyakh (zavod.jar, PamCrops),
// zyorna IC2 - v slovare cropCoffee (godyatsya vo vse retsepty Pam's), zyorna Pam's - v kofeynyy poroshok IC2:
// rukami 1 -> 1 (kak u IC2), v drobilke - config/ic2/macerator.ini (OreDict:cropCoffee -> 3 poroshka).
// Ostal'nye kul'tury Pam's - svoi kul'tury IC2 (61): skreschivanie, staty, kombayn IC2.
// ====================================================================================
recipes.addShapeless(<IC2:itemCofeePowder>, [<harvestcraft:coffeebeanItem>]);

// ====================================================================================
// VOSK (Zavod 1.56.13): pchelinyy vosk Forestry i vosk Pam's (pchelinyy i pressovannyy) - odno i to zhe.
// Slovar': itemBeeswax (Forestry i nashi retsepty) <-> materialPressedwax (retsepty Pam's).
// Sota Pam's v tsentrifuge Forestry -> vosk, kak sota Forestry.
// ====================================================================================
<ore:itemBeeswax>.add(<Forestry:beeswax>);
<ore:itemBeeswax>.add(<harvestcraft:beeswaxItem>);
<ore:itemBeeswax>.add(<harvestcraft:waxItem>);
<ore:materialPressedwax>.add(<Forestry:beeswax>);
mods.forestry.Centrifuge.addRecipe(20, <harvestcraft:waxcombItem>, [<Forestry:beeswax>], [100]);

// ====================================================================================
// FERMA: MASLA I VOLOKNO (A14, 1.56.46). L'na, konopli, rapsa i rakushek u Pam's net - berem to, chto rastyot:
// podsolnukh, soya, arakhis, khlopok. Maslo - semennoe Forestry (seedoil); v ostatke - zhmykh (mul'cha: kompost, selitryanitsa).
// Mylo i glitserin ne delaem (potrebiteley net; glitserin - tol'ko v nitroglitserin, a ego v sborke net).
// ====================================================================================
// --- Maslo na skvizere: semechki ~40% masla, arakhis ~45, soya ~20, khlopkovoe semya ~18 (masloboynya 1860-kh) ---
mods.forestry.Squeezer.addRecipe(<liquid:seedoil> * 50, <Forestry:mulch> % 20, [<harvestcraft:sunflowerseedsItem>], 20);
mods.forestry.Squeezer.addRecipe(<liquid:seedoil> * 50, <Forestry:mulch> % 20, [<harvestcraft:peanutItem>], 20);
mods.forestry.Squeezer.addRecipe(<liquid:seedoil> * 25, <Forestry:mulch> % 30, [<harvestcraft:soybeanItem>], 20);
mods.forestry.Squeezer.addRecipe(<liquid:seedoil> * 20, <Forestry:mulch> % 30, [<harvestcraft:cottonseedItem>], 20);
// --- Promaslennaya parusina (oliva, klyonka): tkanyy khlopok, propitannyy maslom; ta zhe zavod:waxed_canvas, chto na voske ---
mods.forestry.Carpenter.addRecipe(<zavod:waxed_canvas> * 2, [
    [<harvestcraft:wovencottonItem>, <harvestcraft:wovencottonItem>]
], <liquid:seedoil> * 100, 40);
// --- Shkiv na khlopchatom privodnom remne (tkanyy remen', propitannyy maslom, 1880-e) - put' bez korov; kozhanyy - na verstake ---
mods.forestry.Carpenter.addRecipe(<zavod:pulley>, [
    [null,            <harvestcraft:wovencottonItem>, null],
    [<ore:plankWood>, <zavod:shaft>,                  <ore:plankWood>],
    [null,            <harvestcraft:wovencottonItem>, null]
], <liquid:seedoil> * 50, 40);
