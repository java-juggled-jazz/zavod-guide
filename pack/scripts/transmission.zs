// ====================================================================================
// TRANSMISSIYa PAROVOY EPOKhI (zavod.jar): parovaya mashina krutit val, val cherez shkivy krutit stanki.
// Val pryamoy (kak v tsekhu pod potolkom), povorot i razvilka - reduktorom. Stanok stavitsya ryadom so shkivom sboku.
// Mashina tratit par tol'ko pod nagruzkoy: stanki stoyat - par tseliy. Peregruz - oboroty padayut u vsekh.
// Pravyy klik pustoy rukoy po valu - chto na linii: mashiny, l.s., stanki, zven'ya.
// ====================================================================================

val ironShaft  = <IC2:itemRecipePart:11>;   // zheleznyy val (tokarka / metalloformovschik)
val steelShaft = <IC2:itemRecipePart:12>;   // stal'noy val
val bushing    = <Railcraft:part.gear:3>;   // babbitovaya vtulka - podshipnik skol'zheniya
val drawPlate  = <zavod:draw_plate>.anyDamage().transformDamage();
val hammer     = <IC2:itemToolForgeHammer>.anyDamage();

// --- Val: zheleznyy val na dvukh babbitovykh podshipnikakh -> 4 zvena linii
recipes.addShaped(<zavod:shaft> * 4, [[bushing, ironShaft, bushing]]);

// --- Shkiv: derevyannyy shkiv na valu + kozhanyy remen' k stanku
recipes.addShaped(<zavod:pulley>, [
    [null,            <minecraft:leather>, null],
    [<ore:plankWood>, <zavod:shaft>,       <ore:plankWood>],
    [null,            <minecraft:leather>, null]
]);

// --- Reduktor: bronzovye shesterni v zheleznom korpuse (povorot na 90 gradusov, razvilka)
recipes.addShaped(<zavod:gearbox>, [
    [<ore:plateIron>,  <ore:gearBronze>, <ore:plateIron>],
    [<ore:gearBronze>, <zavod:shaft>,    <ore:gearBronze>],
    [<ore:plateIron>,  <ore:gearBronze>, <ore:plateIron>]
]);

// --- Parovaya mashina nizkogo davleniya (bronza): tsilindr s porshnem, parovaya korobka, val s makhovikom
recipes.addShaped(<zavod:steam_engine>, [
    [<ore:plateBronze>,         <minecraft:piston>, <ore:plateBronze>],
    [<Railcraft:machine.beta:0>, ironShaft,          <ore:gearBronze>],
    [<ore:plateIron>,           <ore:gearIron>,     <ore:plateIron>]
]);

// --- Parovaya mashina vysokogo davleniya (stal'): v 5 raz moschnee, est par v 5 raz bol'she
recipes.addShaped(<zavod:steam_engine_large>, [
    [<ore:plateSteel>,           <minecraft:piston>, <ore:plateSteel>],
    [<Railcraft:machine.beta:13>, steelShaft,         <ore:gearSteel>],
    [<ore:blockSteel>,           <ore:gearSteel>,    <ore:blockSteel>]
]);

// ====================================================================================
// PROVOLOKA: kusachkami iz plastiny ne delaetsya - tol'ko voloheniem cherez fil'ery.
// Vruchnuyu - volochil'naya doska (stal'naya plastina s ryadom otverstiy), 64 protyazhki; malo i dorogo.
// Na valu - volochil'nyy stan: bol'she provoloki so slitka i pachkoy po 4 slitka.
// (Metalloformovschik IC2 - elektricheskiy put', ostayotsya.)
// ====================================================================================
recipes.remove(<IC2:itemCable:1>);    // med': plastina + kusachki
recipes.remove(<IC2:itemCable:10>);   // olovo: plastina + kusachki
recipes.remove(<IC2:itemCable:2>);    // zoloto: plastina + kusachki

recipes.addShapeless(<zavod:draw_plate>, [<ore:plateSteel>, <ore:plateSteel>, hammer]);

recipes.addShapeless(<IC2:itemCable:1> * 2,  [<ore:ingotCopper>, drawPlate]);
recipes.addShapeless(<IC2:itemCable:10> * 2, [<ore:ingotTin>,    drawPlate]);
recipes.addShapeless(<IC2:itemCable:2> * 3,  [<ore:ingotGold>,   drawPlate]);

// --- Volochil'nyy stan: fil'ery (doska), barabannyy privod na valu, zakhvat-kleschi
recipes.addShaped(<zavod:wire_mill>, [
    [<ore:plateSteel>,  <zavod:draw_plate>.anyDamage(), <ore:plateSteel>],
    [<ore:gearBronze>,  ironShaft,                      <ore:gearBronze>],
    [<ore:plateIron>,   <minecraft:piston>,             <ore:plateIron>]
]);

// ====================================================================================
// EKSKAVATOR (karyer na valu): kopaet VSYo pozadi sebya sloyami do dna, cherez lyuki - v sunduki i vagonetki.
// Rezhim zasypki - poroda obratno v karyer, sverkhu zemlya. Lyuk: vsyo / poleznoe / otval (Shift + pustaya ruka).
// ====================================================================================
recipes.addShaped(<zavod:excavator>, [
    [<ore:plateBronze>, <minecraft:bucket>,    <ore:plateBronze>],   // kovshi
    [<ore:gearBronze>,  ironShaft,             <ore:gearBronze>],    // privod ot vala
    [<ore:plateIron>,   <minecraft:iron_bars>, <ore:plateIron>]      // kovshovaya tsep'
]);
recipes.addShaped(<zavod:excavator_large>, [
    [<ore:plateSteel>,        <zavod:excavator>,  <ore:plateSteel>],
    [<ore:gearSteel>,         steelShaft,         <ore:gearSteel>],
    [<ore:blockSteel>,        <minecraft:bucket>, <ore:blockSteel>]
]);
recipes.addShaped(<zavod:excavator_hatch>, [[<ore:plateIron>, <minecraft:hopper>, <ore:plateIron>]]);

// ====================================================================================
// RUDNAYa TOLChEYa (na valu): pesty na kulachkovom valu tolkut pachku 8 sht.
// Ruda -> pyl' 1 : 1.5; bulyzhnik -> graviy; graviy -> pesok + glina (1 na 4) + kremen' (1 na 8).
// ====================================================================================
recipes.addShaped(<zavod:stamp_mill>, [
    [<ore:plateIron>,    ironShaft,            <ore:plateIron>],    // kulachkovyy val
    [<minecraft:piston>, <ore:gearBronze>,     <minecraft:piston>], // pesty
    [<ore:plateSteel>,   <minecraft:cauldron>, <ore:plateSteel>]    // stupa
]);

// --- Sektsiya strely ekskavatora: reshyotchataya ferma; stolbikom na ekskavator, kazhdaya - eschyo kvadrat kar'era nazad
recipes.addShaped(<zavod:excavator_boom>, [[<minecraft:iron_bars>, <ore:plateIron>, <minecraft:iron_bars>]]);

// ====================================================================================
// PAROVOY NASOS (porshnevoy, na valu): stavitsya pryamo nad vodoy, otdayot vodu v sosednie kotly, baki, truby.
// Istochnik s dvumya sosednimi istochnikami (prud, reka, more) ne ubyvaet; luzhu vykachivaet.
// ====================================================================================
recipes.addShaped(<zavod:shaft_pump>, [
    [<ore:plateIron>,    <ore:plateCopper>,                                         <ore:plateIron>],
    [<minecraft:piston>, ironShaft,                                                 <ore:gearBronze>],
    [<ore:plateIron>,    <minecraft:bucket>,                                        <ore:plateIron>]
]);

// ====================================================================================
// MOLOT I PATRONNYY PRESS (zavod.jar 1.21): rabotayut i ot svoego para, i ot vala (shkiv ryadom) - tam par ne nuzhen.
// ====================================================================================

// ====================================================================================
// PILORAMA (tsirkul'naya pila na valu): brevna iz sunduka sverkhu, doski i opilki - v sunduk snizu.
// Brevno -> 6 dosok (ruchnoy raspil 2, nozhovka 4), opilki TE - 1 na 2 brevna.
// ====================================================================================
recipes.addShaped(<zavod:sawmill>, [
    [<ore:plateIron>,  <ore:plateSteel>, <ore:plateIron>],    // stal'noy disk pily
    [<ore:gearBronze>, ironShaft,        <ore:gearBronze>],   // privod ot vala
    [<ore:plankWood>,  <ore:plankWood>,  <ore:plankWood>]     // derevyannyy stol
]);

// ====================================================================================
// BESSEMEROVSKIY KONVERTER (1856): 16 zheleza + 2 koksa -> 14 stali + 2 shlaka IC2 za 30 s produvki.
// Duty daet vozdukhoduvnaya mashina na valu (24 l.s. - parovaya mashina vysokogo davleniya), vplotnuyu k konverteru. Domna Railcraft ne nuzhna.
// ====================================================================================
recipes.addShaped(<zavod:converter>, [
    [<Railcraft:machine.alpha:12>, <ore:plateSteel>,     <Railcraft:machine.alpha:12>],  // ogneupornaya futerovka
    [<ore:ingotInvar>,             <minecraft:cauldron>, <ore:ingotInvar>],              // korpus grushi iz invara (ne vedet ot zhara)
    [<Railcraft:machine.alpha:12>, <ore:gearSteel>,      <Railcraft:machine.alpha:12>]   // povorotnyy mekhanizm
]);
// SEKTsIYa ShAKhTY: stavitsya stolbom NAD konverterom (do 3). Kazhdaya sektsiya - eshche odna zagruzka shikhty
// (16 zheleza + 2 koksa) za tu zhe produvku, no duty nuzhno vdvoe/vtroe bol'she - po vozdukhoduvke na zagruzku.
recipes.addShaped(<zavod:converter_section>, [
    [<Railcraft:machine.alpha:12>, <ore:plateSteel>, <Railcraft:machine.alpha:12>],
    [<ore:ingotInvar>,             null,             <ore:ingotInvar>],
    [<Railcraft:machine.alpha:12>, <ore:plateSteel>, <Railcraft:machine.alpha:12>]
]);
recipes.addShaped(<zavod:blower>, [
    [<ore:plateIron>,  <minecraft:piston>, <ore:plateIron>],   // vozdushnyy tsilindr
    [<ore:gearBronze>, ironShaft,          <ore:gearBronze>],  // krivoship ot vala
    [<ore:plateIron>,  <ore:gearIron>,     <ore:plateIron>]
]);

// ====================================================================================
// PRIVODNAYa MUFTA: otbor moschnosti s vala na tokarnyy stanok IC2 (kU) i prokatnyy stan Railcraft (RF).
// Bol'she nikomu - val ne prevraschaetsya v elektrichestvo.
// ====================================================================================
recipes.addShaped(<zavod:coupling>, [
    [null,             <ore:plateIron>, null],
    [<ore:gearBronze>, ironShaft,       <ore:gearBronze>],    // kulachkovaya mufta
    [null,             <ore:plateIron>, null]
]);

// ====================================================================================
// SKIPOVYY POD"YoM: lebyodka s barabanom na valu nad stvolom, bunker na dne strogo pod ney.
// Stal'noy kanat: 8 zheleznykh provolok (volochil'nyy stan) vokrug pen'kovogo serdechnika (nit').
// ====================================================================================
recipes.addShaped(<zavod:wire_rope>, [
    [<IC2:itemCable:5>, <IC2:itemCable:5>, <IC2:itemCable:5>],
    [<IC2:itemCable:5>, <minecraft:string>, <IC2:itemCable:5>],
    [<IC2:itemCable:5>, <IC2:itemCable:5>, <IC2:itemCable:5>]
]);
recipes.addShaped(<zavod:skip_winch>, [
    [<ore:plateSteel>, <zavod:wire_rope>, <ore:plateSteel>],
    [<ore:gearSteel>,  ironShaft,         <ore:gearSteel>],
    [<ore:plateIron>,  <zavod:wire_rope>, <ore:plateIron>]
]);
recipes.addShaped(<zavod:skip_loader>, [
    [<ore:plateIron>, null,               <ore:plateIron>],
    [<ore:plateIron>, <minecraft:hopper>, <ore:plateIron>]
]);

// ====================================================================================
// PAROPROVODY I VODOPROVODY (zavod.jar 1.23): tol'ko par (Railcraft, IC2) i voda (i distillyat IC2).
// Glukhie: sami ne tyanut, ne fil'truyut. Bronzovaya 40 mB/t, stal'naya 80. Par ostyvaet: 1% na 10 blokov puti.
// Kovka iz plastin molotom: 6 plastin -> 6 trub (bez masla i plotnika - truby BC ostayutsya dlya vsego prochego).
// ====================================================================================
// Obychnaya i bol'shaya - s rezinovoy prokladkoy flantsa v tsentre setki; malaya - bez reziny (rannyaya igra).
// Razmery kak v GregTech: 6 plastin + molot + gaechnyy klyuch IC2 (klyuch ne raskhoduetsya); forma v setke zadayot razmer.
//   malaya: P P P / molot . klyuch / P P P -> 6;  obychnaya: P klyuch P / P . P / P molot P -> 2;  bol'shaya: P molot P / P . P / P klyuch P -> 1.
//   Potok bronza 40/120/240, stal' 80/240/480 mB/t; par teryaet 1% / 0.7% / 0.5% na 10 blokov.
val wrench = <IC2:itemToolWrench>.anyDamage().transformDamage();
recipes.addShaped(<zavod:pipe_bronze> * 6, [
    [<ore:plateBronze>, <ore:plateBronze>, <ore:plateBronze>],
    [hammer, null, wrench],
    [<ore:plateBronze>, <ore:plateBronze>, <ore:plateBronze>]
]);
recipes.addShaped(<zavod:pipe_bronze_medium> * 2, [
    [<ore:plateBronze>, wrench, <ore:plateBronze>],
    [<ore:plateBronze>, <IC2:itemRubber>, <ore:plateBronze>],
    [<ore:plateBronze>, hammer, <ore:plateBronze>]
]);
recipes.addShaped(<zavod:pipe_bronze_large>, [
    [<ore:plateBronze>, hammer, <ore:plateBronze>],
    [<ore:plateBronze>, <IC2:itemRubber>, <ore:plateBronze>],
    [<ore:plateBronze>, wrench, <ore:plateBronze>]
]);
recipes.addShaped(<zavod:pipe_steel> * 6, [
    [<ore:plateSteel>, <ore:plateSteel>, <ore:plateSteel>],
    [hammer, null, wrench],
    [<ore:plateSteel>, <ore:plateSteel>, <ore:plateSteel>]
]);
recipes.addShaped(<zavod:pipe_steel_medium> * 2, [
    [<ore:plateSteel>, wrench, <ore:plateSteel>],
    [<ore:plateSteel>, <IC2:itemRubber>, <ore:plateSteel>],
    [<ore:plateSteel>, hammer, <ore:plateSteel>]
]);
recipes.addShaped(<zavod:pipe_steel_large>, [
    [<ore:plateSteel>, hammer, <ore:plateSteel>],
    [<ore:plateSteel>, <IC2:itemRubber>, <ore:plateSteel>],
    [<ore:plateSteel>, wrench, <ore:plateSteel>]
]);

// ====================================================================================
// VYPARNOY APPARAT (zavod.jar 1.25): mnogokorpusnaya vyparka. Morskaya voda + par -> sol' + distillyat IC2.
// Do 3 korpusov v liniyu (litsom k sleduyuschemu): vtorichnyy par greet sleduyuschiy korpus.
// Mednyy korpus, smotrovoe steklo na rezinovykh uplotnitelyakh, kotyol, zheleznoe dnische.
// ====================================================================================
recipes.addShaped(<zavod:evaporator>, [
    [<ore:plateCopper>, <ore:paneGlass>,      <ore:plateCopper>],
    [<IC2:itemRubber>,  <minecraft:cauldron>, <IC2:itemRubber>],
    [<ore:plateIron>,   <minecraft:bucket>,   <ore:plateIron>]
]);

// ====================================================================================
// REDUKTOR PAROVOY TURBINY (M35) - SNYAT (B1, 1.56.53): turbina Railcraft vyrezana, bez neyo reduktor ne nuzhen.
// Kraft ubran, v NEI skryt (nei-hide.zs). RF - s mufty prokatnogo stana (val -> RF, kinezisnye truby BC).
// ====================================================================================

// --- Zavod 1.56.37 (A8): truby na prokatnom stane (avtoverstak BC retsepty s instrumentom ne delaet).
// Bol'shaya - dve prokladki (inache sovpadaet so sredney). ---
mods.railcraft.Rolling.addShaped(<zavod:pipe_bronze> * 6, [[<ore:plateBronze>, <ore:plateBronze>, <ore:plateBronze>], [null, null, null], [<ore:plateBronze>, <ore:plateBronze>, <ore:plateBronze>]]);
mods.railcraft.Rolling.addShaped(<zavod:pipe_bronze_medium> * 2, [[<ore:plateBronze>, null, <ore:plateBronze>], [<ore:plateBronze>, <IC2:itemRubber>, <ore:plateBronze>], [<ore:plateBronze>, null, <ore:plateBronze>]]);
mods.railcraft.Rolling.addShaped(<zavod:pipe_bronze_large>, [[<ore:plateBronze>, <IC2:itemRubber>, <ore:plateBronze>], [<ore:plateBronze>, <IC2:itemRubber>, <ore:plateBronze>], [<ore:plateBronze>, null, <ore:plateBronze>]]);
mods.railcraft.Rolling.addShaped(<zavod:pipe_steel> * 6, [[<ore:plateSteel>, <ore:plateSteel>, <ore:plateSteel>], [null, null, null], [<ore:plateSteel>, <ore:plateSteel>, <ore:plateSteel>]]);
mods.railcraft.Rolling.addShaped(<zavod:pipe_steel_medium> * 2, [[<ore:plateSteel>, null, <ore:plateSteel>], [<ore:plateSteel>, <IC2:itemRubber>, <ore:plateSteel>], [<ore:plateSteel>, null, <ore:plateSteel>]]);
mods.railcraft.Rolling.addShaped(<zavod:pipe_steel_large>, [[<ore:plateSteel>, <IC2:itemRubber>, <ore:plateSteel>], [<ore:plateSteel>, <IC2:itemRubber>, <ore:plateSteel>], [<ore:plateSteel>, null, <ore:plateSteel>]]);

// ====================================================================================
// PAROVAYA TURBINA (B3, 1.56.38): mnogoblok 3x3xL, stupitsa na litse - kontroller; vglub' po osi stupeni (1-6),
// za nimi golovka-val; vokrug korpus; za litsevym sloem v korpus - lyuk vpuska para (>= 1) i rovno odin vykhlopnoy lyuk.
// Moshchnost' rastyot so stupenyami, potolok - po slabeyshemu materialu (invar < med'-nikel' < monel'),
// peregretyy par IC2 - vygodnee. Golovka styokuetsya s valom po osi. Par tol'ko pod nagruzkoy, raskrutka ~30 s.
// ====================================================================================
// Korpus: stal'nye listy na zaklyopkakh (molot)
recipes.addShapeless(<zavod:turbine_casing> * 4, [<ore:plateSteel>, <ore:plateSteel>, <ore:plateSteel>, <ore:plateSteel>,
    <ore:nuggetIron>, <ore:nuggetIron>, <ore:nuggetIron>, <ore:nuggetIron>, hammer]);
// Vykhlopnoy lyuk: korpus s reshyotkoy-zhalyuzi
recipes.addShaped(<zavod:turbine_exhaust>, [
    [null,                  <minecraft:iron_bars>,  null],
    [<minecraft:iron_bars>, <zavod:turbine_casing>, <minecraft:iron_bars>]
]);
// Lyuk vpuska para: korpus s klapanom stal'nogo baka Railcraft
recipes.addShaped(<zavod:turbine_inlet>, [[<zavod:turbine_casing>, <Railcraft:machine.beta:15>]]);
// Stupeni: disk s lopatkami na stal'nom valu - na prokatnom stane (lopatki katayutsya)
mods.railcraft.Rolling.addShaped(<zavod:turbine_stage_invar>, [[<ore:ingotInvar>, <ore:ingotInvar>, <ore:ingotInvar>], [<ore:ingotInvar>, steelShaft, <ore:ingotInvar>], [<ore:ingotInvar>, <ore:ingotInvar>, <ore:ingotInvar>]]);
mods.railcraft.Rolling.addShaped(<zavod:turbine_stage_alloy_steel>, [[<ore:plateAlloySteel>, <ore:plateAlloySteel>, <ore:plateAlloySteel>], [<ore:plateAlloySteel>, steelShaft, <ore:plateAlloySteel>], [<ore:plateAlloySteel>, <ore:plateAlloySteel>, <ore:plateAlloySteel>]]);
mods.railcraft.Rolling.addShaped(<zavod:turbine_stage_monel>, [[<ore:plateMonel>, <ore:plateMonel>, <ore:plateMonel>], [<ore:plateMonel>, steelShaft, <ore:plateMonel>], [<ore:plateMonel>, <ore:plateMonel>, <ore:plateMonel>]]);
// Golovka-val: vykhodnoy val na babbitovykh vtulkakh, stal'nye shesterni; karter s maslom
mods.forestry.Carpenter.addRecipe(<zavod:turbine_head_shaft>, [
    [<zavod:turbine_casing>, bushing,    <zavod:turbine_casing>],
    [<ore:gearSteel>,        steelShaft, <ore:gearSteel>],
    [<zavod:turbine_casing>, bushing,    <zavod:turbine_casing>]
], <liquid:lubricant> * 100, 100);
// Stupitsa (kontroller): manometr stal'nogo baka - pribor oborotov, val s shesternyami
mods.forestry.Carpenter.addRecipe(<zavod:turbine>, [
    [<ore:plateSteel>,       <Railcraft:machine.beta:14>, <ore:plateSteel>],
    [<ore:gearSteel>,        steelShaft,                  <ore:gearSteel>],
    [<zavod:turbine_casing>, bushing,                     <zavod:turbine_casing>]
], <liquid:lubricant> * 100, 100);
// Golovka-generator (B3 chat 2, 1.56.39): vmesto vala - generator EU; napryazhenie zadayot transformator IC2 v retsepte
// (LV/MV/HV/EV). Ne to napryazhenie na slabykh mashinakh - sgorayut (peregruz B4). Menyaetsya bez peresborki ramy.
mods.forestry.Carpenter.addRecipe(<zavod:turbine_head_gen_lv>, [
    [<zavod:turbine_casing>, <IC2:itemRecipePart>, <zavod:turbine_casing>],
    [<IC2:itemRecipePart>,   steelShaft,           <IC2:itemRecipePart>],
    [<zavod:turbine_casing>, <IC2:blockElectric:3>, <zavod:turbine_casing>]
], <liquid:lubricant> * 100, 100);
mods.forestry.Carpenter.addRecipe(<zavod:turbine_head_gen_mv>, [
    [<zavod:turbine_casing>, <IC2:itemRecipePart>, <zavod:turbine_casing>],
    [<IC2:itemRecipePart>,   steelShaft,           <IC2:itemRecipePart>],
    [<zavod:turbine_casing>, <IC2:blockElectric:4>, <zavod:turbine_casing>]
], <liquid:lubricant> * 100, 100);
mods.forestry.Carpenter.addRecipe(<zavod:turbine_head_gen_hv>, [
    [<zavod:turbine_casing>, <IC2:itemRecipePart>, <zavod:turbine_casing>],
    [<IC2:itemRecipePart>,   steelShaft,           <IC2:itemRecipePart>],
    [<zavod:turbine_casing>, <IC2:blockElectric:5>, <zavod:turbine_casing>]
], <liquid:lubricant> * 100, 100);
mods.forestry.Carpenter.addRecipe(<zavod:turbine_head_gen_ev>, [
    [<zavod:turbine_casing>, <IC2:itemRecipePart>, <zavod:turbine_casing>],
    [<IC2:itemRecipePart>,   steelShaft,           <IC2:itemRecipePart>],
    [<zavod:turbine_casing>, <IC2:blockElectric:6>, <zavod:turbine_casing>]
], <liquid:lubricant> * 100, 100);
// Kondensatornyy vykhlop: trubnaya doska iz mednykh listov, klapany stal'nogo baka - vkhod okhlazhdayushchey vody i vykhod kondensata.
// Rabota na tot zhe par x1.25; bez vody - kak otkrytyy lyuk.
mods.forestry.Carpenter.addRecipe(<zavod:turbine_condenser>, [
    [<ore:plateCopper>,           <ore:plateCopper>,       <ore:plateCopper>],
    [<Railcraft:machine.beta:15>, <zavod:turbine_exhaust>, <Railcraft:machine.beta:15>],
    [<ore:plateCopper>,           <ore:plateCopper>,       <ore:plateCopper>]
], <liquid:water> * 1000, 100);
// ====================================================================================
// GAZOVAYA TURBINA (B3 chat 3, 1.56.41): ta zhe rama 3x3xL v zharoprochnom korpuse; po osi - stupeni kompressora (1-3),
// kamera sgoraniya, stupeni turbiny (te zhe diski, ne bol'she, chem kompressora), golovka (val ili generator - obshchie s parovoy).
// Lyuk topliva: koksovyy, drevesnyy, neftyanoy gaz, biogaz, kerosin. Vody ne nado, pusk 5 s; kompressor est 60%, KPD ~17%.
// ====================================================================================
// Zharoprochnyy korpus: korpus turbiny, obshityy medno-nikelevoy stal'yu (molot)
recipes.addShapeless(<zavod:gas_turbine_casing> * 4, [<zavod:turbine_casing>, <zavod:turbine_casing>, <zavod:turbine_casing>, <zavod:turbine_casing>,
    <ore:plateAlloySteel>, <ore:plateAlloySteel>, <ore:plateAlloySteel>, <ore:plateAlloySteel>, hammer]);
// Stupen' kompressora: chastye stal'nye lopatki na stal'nom valu - na prokatnom stane
mods.railcraft.Rolling.addShaped(<zavod:gas_turbine_compressor>, [[<ore:plateSteel>, <ore:plateSteel>, <ore:plateSteel>], [<ore:plateSteel>, steelShaft, <ore:plateSteel>], [<ore:plateSteel>, <ore:plateSteel>, <ore:plateSteel>]]);
// Kamera sgoraniya: zharovaya truba iz invara, forsunka, zapal
mods.forestry.Carpenter.addRecipe(<zavod:gas_turbine_combustor>, [
    [<zavod:gas_turbine_casing>, <ore:ingotInvar>,              <zavod:gas_turbine_casing>],
    [<ore:ingotInvar>,           <minecraft:flint_and_steel>,   <ore:ingotInvar>],
    [<zavod:gas_turbine_casing>, <Railcraft:machine.beta:15>,   <zavod:gas_turbine_casing>]
], <liquid:water> * 1000, 100);
// Lyuk topliva: zharoprochnyy korpus s klapanom stal'nogo baka
recipes.addShaped(<zavod:gas_turbine_fuel>, [[<zavod:gas_turbine_casing>, <Railcraft:machine.beta:15>]]);
// Stupitsa (kontroller): kak u parovoy, v zharoprochnom korpuse
// 1.56.66: tol'ko po chertezhu (byuro ili nakhodka; chertyozh raskhoduetsya - delay sin'ku, loot.zs)
mods.forestry.Carpenter.addRecipe(<zavod:gas_turbine>, [
    [<ore:plateSteel>,           <Railcraft:machine.beta:14>, <zavod:blueprint_gas_turbine>],
    [<ore:gearSteel>,            steelShaft,                  <ore:gearSteel>],
    [<zavod:gas_turbine_casing>, bushing,                     <zavod:gas_turbine_casing>]
], <liquid:lubricant> * 100, 100);
// ====================================================================================
// DIZEL' (A15, 1.56.49): ta zhe rama 3x3xL v kartere; po osi - tsilindry (1-6, po 25 l.s.), golovka (val ili generator -
// obshchie s turbinami). Lyuk topliva: solyarka (polnyy khod), mazut (tikhokhodnyy, 60%). Vody i gaza ne nado; vykhlop - dym.
// ====================================================================================
// Karter: zheleznye i stal'nye listy (molot)
recipes.addShapeless(<zavod:diesel_casing> * 4, [<ore:plateIron>, <ore:plateIron>, <ore:plateIron>, <ore:plateIron>,
    <ore:plateSteel>, <ore:plateSteel>, <ore:plateSteel>, <ore:plateSteel>, hammer]);
// Tsilindr: gil'za iz tolstoy stal'noy truby, forsunka na toplivnoy trubke, kolenchatyy val v kartere
mods.forestry.Carpenter.addRecipe(<zavod:diesel_cylinder>, [
    [<ore:plateSteel>,      <zavod:pipe_steel>,       <ore:plateSteel>],
    [<ore:plateSteel>,      <zavod:pipe_steel_large>, <ore:plateSteel>],
    [<zavod:diesel_casing>, steelShaft,               <zavod:diesel_casing>]
], <liquid:lubricant> * 100, 100);
// Lyuk topliva: karter s klapanom stal'nogo baka
recipes.addShaped(<zavod:diesel_fuel>, [[<zavod:diesel_casing>, <Railcraft:machine.beta:15>]]);
// Stupitsa (kontroller): makhovik (blok zheleza) na stal'nom valu, shesterni regulyatora, vtulka
// 1.56.66: tol'ko po chertezhu (byuro ili nakhodka; chertyozh raskhoduetsya - delay sin'ku, loot.zs)
mods.forestry.Carpenter.addRecipe(<zavod:diesel>, [
    [<ore:plateSteel>,      <ore:blockIron>, <zavod:blueprint_diesel>],
    [<ore:gearSteel>,       steelShaft,      <ore:gearSteel>],
    [<zavod:diesel_casing>, bushing,         <zavod:diesel_casing>]
], <liquid:lubricant> * 100, 100);
// Karta datchika Zavod dlya Nuclear Control: tekstovaya karta NC + skhema; klik po turbine - privyazka.
recipes.addShapeless(<zavod:sensor_card>, [<IC2NuclearControl:ItemTextCard>, <ore:circuitBasic>]);
