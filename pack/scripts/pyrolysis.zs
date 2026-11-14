// PIROLIZNAYa PECh' (Zavod 1.56.27, SPEC A3): sukhaya peregonka dereva v zheleznykh retortakh.
// ====================================================================================
// Retorta: 64 brevna -> 64 drevesnogo uglya + 2560 mB drevesnogo gaza + 1280 mB kreozota + 6400 mB zhizhki
// (drevesnyy uksus) za 5 minut. Sektsii - v ryad vbok ot golovnoy, do 3 (4 retorty). Pervaya pyataya tsikla - sushka
// bez gaza; dal'she retorta greetsya svoim gazom (odna 50%, kraynyaya 40%, srednyaya 30% gaza). Rastopka - tol'ko
// na sushku pervoy zagruzki; 1000 mB gaza pech' derzhit sebe. Izlishek gaza - v zhidkostnuyu topku Railcraft (1000/vedro).
// Zhizhka - lesokhimiya (1.56.28, woodchem.zs): metanol, atsetat kal'tsiya -> atseton, uksusnaya kislota, formalin, bakelit.
// Energiya: ugol' 160 + kreozot 96 + gaz 40 = 296 tikov < brevna 300.
// ====================================================================================

// Golovnaya retorta: kirpichnaya kladka, zheleznaya retorta, mednyy kondensator, topka.
recipes.addShaped(<zavod:pyrolysis_oven>, [
    [<ore:plateCopper>,        <ore:plateIron>,           <ore:plateCopper>],
    [<ore:plateIron>,          <minecraft:furnace>,       <ore:plateIron>],
    [<minecraft:brick_block>,  <minecraft:brick_block>,   <minecraft:brick_block>]
]);

// Sektsiya: eshchyo odna retorta v kladke; vplotnuyu v ryad vbok ot golovnoy, do 3 sektsiy.
recipes.addShaped(<zavod:pyro_section>, [
    [<minecraft:brick_block>,  <ore:plateIron>,           <minecraft:brick_block>],
    [<ore:plateIron>,          null,                      <ore:plateIron>],
    [<minecraft:brick_block>,  <minecraft:brick_block>,   <minecraft:brick_block>]
]);
