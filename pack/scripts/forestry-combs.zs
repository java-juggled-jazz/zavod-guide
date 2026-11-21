// ====================================================================================
// SOTY FORESTRY: BEZ POROKHA I BEZ LAVY
// Poroshkovye soty (beeCombs:10) davali 90% porokha - obkhod vsey selitro-sernoy tsepochki. TEPER': myod + vosk.
// Tleyushchie soty (beeCombs:2) dayut fosfor, a fosfor v soke-vyzhimalke prevrashchalsya v LAVU
// (2 fosfora + pesok/zemlya/bulyzhnik -> 1600-2000 mB) - pchyolnaya ferma = beskonechnaya lava dlya dinamo. Vyrezano.
// Fosfor teper' - fosfornoe udobrenie: 2 fosfora + sera + 500 mB vody -> 4 slozhnykh udobreniya (kak superfosfat).
// ====================================================================================

mods.forestry.Centrifuge.removeRecipe(<Forestry:beeCombs:10>);
mods.forestry.Centrifuge.addRecipe(20, <Forestry:beeCombs:10>, [<Forestry:honeyDrop>, <Forestry:beeswax>], [40, 40]);
mods.forestry.Squeezer.removeRecipe(<liquid:lava>);
mods.forestry.Carpenter.addRecipe(<Forestry:fertilizerCompound> * 4, [[<Forestry:phosphor>, <Forestry:phosphor>]], <liquid:sulfuricacid> * 500, 40);
