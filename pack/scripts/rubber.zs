// ====================================================================================
//                 REZINA I LATEKS
// Lateks = lipkaya smola IC2 (itemHarz). Rezina = vulkanizirovannyy kauchuk (itemRubber).
// VULKANIZATsIYa - TOL'KO V PAROVOM AVTOKLAVE (mod Zavod): 2 lateksa + sera + par -> 4 reziny,
// faktis (500 mB masla + sera) -> 1 rezina. Vse puti lateksa (geveya, trostnik, sintetika iz nefti,
// topliva i spirta) dayut LATEKS, a ne rezinu. Ekstraktor IC2 rezinu bol'she ne dayot (config/ic2/extractor.ini).
// ====================================================================================

val latex  = <IC2:itemHarz>;
val rubber = <IC2:itemRubber>;

// BYLO: induktsionnaya plavil'nya 2 lateksa + sera -> 3 reziny. Udaleno - vulkanizatsiya v avtoklave.

// --- Kuda eschyo lateks ---
// Lipkiy porshen': lateks kak kley
recipes.addShapeless(<minecraft:sticky_piston>, [<minecraft:piston>, latex]);
// Povodok: veryovka, propitannaya lateksom
recipes.addShaped(<minecraft:lead> * 2, [
    [<minecraft:string>, <minecraft:string>, null],
    [<minecraft:string>, latex,              null],
    [null,               null,               <minecraft:string>]
]);

// ====================================================================================
//                 REZINOVYE UPLOTNITELI: vsyo, chto derzhit zhidkost'
// ====================================================================================
// Bak BuildCraft (Zavod 1.56.5): klyopanyy zheleznyy bak so smotrovym steklom na rezinovoy prokladke, 4 vedra
// (yomkost' - zavod.jar, config/zavod.cfg tanks). Bylo: 8 stekla -> stekljannyy bak na 16 vyoder.
recipes.remove(<BuildCraft|Factory:tankBlock>);
recipes.addShaped(<BuildCraft|Factory:tankBlock>, [
    [<ore:plateIron>, <minecraft:glass_pane>, <ore:plateIron>],
    [<ore:plateIron>, rubber,                 <ore:plateIron>],
    [<ore:plateIron>, <ore:plateIron>,        <ore:plateIron>]
]);

// Universal'naya kapsula IC2: olovyannyy korpus, smotrovoe okno, rezinovaya probka
recipes.remove(<IC2:itemFluidCell>);
recipes.addShaped(<IC2:itemFluidCell>, [
    [null,      <ore:plateTin>,   null],
    [<ore:plateTin>, <ore:paneGlass>, <ore:plateTin>],
    [null,      rubber,           null]
]);
