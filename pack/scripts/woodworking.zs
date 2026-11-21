// ====================================================================================
// DEREVOOBRABOTKA: RUKAMI PLOKhO, STANKOM KhOROShO
// POChEMU: toporom iz brevna 4 doski - eto skazka. Ruchnoy raspil - polovina v struzhku.
// TEPER': vruchnuyu brevno -> 2 doski, 2 doski -> 2 palki. Nozhovkoy (zavod:handsaw) - 4 i 4. Pilorama Zavod na valu - 5.
//   Blokorezka IC2: brevno -> 8 dosok (tonkiy propil), 2 doski -> 6 palok (config/ic2/block_cutter.ini).
// Opilki = drevesnaya massa Forestry (pilorama Zavod): bumaga, bezdymnyy porokh (nitrotsellyuloza), biogaz.
// Derev'ya Extra Trees - posle jar Binnie.
// ====================================================================================

// --- Vanil'nye doski: 2 s brevna ---
recipes.remove(<minecraft:planks:*>);
recipes.addShapeless(<minecraft:planks:0> * 2, [<minecraft:log:0>]);
recipes.addShapeless(<minecraft:planks:1> * 2, [<minecraft:log:1>]);
recipes.addShapeless(<minecraft:planks:2> * 2, [<minecraft:log:2>]);
recipes.addShapeless(<minecraft:planks:3> * 2, [<minecraft:log:3>]);
recipes.addShapeless(<minecraft:planks:4> * 2, [<minecraft:log2:0>]);
recipes.addShapeless(<minecraft:planks:5> * 2, [<minecraft:log2:1>]);

// --- Palki: 2 doski -> 2 palki (bylo 4) ---
recipes.remove(<minecraft:stick>);
recipes.addShaped(<minecraft:stick> * 2, [[<ore:plankWood>], [<ore:plankWood>]]);

// ====================================================================================
// OPILKI
// ====================================================================================
// Drevesnaya massa Forestry (-> bumaga, karton, nitrotsellyuloza, biogaz) - TOL'KO s pilorammy Zavod (B1 chat 3:
// opilki TE ushli, svoego predmeta net). Massa iz brevna v plotnike (Forestry) - snyata.
mods.forestry.Carpenter.removeRecipe(<Forestry:woodPulp>);
// Bezdymnyy porokh (A12, 1.56.44) - tol'ko v khimreaktore Zavod (v mode, ne zdes'):
//   nitrovanie: opilki/khlopok + nitruyuschaya smes' (ili odna azotnaya) + protochnaya voda -> nitrotsellyuloza;
//   kordit: 4 nitrotsellyulozy + 250 atsetona + par -> 5 porokha + 150 atsetona nazad (rastvoritel' otgonyayut).
// Nitrovanie so l'dom v plotnike i zhelatinizatsiya spirtom - ubrany (odin put' na epokhu; efira net).

// ====================================================================================
// NOZhOVKA (zavod:handsaw, 128 raspilov) - RUCHNAYa PILA VMESTO TOPORA
// Toporom brevno raskalyvayut (2 doski), piloy - raspilivayut (4). Kazhdyy raspil - minus 1 prochnost'.
// Lestnitsa vykhoda: ruki 2 -> nozhovka 4 -> pilorama Zavod 5 -> blokorezka IC2 8. Palki: ruki 2 -> nozhovka 4 -> blokorezka 6.
// Polotno - 2 zheleznye plastiny, ruchka - palka.
// ====================================================================================
recipes.addShaped(<zavod:handsaw>, [[<ore:plateIron>, <ore:plateIron>, <ore:stickWood>]]);
val saw = <zavod:handsaw>.anyDamage().transformDamage();

recipes.addShapeless(<minecraft:planks:0> * 4, [<minecraft:log:0>, saw]);
recipes.addShapeless(<minecraft:planks:1> * 4, [<minecraft:log:1>, saw]);
recipes.addShapeless(<minecraft:planks:2> * 4, [<minecraft:log:2>, saw]);
recipes.addShapeless(<minecraft:planks:3> * 4, [<minecraft:log:3>, saw]);
recipes.addShapeless(<minecraft:planks:4> * 4, [<minecraft:log2:0>, saw]);
recipes.addShapeless(<minecraft:planks:5> * 4, [<minecraft:log2:1>, saw]);

// Palki: 2 doski + nozhovka -> 4 (rukami 2)
recipes.addShapeless(<minecraft:stick> * 4, [<ore:plankWood>, <ore:plankWood>, saw]);

// DSP -> srazu paneli BiblioCraft (B1 chat 3; plita TE ushla): 8 drevesnoy massy + kanifol' -> 4 paneli.
recipes.addShaped(<BiblioCraft:item.FramingSheet> * 4, [
    [<Forestry:woodPulp>, <Forestry:woodPulp>, <Forestry:woodPulp>],
    [<Forestry:woodPulp>, <zavod:rosin>,       <Forestry:woodPulp>],
    [<Forestry:woodPulp>, <Forestry:woodPulp>, <Forestry:woodPulp>]
]);

// --- (V KONTsE FAYLA: esli ID Forestry ne sovpadut, upadyot tol'ko etot blok) Doski Forestry (tip dereva = metadannye 0..28, obychnye i ognestoykie): 2 s brevna ---
recipes.remove(<Forestry:planks:*>);
recipes.remove(<Forestry:planksFireproof:*>);
recipes.addShapeless(<Forestry:planks:0> * 2, [<Forestry:logs:0>]);
recipes.addShapeless(<Forestry:planks:1> * 2, [<Forestry:logs:1>]);
recipes.addShapeless(<Forestry:planks:2> * 2, [<Forestry:logs:2>]);
recipes.addShapeless(<Forestry:planks:3> * 2, [<Forestry:logs:3>]);
recipes.addShapeless(<Forestry:planks:4> * 2, [<Forestry:logs:4>]);
recipes.addShapeless(<Forestry:planks:5> * 2, [<Forestry:logs:5>]);
recipes.addShapeless(<Forestry:planks:6> * 2, [<Forestry:logs:6>]);
recipes.addShapeless(<Forestry:planks:7> * 2, [<Forestry:logs:7>]);
recipes.addShapeless(<Forestry:planks:8> * 2, [<Forestry:logs:8>]);
recipes.addShapeless(<Forestry:planks:9> * 2, [<Forestry:logs:9>]);
recipes.addShapeless(<Forestry:planks:10> * 2, [<Forestry:logs:10>]);
recipes.addShapeless(<Forestry:planks:11> * 2, [<Forestry:logs:11>]);
recipes.addShapeless(<Forestry:planks:12> * 2, [<Forestry:logs:12>]);
recipes.addShapeless(<Forestry:planks:13> * 2, [<Forestry:logs:13>]);
recipes.addShapeless(<Forestry:planks:14> * 2, [<Forestry:logs:14>]);
recipes.addShapeless(<Forestry:planks:15> * 2, [<Forestry:logs:15>]);
recipes.addShapeless(<Forestry:planks:16> * 2, [<Forestry:logs:16>]);
recipes.addShapeless(<Forestry:planks:17> * 2, [<Forestry:logs:17>]);
recipes.addShapeless(<Forestry:planks:18> * 2, [<Forestry:logs:18>]);
recipes.addShapeless(<Forestry:planks:19> * 2, [<Forestry:logs:19>]);
recipes.addShapeless(<Forestry:planks:20> * 2, [<Forestry:logs:20>]);
recipes.addShapeless(<Forestry:planks:21> * 2, [<Forestry:logs:21>]);
recipes.addShapeless(<Forestry:planks:22> * 2, [<Forestry:logs:22>]);
recipes.addShapeless(<Forestry:planks:23> * 2, [<Forestry:logs:23>]);
recipes.addShapeless(<Forestry:planks:24> * 2, [<Forestry:logs:24>]);
recipes.addShapeless(<Forestry:planks:25> * 2, [<Forestry:logs:25>]);
recipes.addShapeless(<Forestry:planks:26> * 2, [<Forestry:logs:26>]);
recipes.addShapeless(<Forestry:planks:27> * 2, [<Forestry:logs:27>]);
recipes.addShapeless(<Forestry:planks:28> * 2, [<Forestry:logs:28>]);
recipes.addShapeless(<Forestry:planksFireproof:0> * 2, [<Forestry:logsFireproof:0>]);
recipes.addShapeless(<Forestry:planksFireproof:1> * 2, [<Forestry:logsFireproof:1>]);
recipes.addShapeless(<Forestry:planksFireproof:2> * 2, [<Forestry:logsFireproof:2>]);
recipes.addShapeless(<Forestry:planksFireproof:3> * 2, [<Forestry:logsFireproof:3>]);
recipes.addShapeless(<Forestry:planksFireproof:4> * 2, [<Forestry:logsFireproof:4>]);
recipes.addShapeless(<Forestry:planksFireproof:5> * 2, [<Forestry:logsFireproof:5>]);
recipes.addShapeless(<Forestry:planksFireproof:6> * 2, [<Forestry:logsFireproof:6>]);
recipes.addShapeless(<Forestry:planksFireproof:7> * 2, [<Forestry:logsFireproof:7>]);
recipes.addShapeless(<Forestry:planksFireproof:8> * 2, [<Forestry:logsFireproof:8>]);
recipes.addShapeless(<Forestry:planksFireproof:9> * 2, [<Forestry:logsFireproof:9>]);
recipes.addShapeless(<Forestry:planksFireproof:10> * 2, [<Forestry:logsFireproof:10>]);
recipes.addShapeless(<Forestry:planksFireproof:11> * 2, [<Forestry:logsFireproof:11>]);
recipes.addShapeless(<Forestry:planksFireproof:12> * 2, [<Forestry:logsFireproof:12>]);
recipes.addShapeless(<Forestry:planksFireproof:13> * 2, [<Forestry:logsFireproof:13>]);
recipes.addShapeless(<Forestry:planksFireproof:14> * 2, [<Forestry:logsFireproof:14>]);
recipes.addShapeless(<Forestry:planksFireproof:15> * 2, [<Forestry:logsFireproof:15>]);
recipes.addShapeless(<Forestry:planksFireproof:16> * 2, [<Forestry:logsFireproof:16>]);
recipes.addShapeless(<Forestry:planksFireproof:17> * 2, [<Forestry:logsFireproof:17>]);
recipes.addShapeless(<Forestry:planksFireproof:18> * 2, [<Forestry:logsFireproof:18>]);
recipes.addShapeless(<Forestry:planksFireproof:19> * 2, [<Forestry:logsFireproof:19>]);
recipes.addShapeless(<Forestry:planksFireproof:20> * 2, [<Forestry:logsFireproof:20>]);
recipes.addShapeless(<Forestry:planksFireproof:21> * 2, [<Forestry:logsFireproof:21>]);
recipes.addShapeless(<Forestry:planksFireproof:22> * 2, [<Forestry:logsFireproof:22>]);
recipes.addShapeless(<Forestry:planksFireproof:23> * 2, [<Forestry:logsFireproof:23>]);
recipes.addShapeless(<Forestry:planksFireproof:24> * 2, [<Forestry:logsFireproof:24>]);
recipes.addShapeless(<Forestry:planksFireproof:25> * 2, [<Forestry:logsFireproof:25>]);
recipes.addShapeless(<Forestry:planksFireproof:26> * 2, [<Forestry:logsFireproof:26>]);
recipes.addShapeless(<Forestry:planksFireproof:27> * 2, [<Forestry:logsFireproof:27>]);
recipes.addShapeless(<Forestry:planksFireproof:28> * 2, [<Forestry:logsFireproof:28>]);
// Doski Forestry nozhovkoy (posle bloka Forestry vyshe)
recipes.addShapeless(<Forestry:planks:0> * 4, [<Forestry:logs:0>, saw]);
recipes.addShapeless(<Forestry:planks:1> * 4, [<Forestry:logs:1>, saw]);
recipes.addShapeless(<Forestry:planks:2> * 4, [<Forestry:logs:2>, saw]);
recipes.addShapeless(<Forestry:planks:3> * 4, [<Forestry:logs:3>, saw]);
recipes.addShapeless(<Forestry:planks:4> * 4, [<Forestry:logs:4>, saw]);
recipes.addShapeless(<Forestry:planks:5> * 4, [<Forestry:logs:5>, saw]);
recipes.addShapeless(<Forestry:planks:6> * 4, [<Forestry:logs:6>, saw]);
recipes.addShapeless(<Forestry:planks:7> * 4, [<Forestry:logs:7>, saw]);
recipes.addShapeless(<Forestry:planks:8> * 4, [<Forestry:logs:8>, saw]);
recipes.addShapeless(<Forestry:planks:9> * 4, [<Forestry:logs:9>, saw]);
recipes.addShapeless(<Forestry:planks:10> * 4, [<Forestry:logs:10>, saw]);
recipes.addShapeless(<Forestry:planks:11> * 4, [<Forestry:logs:11>, saw]);
recipes.addShapeless(<Forestry:planks:12> * 4, [<Forestry:logs:12>, saw]);
recipes.addShapeless(<Forestry:planks:13> * 4, [<Forestry:logs:13>, saw]);
recipes.addShapeless(<Forestry:planks:14> * 4, [<Forestry:logs:14>, saw]);
recipes.addShapeless(<Forestry:planks:15> * 4, [<Forestry:logs:15>, saw]);
recipes.addShapeless(<Forestry:planks:16> * 4, [<Forestry:logs:16>, saw]);
recipes.addShapeless(<Forestry:planks:17> * 4, [<Forestry:logs:17>, saw]);
recipes.addShapeless(<Forestry:planks:18> * 4, [<Forestry:logs:18>, saw]);
recipes.addShapeless(<Forestry:planks:19> * 4, [<Forestry:logs:19>, saw]);
recipes.addShapeless(<Forestry:planks:20> * 4, [<Forestry:logs:20>, saw]);
recipes.addShapeless(<Forestry:planks:21> * 4, [<Forestry:logs:21>, saw]);
recipes.addShapeless(<Forestry:planks:22> * 4, [<Forestry:logs:22>, saw]);
recipes.addShapeless(<Forestry:planks:23> * 4, [<Forestry:logs:23>, saw]);
recipes.addShapeless(<Forestry:planks:24> * 4, [<Forestry:logs:24>, saw]);
recipes.addShapeless(<Forestry:planks:25> * 4, [<Forestry:logs:25>, saw]);
recipes.addShapeless(<Forestry:planks:26> * 4, [<Forestry:logs:26>, saw]);
recipes.addShapeless(<Forestry:planks:27> * 4, [<Forestry:logs:27>, saw]);
recipes.addShapeless(<Forestry:planks:28> * 4, [<Forestry:logs:28>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:0> * 4, [<Forestry:logsFireproof:0>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:1> * 4, [<Forestry:logsFireproof:1>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:2> * 4, [<Forestry:logsFireproof:2>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:3> * 4, [<Forestry:logsFireproof:3>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:4> * 4, [<Forestry:logsFireproof:4>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:5> * 4, [<Forestry:logsFireproof:5>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:6> * 4, [<Forestry:logsFireproof:6>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:7> * 4, [<Forestry:logsFireproof:7>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:8> * 4, [<Forestry:logsFireproof:8>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:9> * 4, [<Forestry:logsFireproof:9>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:10> * 4, [<Forestry:logsFireproof:10>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:11> * 4, [<Forestry:logsFireproof:11>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:12> * 4, [<Forestry:logsFireproof:12>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:13> * 4, [<Forestry:logsFireproof:13>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:14> * 4, [<Forestry:logsFireproof:14>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:15> * 4, [<Forestry:logsFireproof:15>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:16> * 4, [<Forestry:logsFireproof:16>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:17> * 4, [<Forestry:logsFireproof:17>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:18> * 4, [<Forestry:logsFireproof:18>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:19> * 4, [<Forestry:logsFireproof:19>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:20> * 4, [<Forestry:logsFireproof:20>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:21> * 4, [<Forestry:logsFireproof:21>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:22> * 4, [<Forestry:logsFireproof:22>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:23> * 4, [<Forestry:logsFireproof:23>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:24> * 4, [<Forestry:logsFireproof:24>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:25> * 4, [<Forestry:logsFireproof:25>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:26> * 4, [<Forestry:logsFireproof:26>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:27> * 4, [<Forestry:logsFireproof:27>, saw]);
recipes.addShapeless(<Forestry:planksFireproof:28> * 4, [<Forestry:logsFireproof:28>, saw]);

// (V SAMOM KONTsE: esli ID BiblioCraft ne sovpadut, upadyot tol'ko etot blok)
// --- BiblioCraft (ID - "item.<imya>": tak mod registriruet svoi predmety) ---
// Vechnaya pila BiblioCraft (ne iznashivaetsya) ubrana: paneli i reyki teper' tozhe nozhovkoy.
recipes.remove(<BiblioCraft:item.FramingSaw>);
recipes.remove(<BiblioCraft:item.FramingSheet>);
recipes.remove(<BiblioCraft:item.FramingBoard>);
recipes.addShapeless(<BiblioCraft:item.FramingSheet> * 2, [<ore:plankWood>, saw]);
recipes.addShapeless(<BiblioCraft:item.FramingBoard> * 2, [<BiblioCraft:item.FramingSheet>, saw]);
