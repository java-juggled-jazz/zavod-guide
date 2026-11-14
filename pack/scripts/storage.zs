// KhRANENIE SYPUChKI I ZhIDKOSTEY (Zavod 1.56.26, SPEC A4b): silos, ugol'nyy bunker, bochki.
// ====================================================================================
// Silos: vypusk v tsentre kol'tsa iz 8 stenok, nad nim sloi 3x3 stenok, lyuk - v tsentre verkhnego sloya.
//   Odin sypuchiy material (ruda, drob', ugol', koks, pesok, graviy, glina, zerno, semena). Sloy - 2304 sht.
//   Vysota po samoy slaboy stenke: kirpich 4 sloya, klyopanaya stal' 8, beton 12. Zagruzka v lyuk (skip, truba,
//   voronka, rukami), vygruzka samotyokom - voronka/truba pod vypuskom; komparator - zapolnenie.
// Ugol'nyy bunker: 16 stopok uglya/koksa/torfa, syplet v topku pod soboy ili pered litsom (kotyol Railcraft).
// Bochki: perenosnye (zhidkost' ostayotsya v predmete). Derevo - 1 vedro kholodnogo bez kislot, stal' - 4 vedra
//   bez kislot, futerovannaya svintsom - 4 vedra, kisloty tozhe. Gazy - ni v kakuyu.
// ====================================================================================
val brickB  = <minecraft:brick_block>;
val plIron  = <ore:plateIron>;
val plSteel = <ore:plateSteel>;
val plLead  = <ore:plateLead>;
val rivet   = <ore:nuggetIron>;
val gBronze = <ore:gearBronze>;
val hammer  = <IC2:itemToolForgeHammer>.anyDamage();

// Stenki silosa (4 shtuki): kirpich na glinyanom rastvore; stal'nye listy na zaklyopkakh; zhelezobeton.
recipes.addShaped(<zavod:silo_wall_brick> * 4, [
    [brickB, brickB,                 brickB],
    [brickB, <minecraft:clay_ball>,  brickB],
    [brickB, brickB,                 brickB]
]);
recipes.addShapeless(<zavod:silo_wall_steel> * 4, [plSteel, plSteel, plSteel, plSteel, rivet, rivet, rivet, rivet, hammer]);
recipes.addShaped(<zavod:silo_wall_concrete> * 4, [
    [<Railcraft:cube:1>,     <Railcraft:part.rebar>, <Railcraft:cube:1>],
    [<Railcraft:part.rebar>, <Railcraft:cube:1>,     <Railcraft:part.rebar>],
    [<Railcraft:cube:1>,     <Railcraft:part.rebar>, <Railcraft:cube:1>]
]);

// Vypusk silosa: stal'naya voronka s shiberom (zatvor na bronzovoy shesterne).
recipes.addShaped(<zavod:silo>, [
    [plSteel, null,    plSteel],
    [plSteel, gBronze, plSteel],
    [null,    plSteel, null]
]);

// Lyuk silosa: kryshka-lyuk v stal'noy rame.
recipes.addShaped(<zavod:silo_hatch>, [
    [plIron,  rivet,                 plIron],
    [plSteel, <minecraft:trapdoor>,  plSteel]
]);

// Ugol'nyy bunker: klyopanyy zheleznyy yaschik s techkoy.
recipes.addShaped(<zavod:coal_bunker>, [
    [plIron, null,   plIron],
    [plIron, null,   plIron],
    [rivet,  plIron, rivet]
]);

// Bochki: dubovye klyopki na zheleznykh obruchakh; stal'naya katanaya; stal'naya so svintsovoy futerovkoy.
recipes.addShaped(<zavod:barrel_wood>, [
    [<ore:plankWood>, plIron, <ore:plankWood>],
    [<ore:plankWood>, null,   <ore:plankWood>],
    [<ore:plankWood>, plIron, <ore:plankWood>]
]);
recipes.addShapeless(<zavod:barrel_steel>, [plSteel, plSteel, plSteel, plSteel, plSteel, plSteel, hammer]);
recipes.addShapeless(<zavod:barrel_lined>, [<zavod:barrel_steel>, plLead, plLead, plLead, plLead, hammer]);
