// ====================================================================================
// MAShINY ZAVODA (mod Zavod 1.1.0): parovye i ognevye, bez okna.
// Upravlenie: predmety - pravym klikom ili voronkami/trubami s lyuboy storony; zhidkosti - trubami ili
// vyodrami/kapsulami/yacheykami. Pustaya ruka - sostoyanie v chat, Shift + pustaya ruka - zabrat' produktsiyu.
//   Svintsovaya kamera:  sera + 500 mB para -> 400 mB sernoy (selitra-katalizator, 1 na 8 partiy)
//   Kirpichnaya retorta: na ogne, selitra/sol' + 500 mB sernoy -> 500 mB azotnoy/solyanoy
//   Solevarnya:          u morya, 1000 mB vody + ogon' ili 250 mB para -> 1 sol'
//   Parovoy molot:       slitok + 100 mB para -> plastina
//   Patronnyy press:     matritsa kalibra, 100 mB para, 4 patrona za partiyu; porokha vchetvero men'she, chem v verstake
//   Khimicheskiy reaktor: dve zhidkosti na vkhod (nitruyuschaya smes', tsarskaya vodka, toluol, TNT,
//                         vodorod iz kapsul ili vodyanogo gaza, azot iz generatornogo gaza (koks), ammiak, selitra)
//   Parovoy avtoklav:    vulkanizatsiya (edinstvennaya v sborke), faktis, propitka shpal kreozotom, sterilizatsiya bintov
//   Kontaktnyy apparat:  sera + voda -> sernaya, platina-katalizator; vchetvero bystree svintsovoy kamery
//   Reaktor vysokogo davleniya: vsyo, chto parovoy reaktor, vtroe bystree + azotnaya po Ostval'du (ammiak + platina)
// ====================================================================================
val brickB   = <minecraft:brick_block>;
val plLead   = <ore:plateLead>;
val plIron   = <ore:plateIron>;
val plBronze = <ore:plateBronze>;
val plSteel  = <ore:plateSteel>;
val gBronze  = <ore:gearBronze>;
val hammer   = <IC2:itemToolForgeHammer>.anyDamage();

// Svintsovaya kamera: svintsovye listy na kirpichnom fundamente, vnutri - svintsovyy kotyol
recipes.addShaped(<zavod:lead_chamber>, [
    [plLead, plLead,               plLead],
    [plLead, <minecraft:cauldron>, plLead],
    [brickB, brickB,               brickB]
]);

// Kirpichnaya retorta: steklyannaya retorta s zheleznym gorlom v kirpichnoy pechi
recipes.addShaped(<zavod:retort>, [
    [brickB, plIron,            brickB],
    [brickB, <ore:blockGlass>,  brickB],
    [brickB, <minecraft:furnace>, brickB]
]);

// Solevarnya: zheleznyy protiven' nad kirpichnoy topkoy
recipes.addShaped(<zavod:salt_pan>, [
    [plIron, plIron,              plIron],
    [brickB, <minecraft:furnace>, brickB]
]);

// Parovoy molot: bronzovaya stanina i tsilindr, stal'naya baba, nakoval'nya
recipes.addShaped(<zavod:steam_hammer>, [
    [plBronze,                <minecraft:piston>, plBronze],
    [<Railcraft:part.gear:3>, <ore:blockSteel>,   <Railcraft:part.gear:3>],
    [plBronze,                <minecraft:anvil>,  plBronze]
]);

// Patronnyy press: bronzovaya stanina, stal'nye puansony
recipes.addShaped(<zavod:cartridge_press>, [
    [plBronze, <minecraft:piston>,      plBronze],
    [gBronze,  plSteel,                 gBronze],
    [plBronze, <Railcraft:part.gear:3>, plBronze]
]);

// Khimicheskiy reaktor: kislotostoykaya svintsovaya futerovka, zheleznyy korpus, smotrovoe steklo,
// meshalka (porshen'), kotyol s parovoy rubashkoy. Bez bronzy i stali - dostupen v parovuyu epokhu.
recipes.addShaped(<zavod:chem_reactor>, [
    [plLead,            <ore:blockGlass>,     plLead],
    [<IC2:itemRubber>,  <minecraft:cauldron>, <IC2:itemRubber>],   // rezinovye uplotniteli lyukov i smotrovogo stekla (ebonit derzhit kisloty)
    [plIron,            <zavod:shaft>,        plIron]      // meshalka na valu (BYLO: porshen')
]);

// Smesitel' (A7, 1.56.33): futerovannaya bochka (svinets), meshalka na valu ot shkiva. Chistoe smeshenie bez nagreva:
// nitruyushchaya smes', tsarskaya vodka, antifriz IC2 (pereekhali iz khimreaktora).
recipes.addShaped(<zavod:mixer>, [
    [null,              <zavod:pulley>,       null],
    [<ore:plateLead>,   <zavod:shaft>,        <ore:plateLead>],
    [null,              <zavod:barrel_lined>, null]
]);

// Parovoy avtoklav: klyopanyy zheleznyy sosud ot kotla Railcraft, klapan i zheleznaya dver'-lyuk.
recipes.addShaped(<zavod:autoclave>, [
    [plIron, <Railcraft:machine.beta:2>, plIron],
    [plIron, <Railcraft:machine.beta:3>, plIron],
    [plIron, <minecraft:iron_door>,      plIron]
]);

// Kontaktnyy apparat: kolonna s monelevoy (kislotostoykoy) futerovkoy, platinovyy sloy, teploobmennik, vozdukhoduvka, obmurovka iz vaty.
// Zavod 1.40: slozhnaya tekhnika - tol'ko v plotnike, chertyozh raskhoduetsya (kopiya - sin'ka, loot.zs)
mods.forestry.Carpenter.addRecipe(<zavod:contact_apparatus>, [[<zavod:plate_monel>, <ore:nuggetPlatinum>, <zavod:plate_monel>], [<BuildCraft|Factory:tankBlock>, <IC2:itemRecipePart:5>, <BuildCraft|Factory:tankBlock>], [<zavod:slag_wool>, <minecraft:piston>, <zavod:blueprint_contact>]], 200);

// Reaktor vysokogo davleniya: korpus iz medno-nikelevoy stali (davlenie), monelevaya futerovka (kisloty), bak kotla vysokogo davleniya, platinovaya setka, vata.
// Zavod 1.40: slozhnaya tekhnika - tol'ko v plotnike, chertyozh raskhoduetsya (kopiya - sin'ka, loot.zs)
mods.forestry.Carpenter.addRecipe(<zavod:hp_reactor>, [[<zavod:plate_monel>, <ore:nuggetPlatinum>, <zavod:plate_monel>], [<zavod:block_alloy_steel>, <zavod:chem_reactor>, <zavod:block_alloy_steel>], [<zavod:slag_wool>, <Railcraft:machine.beta:4>, <zavod:blueprint_hp_reactor>]], 200);

// Veretino: palka + dereviannoe pryaslo (polublok). Sherst' pryadut rukami, drobilki ne nuzhny.
recipes.addShapeless(<zavod:spindle>, [<ore:stickWood>, <ore:slabWood>]);
recipes.addShapeless(<minecraft:string> * 3, [<minecraft:wool:*>, <zavod:spindle>.anyDamage().transformDamage()]);

// Matritsy: 2 stali pod molotom, obrazets patrona - kalibr (raskhoduetsya)
recipes.addShapeless(<zavod:die_pistol>,       [<ore:ingotSteel>, <ore:ingotSteel>, hammer, <zavod:cartridge_pistol>]);
recipes.addShapeless(<zavod:die_rifle>,        [<ore:ingotSteel>, <ore:ingotSteel>, hammer, <zavod:cartridge_rifle>]);
recipes.addShapeless(<zavod:die_intermediate>, [<ore:ingotSteel>, <ore:ingotSteel>, hammer, <zavod:cartridge_intermediate>]);
recipes.addShapeless(<zavod:die_shotgun>,      [<ore:ingotSteel>, <ore:ingotSteel>, hammer, <zavod:shell_shotgun>]);

// ------------------------------------------------------------------------------------
// Separatsiya dymnogo porokha (utilizatsiya trofeynogo porokha s kriperov):
// goryachaya voda vymyvaet selitru, sera ostayotsya v osadke, ugol' teryaetsya.
// Rudopromyvka IC2: 2 porokha + 1000 mB vody -> 3 selitry + 1 sera (v porokhe bylo 4 selitry i 2 sery).
// ------------------------------------------------------------------------------------
mods.ic2.OreWasher.addRecipe([<Railcraft:dust:2> * 3, <IC2:itemDust:13>], <minecraft:gunpowder> * 2, 1000);

// ====================================================================================
// SELITRYaNITsA (Zavod 1.35): rannyaya selitra bez kislot i para. Navesa iz polubrevenchatykh plit, doshchatyy ramnyy
// yashchik, zemlyanaya kucha na glinyanom podu (glina - chtoby ne ukhodil rassol).
// ====================================================================================
recipes.addShaped(<zavod:saltpeter_bed>, [
    [<ore:slabWood>,  <ore:slabWood>,   <ore:slabWood>],
    [<ore:plankWood>, <minecraft:dirt>, <ore:plankWood>],
    [<ore:plankWood>, <minecraft:clay>, <ore:plankWood>]
]);

// ====================================================================================
// KONSTRUKTORSKOE BYURO (Zavod 1.37): chertyozh svoimi silami - obraztsy sgorayut na ispytaniyakh, bumaga, chernila, sutki.
// Chertyozhnaya doska (doski + bumaga), arkhiv (knizhnye polki), verstak, tsirkul' (kompas), stal'naya rama ispytatel'nogo stenda.
// ====================================================================================
recipes.addShaped(<zavod:bureau>, [
    [<ore:plankWood>,      <minecraft:paper>,          <ore:plankWood>],
    [<minecraft:bookshelf>, <minecraft:crafting_table>, <minecraft:bookshelf>],
    [<ore:plateSteel>,     <minecraft:compass>,        <ore:plateSteel>]
]);

// ====================================================================================
// NABOR GEOLOGA (Zavod 1.48): magnitometr (kompas), burovoy shchup (zheleznye shtangi), steklo shkaly.
// Klik po kamnyu - proba kuba 25 blokov: skol'ko kakoy rudy (sledy/bedno/sredne/bogato) i priznaki nefti, bez
// koordinat i napravleniya (Zavod 1.56.35, A11 - kak v TFC). 64 proby.
// ====================================================================================
recipes.addShaped(<zavod:geo_kit>, [
    [null,            <minecraft:compass>,    null],
    [<ore:ingotIron>, <minecraft:glass_pane>, <ore:ingotIron>],
    [null,            <ore:ingotIron>,        null]
]);

// A19 (1.56.79): Spravochnik inzhenera - podskazki mashin vmesto chata (novichku vydayotsya sam pri pervom vkhode)
recipes.addShapeless(<zavod:handbook>, [<minecraft:book>, <minecraft:paper>]);
