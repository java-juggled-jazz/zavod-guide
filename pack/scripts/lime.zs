// IZVESTNYaK, MEL, IZVEST' (Zavod 1.56.48, SPEC A13).
// ====================================================================================
// Izvestnyak (zavod:limestone) - osadochnaya poroda u poverkhnosti: plasty na ravninakh, kholmakh i beregakh,
// v gorakh i pustyne rezhe (config/cofh/world/zavod-limestone.json). Kirka lyubaya, vypadaet sam.
// Mel (zavod:chalk): molotom v verstake 2, rudnaya tolcheya 3 (zavod.jar), matserator IC2 3.
// Negashyonaya izvest' (zavod:quicklime): obzhig mela ili izvestnyaka v pechi.
// Izvestkovoe moloko: voda + izvest' v bochke, srazu (zavod.jar, Ferment) -> neytralizatsiya zhizhki v khimreaktore.
// ====================================================================================

val limestone = <zavod:limestone>;
val chalk = <zavod:chalk>;
val quicklime = <zavod:quicklime>;
val hammer = <IC2:itemToolForgeHammer>.anyDamage();

// Mel vruchnuyu: kuvaldoy po kusku izvestnyaka (mashinoy - tolcheya, ona daet bol'she).
recipes.addShapeless(chalk * 2, [limestone, hammer]);
mods.ic2.Macerator.addRecipe(chalk * 3, limestone);

// Obzhig izvesti (CaCO3 -> CaO, ~900 C): obychnaya pech'; kusok izvestnyaka - 2 izvesti, mel - 1.
furnace.addRecipe(quicklime, chalk);
furnace.addRecipe(quicklime * 2, limestone);

// Izvestkovyy beton (gidravlicheskaya izvest', do portlandtsementa): armatura + graviy + pesok + 2 izvesti + voda.
recipes.addShaped(<Railcraft:cube:1> * 8, [
    [<Railcraft:part.rebar>, <minecraft:gravel>,       <Railcraft:part.rebar>],
    [quicklime,              <minecraft:water_bucket>, quicklime],
    [<Railcraft:part.rebar>, <minecraft:sand>,         <Railcraft:part.rebar>]
]);
