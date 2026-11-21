// SKLAD: YaShchIKI STORAGE DRAWERS (Zavod 1.56.29, SPEC A4a - gotovyy mod vmesto svoey mebeli)
// ====================================================================================
// Shkaf s yaschikami: 1/2/4 yaschika, odin vid predmeta na yaschik, ikonka i chislo na fasade, klik - polozhit',
//   dvoynoy klik - vsyo iz inventarya, truby/voronki s lyuboy storony. Derevyannye - kak v mode (doski + sunduk).
// Yomkost' (config/StorageDrawers.cfg): derevo 8 stopok na blok (1x1 - 8, 1x2 - 4+4, 2x2 - 2x4; polovinki - vdvoe men'she),
//   uluchsheniya: zhelezo x2 (16 - "stal' 16" iz SPEC), zoloto x3, obsidian x5. Almaznoe i izumrudnoe - vyrezany.
// Uluchsheniya - na plastinakh (kak sunduki Iron Chests), a ne na slitkakh.
// Kontroller (kontorka) - setevoy vvod/vyvod na vse yaschiki v radiuse 12: plotnik, bez almaza.
//   Okna poiska net (eto ne AE) - vvod v kontroller raskladyvaet po yaschikam, kak trubka.
// Szhimayuschiy shkaf (samorodki/slitki/bloki) - plotnik, bez porshnya: rychazhnyy press na bronzovykh shesternyakh.
// Tvorcheskoe uluchshenie vyklyucheno v konfige.
// ====================================================================================

val plIron   = <ore:plateIron>;
val plSteel  = <ore:plateSteel>;
val plGold   = <ore:plateGold>;
val plObs    = <IC2:itemPlates:7>;
val gBronze  = <ore:gearBronze>;
val stick    = <ore:stickWood>;
val drawer   = <ore:drawerBasic>;
val tmpl     = <StorageDrawers:upgradeTemplate>;
val cmp      = <minecraft:comparator>;

// Uluchsheniya yomkosti: zhelezo / zoloto / obsidian - plastiny; almaz i izumrud - von.
recipes.remove(<StorageDrawers:upgrade:*>);
recipes.addShaped(<StorageDrawers:upgrade:2>, [[plIron, stick, plIron], [stick, tmpl, stick], [plIron, stick, plIron]]);
recipes.addShaped(<StorageDrawers:upgrade:3>, [[plGold, stick, plGold], [stick, tmpl, stick], [plGold, stick, plGold]]);
recipes.addShaped(<StorageDrawers:upgrade:4>, [[plObs, stick, plObs], [stick, tmpl, stick], [plObs, stick, plObs]]);

// Klyuch-shtorka (pryachet ikonku): zamok + chernila vmesto oka Endera (ad vyrezan).
recipes.remove(<StorageDrawers:shroudKey>);
recipes.addShapeless(<StorageDrawers:shroudKey>, [<StorageDrawers:upgradeLock>, <minecraft:dye:0>]);

// Kontroller: kontorka v zheleznoy rame - komparatory schityvayut yaschiki, kniga ucheta, privod na bronzovoy shesterne.
recipes.remove(<StorageDrawers:controller>);
mods.forestry.Carpenter.addRecipe(<StorageDrawers:controller>, [
    [plIron, <minecraft:book>, plIron],
    [cmp,    drawer,           cmp],
    [plIron, gBronze,          plIron]
], 200);
// Podchinyonnyy kontroller (rasshiryaet set'): bez knigi, odin komparator.
recipes.remove(<StorageDrawers:controllerSlave>);
mods.forestry.Carpenter.addRecipe(<StorageDrawers:controllerSlave>, [
    [plIron, cmp,    plIron],
    [null,   drawer, null],
    [plIron, null,   plIron]
], 100);

// Szhimayuschiy shkaf: stal'noy korpus, rychazhnyy press na dvukh bronzovykh shesternyakh.
recipes.remove(<StorageDrawers:compDrawers>);
mods.forestry.Carpenter.addRecipe(<StorageDrawers:compDrawers>, [
    [plSteel, plSteel, plSteel],
    [gBronze, drawer,  gBronze],
    [plSteel, plIron,  plSteel]
], 200);

// NEI: vyrezannoe
mods.nei.NEI.hide(<StorageDrawers:upgrade:5>);
mods.nei.NEI.hide(<StorageDrawers:upgrade:6>);
