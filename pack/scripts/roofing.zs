// ====================================================================================
// A32 (docs/roofing.md): krovlya i metallokonstruktsii tsekha.
// Krovel'nyy list (fal'ts) - polnyy blok: Carpenter's Blocks kladut ego pokrytiem na skaty, plity, stupeni.
// Rzhavchina i patina - kraftom s vodoy ili sami pod otkrytym nebom (zavod.cfg [roof]); vosk Forestry ostanavlivaet.
// ====================================================================================
val hammer = <ore:craftingToolForgeHammer>;
val rebar  = <Railcraft:part.rebar>;
val rivet  = <ore:nuggetIron>;
val wax    = <ore:itemBeeswax>;
val water  = <minecraft:water_bucket>;

// List: 3 plastiny + molot -> 4 bloka (fal'tsuyut na meste)
recipes.addShapeless(<zavod:sheet_metal:0> * 4, [<ore:plateIron>,   <ore:plateIron>,   <ore:plateIron>,   hammer]);
recipes.addShapeless(<zavod:sheet_metal:1> * 4, [<ore:plateSteel>,  <ore:plateSteel>,  <ore:plateSteel>,  hammer]);
recipes.addShapeless(<zavod:sheet_metal:2> * 4, [<ore:plateCopper>, <ore:plateCopper>, <ore:plateCopper>, hammer]);
recipes.addShapeless(<zavod:sheet_metal:3> * 4, [<ore:plateLead>,   <ore:plateLead>,   <ore:plateLead>,   hammer]);

// Srazu sostarennye: 8 listov vokrug vedra vody (vedro vozvrashchaetsya)
recipes.addShaped(<zavod:sheet_metal:4> * 8, [[<zavod:sheet_metal:0>, <zavod:sheet_metal:0>, <zavod:sheet_metal:0>], [<zavod:sheet_metal:0>, water, <zavod:sheet_metal:0>], [<zavod:sheet_metal:0>, <zavod:sheet_metal:0>, <zavod:sheet_metal:0>]]);
recipes.addShaped(<zavod:sheet_metal:5> * 8, [[<zavod:sheet_metal:1>, <zavod:sheet_metal:1>, <zavod:sheet_metal:1>], [<zavod:sheet_metal:1>, water, <zavod:sheet_metal:1>], [<zavod:sheet_metal:1>, <zavod:sheet_metal:1>, <zavod:sheet_metal:1>]]);
recipes.addShaped(<zavod:sheet_metal:6> * 8, [[<zavod:sheet_metal:2>, <zavod:sheet_metal:2>, <zavod:sheet_metal:2>], [<zavod:sheet_metal:2>, water, <zavod:sheet_metal:2>], [<zavod:sheet_metal:2>, <zavod:sheet_metal:2>, <zavod:sheet_metal:2>]]);

// Voshchenyy: 4 lista + vosk -> 4, ne stareet (ili PKM voskom po bloku v mire)
recipes.addShapeless(<zavod:sheet_metal:7> * 4, [<zavod:sheet_metal:0>, <zavod:sheet_metal:0>, <zavod:sheet_metal:0>, <zavod:sheet_metal:0>, wax]);
recipes.addShapeless(<zavod:sheet_metal:8> * 4, [<zavod:sheet_metal:1>, <zavod:sheet_metal:1>, <zavod:sheet_metal:1>, <zavod:sheet_metal:1>, wax]);
recipes.addShapeless(<zavod:sheet_metal:9> * 4, [<zavod:sheet_metal:2>, <zavod:sheet_metal:2>, <zavod:sheet_metal:2>, <zavod:sheet_metal:2>, wax]);

// Reshyotchataya ferma: sterzhni krestom na zaklyopkakh -> 8
recipes.addShaped(<zavod:truss> * 8, [[rebar, rivet, rebar], [rivet, rebar, rivet], [rebar, rivet, rebar]]);
// Nastil: prosechno-vytyazhnoy list - 2 stal'nye plastiny + molot -> 6
recipes.addShapeless(<zavod:grating> * 6, [<ore:plateSteel>, <ore:plateSteel>, hammer]);
// Dvutavr: profil' iz 7 stal'nykh plastin -> 8
recipes.addShaped(<zavod:ibeam> * 8, [[<ore:plateSteel>, <ore:plateSteel>, <ore:plateSteel>], [null, <ore:plateSteel>, null], [<ore:plateSteel>, <ore:plateSteel>, <ore:plateSteel>]]);
// Perila iz ugolka -> 16
recipes.addShaped(<zavod:railing> * 16, [[rebar, rivet, rebar], [rebar, rivet, rebar]]);

// A33: alkidnyy lak (plotnik, 100 mB na 4 lista) - zashchita, kak vosk; PKM vedrom/kapsuloy laka po list'yam - do 40 sosednikh razom.
mods.forestry.Carpenter.addRecipe(<zavod:sheet_metal:7> * 4, [[<zavod:sheet_metal:0>, <zavod:sheet_metal:0>], [<zavod:sheet_metal:0>, <zavod:sheet_metal:0>]], <liquid:alkyd> * 100, 40);
mods.forestry.Carpenter.addRecipe(<zavod:sheet_metal:8> * 4, [[<zavod:sheet_metal:1>, <zavod:sheet_metal:1>], [<zavod:sheet_metal:1>, <zavod:sheet_metal:1>]], <liquid:alkyd> * 100, 40);
mods.forestry.Carpenter.addRecipe(<zavod:sheet_metal:9> * 4, [[<zavod:sheet_metal:2>, <zavod:sheet_metal:2>], [<zavod:sheet_metal:2>, <zavod:sheet_metal:2>]], <liquid:alkyd> * 100, 40);
// Krovel'naya kraska: lak + pigment, tol'ko zhelezo i stal' (rzhavoe ne krasitsya). Surik - svinets, zelyonaya - krasitel', korichnevaya - zheleznyy surik.
mods.forestry.Carpenter.addRecipe(<zavod:sheet_metal:10> * 4, [[<zavod:sheet_metal:0>, <zavod:sheet_metal:0>, <ore:dustLead>], [<zavod:sheet_metal:0>, <zavod:sheet_metal:0>, null]], <liquid:alkyd> * 100, 40);
mods.forestry.Carpenter.addRecipe(<zavod:sheet_metal:10> * 4, [[<zavod:sheet_metal:1>, <zavod:sheet_metal:1>, <ore:dustLead>], [<zavod:sheet_metal:1>, <zavod:sheet_metal:1>, null]], <liquid:alkyd> * 100, 40);
mods.forestry.Carpenter.addRecipe(<zavod:sheet_metal:11> * 4, [[<zavod:sheet_metal:0>, <zavod:sheet_metal:0>, <ore:dyeGreen>], [<zavod:sheet_metal:0>, <zavod:sheet_metal:0>, null]], <liquid:alkyd> * 100, 40);
mods.forestry.Carpenter.addRecipe(<zavod:sheet_metal:11> * 4, [[<zavod:sheet_metal:1>, <zavod:sheet_metal:1>, <ore:dyeGreen>], [<zavod:sheet_metal:1>, <zavod:sheet_metal:1>, null]], <liquid:alkyd> * 100, 40);
mods.forestry.Carpenter.addRecipe(<zavod:sheet_metal:12> * 4, [[<zavod:sheet_metal:0>, <zavod:sheet_metal:0>, <ore:dustIron>], [<zavod:sheet_metal:0>, <zavod:sheet_metal:0>, null]], <liquid:alkyd> * 100, 40);
mods.forestry.Carpenter.addRecipe(<zavod:sheet_metal:12> * 4, [[<zavod:sheet_metal:1>, <zavod:sheet_metal:1>, <ore:dustIron>], [<zavod:sheet_metal:1>, <zavod:sheet_metal:1>, null]], <liquid:alkyd> * 100, 40);
