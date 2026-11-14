// ====================================================================================
// KhIMTsEKh: SOL', RTUT', SKIPIDAR, PRIPOY, GREMUChAYa RTUT'
// Kisloty - zhidkosti moda Zavod: svintsovaya kamera, retorta, reaktory, kontaktnyy apparat (zavod-machines.zs):
//   voda + sera -> sernaya; sernaya + selitra -> azotnaya; sernaya + sol' -> solyanaya;
//   solyanaya + selitra -> tsarskaya vodka; sernaya + mednaya pyl' -> rastvor kuporosa.
// Gonyatsya po trubam, khranyatsya v bakakh, nalivayutsya v yacheyki IC2 i kapsuly Forestry.
// ====================================================================================

// Sol': vyparivanie rassola - promyvka morskogo peska (rudomoyka IC2), pesok vozvrashchaetsya
<ore:dustSalt>.add(<zavod:salt>);
<ore:foodSalt>.add(<zavod:salt>);
<ore:itemSalt>.add(<zavod:salt>);
// Sol' - tol'ko iz morskoy vody v solevarne (zavod-machines.zs). Retsept "pesok -> sol'" v rudopromyvke udalyon.

// Rtut': obzhig kinovari (HgS -> Hg + SO2) v kirpichnoy retorte Zavod. Kinovar' - pobochka krasnoy rudy v rudnoy tolchee.
// B1 chat 3: kinovar' Zavod (tolcheya - pobochka krasnoy rudy) obzhigayut v kirpichnoy retorte -> rtut' (bez kisloty, v mode).

// Amal'gamatsiya zolota: 3 droblyonoy zolotoy rudy + 50 mB rtuti -> 4 zolotoy pyli (rtut' vozvrashchaetsya otgonkoy, ubyl' - 50 mB)
mods.forestry.Carpenter.addRecipe(<IC2:itemDust:4> * 4, [[<ore:crushedGold>, <ore:crushedGold>, <ore:crushedGold>]], <liquid:mercury> * 50, 80);

// Zhivitsa (smola IC2) -> skipidar + kanifol': peregonka - v khimreaktore Zavod (Zavod 1.56.8; bylo v transpozere TE)

// Pripoy: olovo + svinets (POS-40) + kanifol' (flyus) -> 4. Idyot v lampovye i prodvinutye skhemy vmesto chistogo olova.
recipes.addShapeless(<zavod:solder> * 4, [<ore:ingotTin>, <ore:ingotLead>, <zavod:rosin>]);

// Pustaya kapsula IC2 vruchnuyu (Zavod 1.56.7): olovyannaya plastina svorachivaetsya molotom, shov i dno - na pripoy
// (germetichnost'). 1 kapsula - dorozhe stanka: metalloformovshchik vydavlivaet iz plastiny 3 besshovnye kapsuly.
recipes.addShapeless(<IC2:itemCellEmpty>, [<ore:plateTin>, <zavod:solder>, <IC2:itemToolForgeHammer>.anyDamage()]);

// Mednyy kuporos: kristallizatsiya iz rastvora na nitkakh (plotnik): nitka + 1000 mB rastvora -> 4 kristalla
mods.forestry.Carpenter.addRecipe(<zavod:copper_vitriol> * 4, [[<minecraft:string>]], <liquid:coppersulfate> * 1000, 60);

// Gremuchaya rtut': plotnik, 250 mB rtuti + 2 selitry + sera (azotnaya kislota na meste) -> 16.
// (Plotnik ne razlichaet yacheyki IC2 po soderzhimomu, poetomu azotnaya ne iz truby, a iz selitry.) Kapsyul' na gremuchey rtuti: mednaya plastina + gremuchaya rtut' -> 16.
mods.forestry.Carpenter.addRecipe(<zavod:mercury_fulminate> * 16, [[<Railcraft:dust:2>, <Railcraft:dust:2>, <ore:dustSulfur>]], <liquid:mercury> * 250, 80);
recipes.addShapeless(<zavod:primer> * 16, [<ore:plateCopper>, <zavod:mercury_fulminate>]);

// Kamennaya sol' (galit, blok zavod:rock_salt): plasty evaporitov v kamne na glubine 16-45, primerno 1 chank iz 10.
// Drobim v povarennuyu: drobilka IC2 - 2 soli, rukami kuznechnym molotom - 1.
// Solevarnya ostayotsya: na beregu sol' iz morya, vdali ot morya - iz shakhty.
mods.ic2.Macerator.addRecipe(<zavod:salt> * 2, <zavod:rock_salt>);

recipes.addShapeless(<zavod:salt>, [<zavod:rock_salt>, <IC2:itemToolForgeHammer>.anyDamage()]);

// ====================================================================================
// ALYuMINIY (Zavod 1.41): boksit (laterity, karst) ili glina -> sul'fat alyuminiya -> ammiak -> glinozyom -> elektroliz.
// Elektrolizyor Kholla-Eru: stal'naya vanna s ugol'noy futerovkoy (koksovye bloki), mednye shiny (plotnaya med'),
// vysokovol'tnyy transformator IC2 (tok ogromnyy), kotyol - vanna rasplava.
// ====================================================================================
recipes.addShaped(<zavod:aluminum_cell>, [
    [<ore:plateSteel>,      <IC2:blockElectric:5>, <ore:plateSteel>],
    [<Railcraft:cube:0>,    <minecraft:cauldron>,  <Railcraft:cube:0>],
    [<IC2:itemDensePlates:0>, <Railcraft:cube:0>,  <IC2:itemDensePlates:0>]
]);
// Boksit v pechi ne plavitsya: alyuminiy - tol'ko cherez khimiyu i tok.

// ====================================================================================
// SKVAZhINA FRASHA (Zavod 1.43): tri truby odna v drugoy - par vniz, vozdukh, zhidkaya sera vverkh.
// Bol'shaya, srednyaya i malaya stal'nye truby, stal'naya obvyazka. Plavit samorodnuyu seru parom pod soboy.
// ====================================================================================
recipes.addShaped(<zavod:frasch_well>, [
    [<ore:plateSteel>, <zavod:pipe_steel_large>,  <ore:plateSteel>],
    [<ore:plateSteel>, <zavod:pipe_steel_medium>, <ore:plateSteel>],
    [<ore:plateSteel>, <zavod:pipe_steel>,        <ore:plateSteel>]
]);

// Vozdukhorazdelitel'naya ustanovka Linde (Zavod 1.55): kompressor (stal'nye shesterni, ot vala), mednyy protivotochnyy
// teploobmennik (teploprovodnik IC2 + mednye plastiny), rektifikatsionnaya kolonna (bak BC), korpus mashiny IC2.
// Voda (okhlazhdenie kompressora) -> azot v bak; kislorod kopitsya (potrebitel' - raketa, B6).
mods.forestry.Carpenter.addRecipe(<zavod:air_separator>, [
    [<ore:plateSteel>,  <IC2:itemRecipePart:5>,          <ore:plateSteel>],
    [<ore:plateCopper>, <BuildCraft|Factory:tankBlock>,  <ore:plateCopper>],
    [<ore:gearSteel>,   <IC2:blockMachine>,              <ore:gearSteel>]
], 200);

// ====================================================================================
// SKIPIDAR (Zavod 1.56.12): kamfora -> tselluloid, kraska, voskovaya propitka. Lak - sm. electronics.zs (dubli na skipidare).
// Kamfora - khimreaktor Zavod: 500 mB skipidara + 100 mB azotnoy kisloty + par -> 2 kamfory.
// ====================================================================================
// Tsellyuloidnaya fotoplyonka (Khayatt 1870, Istmen 1889): nitrotsellyuloza + kamfora na spirtu, svetochuvstvitel'nyy sloy - serebro
mods.forestry.Carpenter.addRecipe(<zavod:celluloid_film> * 4, [
    [<zavod:nitrocellulose>, <zavod:camphor>,  <zavod:nitrocellulose>],
    [null,                   <ore:dustSilver>, null]
], <liquid:bioethanol> * 250, 60);
// Zhyoltaya kraska: svintsovyy kron (khromat svintsa) na skipidare
mods.forestry.Carpenter.addRecipe(<zavod:paint_yellow> * 4, [
    [<ore:dustLead>, <ore:dyeYellow>]
], <liquid:turpentine> * 100, 40);
// Voshchyonaya parusina: sherst' propityvayut rastvorom voska v skipidare
mods.forestry.Carpenter.addRecipe(<zavod:waxed_canvas> * 2, [
    [<minecraft:wool:*>, <ore:itemBeeswax>, <minecraft:wool:*>]
], <liquid:turpentine> * 100, 40);
// Tkanye ryukzaki Forestry: vmesto almaza - voshchyonaya parusina (nepromokaemyy klapan)
mods.forestry.Carpenter.removeRecipe(<Forestry:minerBagT2>);
mods.forestry.Carpenter.addRecipe(<Forestry:minerBagT2>, [[<Forestry:craftingMaterial:3>, <zavod:waxed_canvas>, <Forestry:craftingMaterial:3>], [<Forestry:craftingMaterial:3>, <Forestry:minerBag>, <Forestry:craftingMaterial:3>], [<Forestry:craftingMaterial:3>, <Forestry:craftingMaterial:3>, <Forestry:craftingMaterial:3>]], <liquid:water> * 1000, 200);
mods.forestry.Carpenter.removeRecipe(<Forestry:diggerBagT2>);
mods.forestry.Carpenter.addRecipe(<Forestry:diggerBagT2>, [[<Forestry:craftingMaterial:3>, <zavod:waxed_canvas>, <Forestry:craftingMaterial:3>], [<Forestry:craftingMaterial:3>, <Forestry:diggerBag>, <Forestry:craftingMaterial:3>], [<Forestry:craftingMaterial:3>, <Forestry:craftingMaterial:3>, <Forestry:craftingMaterial:3>]], <liquid:water> * 1000, 200);
mods.forestry.Carpenter.removeRecipe(<Forestry:foresterBagT2>);
mods.forestry.Carpenter.addRecipe(<Forestry:foresterBagT2>, [[<Forestry:craftingMaterial:3>, <zavod:waxed_canvas>, <Forestry:craftingMaterial:3>], [<Forestry:craftingMaterial:3>, <Forestry:foresterBag>, <Forestry:craftingMaterial:3>], [<Forestry:craftingMaterial:3>, <Forestry:craftingMaterial:3>, <Forestry:craftingMaterial:3>]], <liquid:water> * 1000, 200);
mods.forestry.Carpenter.removeRecipe(<Forestry:hunterBagT2>);
mods.forestry.Carpenter.addRecipe(<Forestry:hunterBagT2>, [[<Forestry:craftingMaterial:3>, <zavod:waxed_canvas>, <Forestry:craftingMaterial:3>], [<Forestry:craftingMaterial:3>, <Forestry:hunterBag>, <Forestry:craftingMaterial:3>], [<Forestry:craftingMaterial:3>, <Forestry:craftingMaterial:3>, <Forestry:craftingMaterial:3>]], <liquid:water> * 1000, 200);
mods.forestry.Carpenter.removeRecipe(<Forestry:adventurerBagT2>);
mods.forestry.Carpenter.addRecipe(<Forestry:adventurerBagT2>, [[<Forestry:craftingMaterial:3>, <zavod:waxed_canvas>, <Forestry:craftingMaterial:3>], [<Forestry:craftingMaterial:3>, <Forestry:adventurerBag>, <Forestry:craftingMaterial:3>], [<Forestry:craftingMaterial:3>, <Forestry:craftingMaterial:3>, <Forestry:craftingMaterial:3>]], <liquid:water> * 1000, 200);
mods.forestry.Carpenter.removeRecipe(<Forestry:builderBagT2>);
mods.forestry.Carpenter.addRecipe(<Forestry:builderBagT2>, [[<Forestry:craftingMaterial:3>, <zavod:waxed_canvas>, <Forestry:craftingMaterial:3>], [<Forestry:craftingMaterial:3>, <Forestry:builderBag>, <Forestry:craftingMaterial:3>], [<Forestry:craftingMaterial:3>, <Forestry:craftingMaterial:3>, <Forestry:craftingMaterial:3>]], <liquid:water> * 1000, 200);

// --- Zavod 1.56.37 (A8): pustaya kapsula IC2 - na prokatnom stane (vruchnuyu - molotom, kak bylo) ---
mods.railcraft.Rolling.addShaped(<IC2:itemCellEmpty>, [[<ore:plateTin>, <zavod:solder>]]);
