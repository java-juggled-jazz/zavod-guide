// LESOKhIMIYa (Zavod 1.56.28, SPEC A3): potrebiteli zhizhki piroliznoy pechi.
// Khimreaktor Zavod (v mode, ne zdes'):
//   zhizhka 1000 + drevesnaya zola ili mel + par -> 100 metanola + 1 atsetat kal'tsiya
//   2 atsetata kal'tsiya + par -> 250 atsetona + 1 mel (mel - snova na neytralizatsiyu)
//   4 nitrotsellyulozy + 250 atsetona + par -> 5 bezdymnogo porokha + 150 atsetona (A12)
//   metanol 500 + voda 500 + par -> 1000 formal'degida (formalin)
//   kreozot 1000 + schyolok 500 + par -> 500 fenola
//   fenol 250 + formal'degid 250 + par -> 2 bakelita (Bakeland, 1907)
//   fenol 250 + nitruyuschaya smes' 1000 + 2 bumagi + par -> 3 TNT (melinit / shimoza)
//   distillyat 1000 + metanol 250 + par -> 1000 khladagenta IC2 (antifriz)
// Retorta Zavod: atsetat kal'tsiya + 500 sernoy -> 500 uksusnoy kisloty (gips ostayotsya).
// Zdes' - plotnik Forestry: getinaks na bakelite, atsetatnaya plyonka.

val bakelite = <zavod:bakelite>;

// Getinaks na bakelitovoy smole (Westinghouse, 1910-e): bumaga, propitannaya rezolom, pressuetsya goryachey.
// Protiv kreozotovogo (forestry-organics.zs): 1 bakelit vmesto 250 mB kreozota, plat 4 vmesto 2.
// Zavod 1.57.13: provodniki - golyy provod IC2 s voloki po klassu platy (olovo / med' / med' + kondensator / zoloto),
// payka - pripoy. BYLO: 3 slitka metalla + redstoun (sm. forestry-organics.zs, tam zhe snyaty rodnye retsepty Forestry).
mods.forestry.Carpenter.addRecipe(<Forestry:chipsets> * 4, [
    [<minecraft:paper>, <minecraft:paper>,  <minecraft:paper>],
    [<zavod:solder>,    <IC2:itemCable:10>, <zavod:solder>],
    [<minecraft:paper>, bakelite,           <minecraft:paper>]
], 40);
mods.forestry.Carpenter.addRecipe(<Forestry:chipsets:1> * 4, [
    [bakelite,          <IC2:itemCable:1>, <minecraft:paper>],
    [<zavod:solder>,    <IC2:itemCable:1>, <zavod:solder>],
    [<minecraft:paper>, <IC2:itemCable:1>, <minecraft:paper>]
], 40);
mods.forestry.Carpenter.addRecipe(<Forestry:chipsets:2> * 4, [
    [bakelite,          <IC2:itemCable:1>,       <minecraft:paper>],
    [<zavod:solder>,    <zavod:capacitor_paper>, <zavod:solder>],
    [<minecraft:paper>, <IC2:itemCable:1>,       <minecraft:paper>]
], 80);
mods.forestry.Carpenter.addRecipe(<Forestry:chipsets:3> * 4, [
    [bakelite,          <IC2:itemCable:2>,       <minecraft:paper>],
    [<zavod:solder>,    <zavod:capacitor_paper>, <zavod:solder>],
    [<minecraft:paper>, <IC2:itemCable:2>,       <minecraft:paper>]
], 80);

// Bakelitovaya (tekstolitovaya) shesternya (Zavod 1.57.13): goryachee pressovanie v plotnike. Tikhaya, trenie nizkoe,
// smazka ne nuzhna - dlya lyogkikh uzlov (kontroller i szhimayuschiy shkaf yaschikov, shiber silosa). V tyazhyolye peredachi - net.
mods.forestry.Carpenter.addRecipe(<zavod:gear_bakelite> * 2, [
    [null,     bakelite, null],
    [bakelite, null,     bakelite],
    [null,     bakelite, null]
], 40);

// Bezdymnyy porokh na atsetone (kordit, Abel' i D'yuar, 1889) - v khimreaktore Zavod (A12, 1.56.44):
// 4 nitrotsellyulozy + 250 atsetona + par -> 5 porokha + 150 atsetona nazad (rashod 100 na 5, kak bylo v plotnike).

// Atsetatnaya (bezopasnaya) plyonka (Eastman Kodak, 1909): tsellyuloza + uksusnaya kislota, bez azotnoy i kamfory.
// Ne gorit, kak tselluloid - ta zhe fotoplyonka dlya sputnikov.
mods.forestry.Carpenter.addRecipe(<zavod:celluloid_film> * 4, [
    [<Forestry:woodPulp>, <Forestry:woodPulp>, <Forestry:woodPulp>],
    [null,                <ore:dustSilver>,    null]
], <liquid:aceticacid> * 500, 60);
