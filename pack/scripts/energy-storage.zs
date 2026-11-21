// ====================================================================================
// ENERGOKhRANILISchA: IC2, Thermal Expansion
// POChEMU: energosistema stroitsya pod potreblenie + nebol'shoy zapas, a ne pod beskonechnyy sklad.
// TEPER': kazhdyy sleduyuschiy uroven' sobiraetsya IZ predyduschego (i iz sosednego moda).
//   Skleit' bol'shoy nakopitel' iz malen'kikh = rovno ta zhe yomkost', ekonomii masshtaba net.
// Deshyovyy, no medlennyy i s poteryami bufer - elektrolizyor IC2 ryadom s khranilischem IC2
//   (vodorod v kapsulakh, sm. README).
// ====================================================================================

// ---------- obschie komponenty ----------
val plateLead    = <ore:plateLead>;
val plateBronze  = <ore:plateBronze>;
val plateSteel   = <ore:plateSteel>;

val tinCable     = <IC2:itemCable:13>;          // izolirovannyy olovyannyy kabel'
val copperCable  = <IC2:itemCable>;             // izolirovannyy mednyy kabel'
val goldCable    = <IC2:itemCable:3>;           // izolirovannyy zolotoy kabel'
val machineFrameIC2 = <IC2:blockMachine>;
val advCasing    = <IC2:blockMachine:12>;
val circuitIC2   = <IC2:itemPartCircuit>;
val reBattery    = <IC2:itemBatREDischarged> | <IC2:itemBatRE:*>;
val advBattery   = <IC2:itemAdvBat:*>;
val energyCrystal = <IC2:itemBatCrystal:*>;
val lapotron     = <IC2:itemBatLamaCrystal:*>;

val batBox  = <IC2:blockElectric>;
val cesu    = <IC2:blockElectric:7>;
val mfe     = <IC2:blockElectric:1>;
val mfsu    = <IC2:blockElectric:2>;
val mvTransformer = <IC2:blockElectric:4>;
val hvTransformer = <IC2:blockElectric:5>;

// ====================================================================================
// 1. AKKUMULYaTOR RE (IC2) - SVINTsOVO-KISLOTNYY
// BYLO: 4 olovyannye obolochki + 2 redstouna. TEPER': svintsovye plastiny + sera (elektrolit).
// 1.30.1: i redstouna bol'she net - v akkumulyatore ego ne byvaet. Aktivnaya massa - svintsovaya pyl'.
// ====================================================================================
recipes.remove(<IC2:itemBatREDischarged>);
// Korpus - ebonit (rezina + sera, tvyordaya vulkanizatsiya): tak delali korpusa nastoyaschikh akkumulyatorov.

// Akkumulyator RE - tol'ko plotnik: zalivka elektrolita (sera + distillirovannaya voda). Vruchnuyu ne sobrat'.
mods.forestry.Carpenter.addRecipe(<IC2:itemBatREDischarged> * 2, [
    [null,            <IC2:itemCable:13>,   null],
    [<ore:plateLead>, <ore:dustLead>,       <ore:plateLead>],   // aktivnaya massa: svintsovyy poroshok (pasta Fora, 1881), pri formovke - dioksid svintsa
    [<ore:plateLead>, <ore:dustSulfur>,     <ore:plateLead>]
], <liquid:ic2distilledwater> * 250, 40);

// ====================================================================================
// 2. KhRANILISchA IC2: BatBox -> CESU -> MFE -> MFSU (kazhdoe vnutri sleduyuschego)
// ====================================================================================
// BatBox: BYLO derevyannyy yaschik. TEPER' korpus mashiny v svintsovoy obshivke.
recipes.remove(batBox);
recipes.addShaped(batBox, [
    [plateLead, tinCable,        plateLead],
    [reBattery, machineFrameIC2, reBattery],
    [plateLead, reBattery,       plateLead]
]);

// CESU: BatBox + 2 prodvinutykh akkumulyatora + skhema, bronzovyy korpus
recipes.remove(cesu);
recipes.addShaped(cesu, [
    [plateBronze, copperCable, plateBronze],
    [advBattery,  batBox,      advBattery],
    [plateBronze, circuitIC2,  plateBronze]
]);

// MFE: CESU + 4 energokristalla + MV-transformator, stal'noy korpus
recipes.remove(mfe);
recipes.addShaped(mfe, [
    [energyCrystal, goldCable,     energyCrystal],
    [plateSteel,    cesu,          plateSteel],
    [energyCrystal, mvTransformer, energyCrystal]
]);

// MFSU: MFE + 6 lapotronov + HV-transformator + prodvinutyy korpus
recipes.remove(mfsu);
recipes.addShaped(mfsu, [
    [lapotron, hvTransformer, lapotron],
    [lapotron, mfe,           lapotron],
    [lapotron, advCasing,     lapotron]
]);

// ====================================================================================
// 4. ENERGOYaChEYKI Thermal Expansion (svintsovaya -> ukreplyonnaya -> redstounovaya -> rezonansnaya)
// Kazhdaya yacheyka = 2 predyduschie v svoey ramke + katushki. Uluchshenie "na meste" ubrano.
// Ramki: Frame:4 bazovaya, :5 ukreplyonnaya, :7 redstounovaya (zapolnennaya), :9 rezonansnaya (zapolnennaya)
// ====================================================================================

// ====================================================================================
// 5. OBKhODY (V KONTsE FAYLA: esli ID ne naydyotsya, upadyot tol'ko eta stroka)
// Nabor uluchsheniya MFSU prevraschal MFE v MFSU gaechnym klyuchom v obkhod novogo retsepta.
// ====================================================================================
recipes.remove(<IC2:itemupgradekit>);

// ====================================================================================
// ODNORAZOVAYa BATAREYKA IC2 (Zavod 1.35): BYLO redstoun + ugol'naya pyl'. TEPER' - mednozheleznyy element
// na mednom kuporose (kak element Daniel'ya, tsinka v sborke net - vmesto nego zhelezo): zheleznaya plastina
// vytesnyaet med' iz kuporosa, mezhdu nimi - tok.
// ====================================================================================
recipes.remove(<IC2:itemBatSU>);
recipes.addShaped(<IC2:itemBatSU> * 3, [
    [<IC2:itemCable:13>],
    [<zavod:copper_vitriol>],
    [<ore:plateIron>]
]);
