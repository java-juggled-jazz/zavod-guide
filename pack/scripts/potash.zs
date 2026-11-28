// ZOLA I POTASh (Zavod 1.56.25, SPEC A2): zol'niki topok, zol'nyy chan, potash, ugol'naya zola v beton.
// ====================================================================================
// Topki: drova i drevesnyy ugol' -> drevesnaya zola Forestry (potash), kamennyy ugol' i koks -> ugol'naya zola
// (zavod:coal_ash). Kotyol Railcraft kladyot zolu v vykhodnoy slot (voronka/truba snizu), nashi pechi - v slot zoly;
// zol'nik polon - ogon' gasnet. Zol'nyy chan: 8 zoly + 1000 vody -> 1000 schyoloka; schyolok vyparivayut na solevarne
// (ogon' ili par) ili v vyparnom apparate -> 2 potasha. Selitryanitsa: 1 potash = 4 partii (kak 4 zoly).
// ====================================================================================

// Zol'nyy chan: dubovaya bochka na zheleznykh obruchakh, lozhnoe dno s solomoy (fil'tr).
recipes.addShaped(<zavod:leach_vat>, [
    [<ore:plankWood>, null,               <ore:plankWood>],
    [<ore:plateIron>, <minecraft:wheat>,  <ore:plateIron>],
    [<ore:plankWood>, <ore:slabWood>,     <ore:plankWood>]
]);

// Kaliynoe udobrenie: potash + pesok-napolnitel' (kak ammiachnaya selitra).
recipes.addShapeless(<Forestry:fertilizerCompound> * 4, [<zavod:potash>, <minecraft:sand>, <minecraft:sand>]);

// Kaliynoe (kronovoe) steklo: pesok + potash v induktsionnoy plavil'ne -> opticheskoe steklo (linzy, laboratornaya posuda).

// Beton s ugol'noy zoloy (puccolanovaya dobavka - ekonomit tsement): armatura + graviy + pesok + zola + voda.
// Railcraft: 4 armatury + 5 kamnya -> 8; s zoloy - 12.
recipes.addShaped(<Railcraft:cube:1> * 12, [
    [<Railcraft:part.rebar>, <minecraft:gravel>,       <Railcraft:part.rebar>],
    [<zavod:coal_ash>,       <minecraft:water_bucket>, <zavod:coal_ash>],
    [<Railcraft:part.rebar>, <minecraft:sand>,         <Railcraft:part.rebar>]
]);
