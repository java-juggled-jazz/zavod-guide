// ====================================================================================
// NEFT' (Zavod 1.56.30, SPEC A5): konechnye zalezhi, razvedka, burenie, fontan i kachalka, atmosfernaya kolonna.
// ====================================================================================
// Zalezhi - virtual'nye, po rayonam 64x64 bloka iz sida mira (Oil.java): lovushka (kupol) v 25% rayonov,
// neft' - v 60% lovushek (ostal'nye - suhie), 500-5000 vyodr (10% - giganty x4), krovlya 150-1500 m, gazovaya
// shapka u 40%. Zapas konechen, davlenie padaet. Istochniki nefti BC vyklyucheny (config/buildcraft/main.cfg).
// Razvedka: kir na poverkhnosti nad melkimi bogatymi zalezhami (1859); nabor geologa - priznaki nefti (goryacho-kholodno);
// seysmostantsiya (1 TNT) - lovushki vokrug i glubina; sputnik-razvedchik - zalezhi.
// Burenie: vyshka (ot 4 blokov stolbom nad ust'em), 20 m na obsadnuyu trubu + 250 mB vody, val 6 l.s. ili par.
// Peregonka: pech' Shukhova + 3-4 sektsii: 1000 nefti -> gaz 30, benzin 200, kerosin 120, solyarka 250, mazut 350.
// Neftepererabotka v khimreaktore: vakuum (maslo + bitum), kreking Shukhova (VD) i Gudri, gidrogenizatsiya (VD),
// parovaya konversiya gaza v vodorod. Pryamoy retsept neft' -> toplivo (neftepregonnyy BC, reaktor VD) snyat.
// ====================================================================================

val hammer = <IC2:itemToolForgeHammer>.anyDamage();

// --- Obsadnye truby: listy, svaltsovannye i sklyopannye molotom (1859 - chugun, potom stal') ---
recipes.addShaped(<zavod:well_casing> * 4, [
    [<ore:plateSteel>, <ore:plateSteel>, <ore:plateSteel>],
    [null,             hammer,           null]
]);
recipes.addShaped(<zavod:well_casing> * 3, [
    [<ore:plateIron>, <ore:plateIron>, <ore:plateIron>],
    [null,            hammer,          null]
]);

// --- Burovaya vyshka: derevyannaya ferma na zheleznykh skobakh (kak u Dreyka) ---
recipes.addShaped(<zavod:derrick> * 2, [
    [<ore:plankWood>, <ore:stickWood>, <ore:plankWood>],
    [<ore:stickWood>, <ore:ingotIron>, <ore:stickWood>],
    [<ore:plankWood>, <ore:stickWood>, <ore:plankWood>]
]);

// --- Ust'e skvazhiny: rotornyy stol (stal'nye shesterni), vertlyug, burovoy nasos ---
mods.forestry.Carpenter.addRecipe(<zavod:oil_well>, [
    [<ore:gearSteel>,  <zavod:pipe_steel_large>,  <ore:gearSteel>],
    [<ore:plateSteel>, <zavod:pipe_steel_medium>, <ore:plateSteel>],
    [<ore:plateSteel>, <ore:plateSteel>,          <ore:plateSteel>]
], 100);

// --- Atmosfernaya kolonna: trubchataya pech' Shukhova (zmeevik v kirpichnoy topke) + sektsii s tarelkami ---
mods.forestry.Carpenter.addRecipe(<zavod:oil_column>, [
    [<ore:plateSteel>,       <zavod:pipe_steel>,  <ore:plateSteel>],
    [<minecraft:brick_block>, <minecraft:furnace>, <minecraft:brick_block>],
    [<minecraft:brick_block>, <minecraft:brick_block>, <minecraft:brick_block>]
], 100);
mods.forestry.Carpenter.addRecipe(<zavod:column_section>, [
    [<ore:plateSteel>, null,               <ore:plateSteel>],
    [<ore:plateSteel>, <zavod:pipe_steel>, <ore:plateSteel>],
    [<ore:plateSteel>, null,               <ore:plateSteel>]
], 60);

// --- Seysmostantsiya (geofony + samopisets, 1920-e). Gravimetr Etvyosha snyat (Zavod 1.56.35, A11): ego ploshchad'
// (lovushki 5x5 rayonov) i glubina - u seysmostantsii. ---
recipes.addShaped(<zavod:seismograph>, [
    [<ore:paneGlass>,  <minecraft:paper>,  <ore:paneGlass>],
    [<ore:plateCopper>, <minecraft:clock>,  <ore:plateCopper>],
    [<ore:plateIron>,  <minecraft:string>, <ore:plateIron>]
]);
mods.forestry.Carpenter.addRecipe(<zavod:seismograph>, [
    [<ore:paneGlass>,  <minecraft:paper>,  <ore:paneGlass>],
    [<ore:plateCopper>, <minecraft:clock>,  <ore:plateCopper>],
    [<ore:plateIron>,  <minecraft:string>, <ore:plateIron>]
], 60);

// --- Bitum: izolyatsiya kabelya (bumaga, propitannaya bitumom - kabeli 1880-kh) ---
recipes.addShapeless(<IC2:itemCable> * 4, [<IC2:itemCable:1>, <IC2:itemCable:1>, <IC2:itemCable:1>, <IC2:itemCable:1>,
    <zavod:bitumen>, <minecraft:paper>]);

// --- Neftepererabotka BC: retsepta neft' -> toplivo bol'she net (snyat v zavod.jar) - pryachem ---
recipes.remove(<BuildCraft|Factory:refineryBlock>);
mods.nei.NEI.hide(<BuildCraft|Factory:refineryBlock>);

// --- Zavod 1.56.37 (A8): obsadnye truby na prokatnom stane - stolbikom (ryad zhelesa byl zanyat trubkami AG, vyrezan v B1) ---
mods.railcraft.Rolling.addShaped(<zavod:well_casing> * 4, [[<ore:plateSteel>], [<ore:plateSteel>], [<ore:plateSteel>]]);
mods.railcraft.Rolling.addShaped(<zavod:well_casing> * 3, [[<ore:plateIron>], [<ore:plateIron>], [<ore:plateIron>]]);
