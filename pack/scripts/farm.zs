// Ferma (Zavod 1.57.26, A34, docs/farm.md): zhivotnovodstvo bez semeystva mashin.
// Stantsiya kormleniya Railcraft (razmnozhenie) - railcraft.zs, bez elektroskhemy.
// Laz dlya molodnyaka (creep gate): detyonysh prolezaet k vykhodnoy grani, vzroslyy net. Zaboynyy stanok na valu - transmission.zs.

// Laz: dva stolba i perekladina na roste vzroslogo, snizu prokhod. Epokha 1, lyubaya poroda.
recipes.addShaped(<zavod:creep_gate> * 2, [
    [<ore:stickWood>, <ore:stickWood>, <ore:stickWood>],
    [<ore:plankWood>, null,            <ore:plankWood>]
]);
