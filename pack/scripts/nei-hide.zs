// ====================================================================================
// NEI: SPRYATAT' VYREZANNOE
// Predmety bez retsepta i bez luta - tol'ko zasoryayut spisok NEI i poisk.
// Na igru ne vliyaet: tvorcheskiy rezhim i komandy /give ikh po-prezhnemu vidyat.
// ====================================================================================

// IC2: teleporter, starye vodyanaya mel'nitsa i vetryak (EU v obkhod kinetiki), obychnyy Miner
mods.nei.NEI.hide(<IC2:blockMachine2:0>);
mods.nei.NEI.hide(<IC2:blockGenerator:2>);
mods.nei.NEI.hide(<IC2:blockGenerator:4>);
mods.nei.NEI.hide(<IC2:blockMachine:7>);
// IC2: generator na tvyordom toplive (pechka -> EU) - vyrezan v 1.28.0
mods.nei.NEI.hide(<IC2:blockGenerator>);

// Railcraft: ognennyy kamen' (vechnoe toplivo)
mods.nei.NEI.hide(<Railcraft:firestone.cut>);
mods.nei.NEI.hide(<Railcraft:firestone.refined>);

// TE: tesserakt i ego rama, teleportatsionnaya plita, rezonansnyy taynik

// BiblioCraft: vechnaya pila (zamenena nozhovkoy Zavod)
mods.nei.NEI.hide(<BiblioCraft:item.FramingSaw>);

// Pam's HarvestCraft: rynok (zhivotnye i sazhentsy za izumrudy) i lovushka na zhivotnykh (dobycha iz nichego) - vyrezany (harvestcraft.zs). Rybolovnaya lovushka ostavlena.
// (V KONTsE FAYLA: esli ID Pam's ne sovpadut, upadyot tol'ko etot blok)
mods.nei.NEI.hide(<harvestcraft:market>);
mods.nei.NEI.hide(<harvestcraft:animaltrap>);

// Flan's WW2: pustynnaya i zimnaya forma v sborku ne vkhodyat (v pake tol'ko pyat' osnovnykh armiy, MobGear).
// BYLO: skrytie 16 nesuschestvuyuschikh predmetov - NPE, ostatok fayla ne vypolnyalsya.
// Armeyskaya forma WW2 (Zavod 1.56.52, A17): retseptov net, tol'ko trofey (MobGear, gvardiya forta) - skryta.
// Kaska russianHelmet - tozhe (zamenena shlemom spetsnaza, flans.zs). Neytral'naya forma - spetsnaz (Flan/zavod_uniform).
mods.nei.NEI.hide(<flansmod:russianHelmet>); mods.nei.NEI.hide(<flansmod:russianCoat>); mods.nei.NEI.hide(<flansmod:russianPants>); mods.nei.NEI.hide(<flansmod:russianBoots>);
mods.nei.NEI.hide(<flansmod:germanHelmet>); mods.nei.NEI.hide(<flansmod:germanCoat>); mods.nei.NEI.hide(<flansmod:germanPants>); mods.nei.NEI.hide(<flansmod:germanBoots>);
mods.nei.NEI.hide(<flansmod:americanHelmet>); mods.nei.NEI.hide(<flansmod:americanCoat>); mods.nei.NEI.hide(<flansmod:americanPants>); mods.nei.NEI.hide(<flansmod:americanBoots>);
mods.nei.NEI.hide(<flansmod:britishHelmet>); mods.nei.NEI.hide(<flansmod:britishCoat>); mods.nei.NEI.hide(<flansmod:britishPants>); mods.nei.NEI.hide(<flansmod:britishBoots>);
mods.nei.NEI.hide(<flansmod:japaneseHelmet>); mods.nei.NEI.hide(<flansmod:japaneseCoat>); mods.nei.NEI.hide(<flansmod:japanesePants>); mods.nei.NEI.hide(<flansmod:japaneseBoots>);

// Zavod: rasstrelyannoe oruzhie (vnutri - samo oruzhie s NBT; bez NBT v spiske NEI - pustyshka)
mods.nei.NEI.hide(<zavod:worn_weapon>);

// B1 (Zavod 1.56.53): generatory bez svoey nishi - retsepty snyaty (v svoikh faylakh), tut skryty.
// IC2: geotermal'nyy, Stirling, kineticheskiy Stirling (teplo -> EU v obkhod para)
mods.nei.NEI.hide(<IC2:blockGenerator:1>);
mods.nei.NEI.hide(<IC2:blockGenerator:8>);
mods.nei.NEI.hide(<IC2:blockKineticGenerator:5>);
// BuildCraft: Stirling. Forestry: torfyanoy i biogazovyy dvigateli, biogenerator
mods.nei.NEI.hide(<BuildCraft|Core:engineBlock:1>);
mods.nei.NEI.hide(<Forestry:engine:1>);
mods.nei.NEI.hide(<Forestry:engine:2>);
mods.nei.NEI.hide(<Forestry:engine:3>);
// Railcraft: parovye dvigateli (dubl' para -> privoda) i parovaya turbina s detalyami (par -> EU - turbina Zavod)
mods.nei.NEI.hide(<Railcraft:machine.beta:7>);
mods.nei.NEI.hide(<Railcraft:machine.beta:8>);
mods.nei.NEI.hide(<Railcraft:machine.beta:9>);
mods.nei.NEI.hide(<Railcraft:machine.alpha:1>);
mods.nei.NEI.hide(<Railcraft:part.turbine.blade>);
mods.nei.NEI.hide(<Railcraft:part.turbine.disk>);
mods.nei.NEI.hide(<Railcraft:part.turbine.rotor>);
// Zavod: reduktor parovoy turbiny RC (M35) - bez turbiny RC ne nuzhen
mods.nei.NEI.hide(<zavod:turbine_gear>);

// Hi-Power (1.56.64): tekstura i rol' = Colt -> ostaetsya Colt; retseptov net (flans.zs)
mods.nei.NEI.hide(<flansmod:hipower>); mods.nei.NEI.hide(<flansmod:hipowerAmmo>);
