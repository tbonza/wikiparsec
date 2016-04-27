{-# LANGUAGE NoImplicitPrelude, OverloadedStrings #-}

import WikiPrelude
import Test.HUnit
import Text.MediaWiki.Wiktionary.Base
import Text.MediaWiki.Wiktionary.German

catEntry :: Text
catEntry = unlines [
   "{{Wort der Woche|40|2006}}",
   "== Katze ({{Sprache|Deutsch}}) ==",
   "=== {{Wortart|Substantiv|Deutsch}}, {{f}} ===",
   "",
   "{{Deutsch Substantiv Übersicht",
   "|Genus=f",
   "|Nominativ Singular=Katze",
   "|Nominativ Plural=Katzen",
   "|Genitiv Singular=Katze",
   "|Genitiv Plural=Katzen",
   "|Dativ Singular=Katze",
   "|Dativ Plural=Katzen",
   "|Akkusativ Singular=Katze",
   "|Akkusativ Plural=Katzen",
   "|Bild 1=Cat03.jpg|mini|1|''Katze'' mit rötlichem Fell",
   "|Bild 2=Himalayan Persian.jpg|mini|1|langhaarige ''Katze''",
   "}}",
   "",
   "{{Nebenformen}}",
   ":[[Katz]]",
   "",
   "{{Worttrennung}}",
   ":Kat·ze, {{Pl.}} Kat·zen",
   "",
   "{{Aussprache}}",
   ":{{IPA}} {{Lautschrift|ˈkaʦə}}",
   ":{{Hörbeispiele}} {{Audio|De-Katze.ogg}}, {{Audio|De-at-Katze.ogg|spr=at}}",
   ":{{Reime}} {{Reim|aʦə|Deutsch}}",
   "",
   "{{Bedeutungen}}",
   ":[1] dem [[Mensch]]en [[verbunden]]es, [[anschmiegsam]]es [[Haustier]] (''Felis silvestris catus''), in zahlreichen Rassen gezüchtet",
   "::[a] speziell das [[Weibchen]]",
   ":[2] ein [[Teil]] eines [[Brückenkran]]es",
   ":[3] ''Plural, [[Zoologie]]:'' eine [[Familie]] (Félidae) der [[Raubtier]]e",
   "",
   "{{Herkunft}}",
   ":seit dem 9. Jahrhundert belegt; [[althochdeutsch]] ''kazza'' f., ''kazzo'' m., aus [[lateinisch]] ''catta'' (Martial, um 75 n. Chr.) entlehnt, von einer nordafrikanischen Sprache übernommen, vergleiche [[nubisch]] ''kadīs'', [[berberisch]] ''kaddîska'', letzlich aus spät[[ägyptisch]]er ''čaute'' f.,<ref>Jean-Paul Savignac: ''Dictionnaire français-gaulois'', Stichwort: „chat“. Errance, Paris 2004, Seite 82.</ref> ''čaus'' m. ‚Falbkatze‘ stammt.<ref>{{Lit-Pfeifer: Etymologisches Wörterbuch|A=8}}</ref>",
   "",
   "{{Synonyme}}",
   ":[1] [[Hauskatze]] (''Felis catus'', ''Felis domestica''), [[Stubentiger]], [[Dachhase]], [[Mieze]], [[Miezekatze]], [[Büsi]]",
   "::[1a] [[Kätzin]], die Katze [[Murner]] in der [[Fabel]]",
   ":[2] [[Laufkatze]]",
   "",
   "{{Weibliche Wortformen}}",
   ":[1] [[Kätzin]]",
   "",
   "{{Männliche Wortformen}}",
   ":[1, 1a] [[Kater]]",
   "",
   "{{Verkleinerungsformen}}",
   ":[[Kätzchen]], [[Kätzlein]]",
   "",
   "{{Oberbegriffe}}",
   ":[1] [[Haustier]], [[Säugetier]]",
   "",
   "{{Unterbegriffe}}",
   ":[1] ''nach Geschlecht:'' [[Kater]], [[Kätzin]]",
   ":[1] ''nach Rasse:'' [[Angorakatze]], [[Heilige Birma]], [[Britisch Kurzhaar]], [[Europäisch Kurzhaar]], [[Perserkatze]], [[Siamkatze]]",
   ":[1] [[Schmusekatze]], [[Schmusekätzchen]]",
   ":[1] ''übertragen:'' [[Geldkatze]]",
   ":[3] [[Raubkatze]]",
   ":[3] ''Arten:'' [[Andenkatze]] (''Oreailurus jacobitus''), [[Angorakatze]] (''Felis maniculata angorensis''), [[Bengalkatze]] (''Prionailurus bengalensis''), [[Borneokatze]] (Catopuma badia), [[Chilenische Waldkatze]] (''Oncifelis guigna''), [[Falbkatze]] (''Felis (silvestris) libyca''), [[Fischkatze]] (''Prionailurus viverrinus''/Felis v.), [[Flachkopfkatze]] (''Prionailurus planiceps''), [[Gepard]] (Unterfamilie ''Acinonyxchinae''), (afrikanische) [[Goldkatze]] (''Profelis aurata''), [[Großkatze]] (''Pantherinae''), [[Iriomotekatze]] (''Prionailurus bengalensis iriomotensis''); (''Prionailurus iriomotensis''), [[Jaguar]] (''Panthera onca''), [[Karakal]] (''Caracal caracal''), [[Leopard]] (''Panthera pardus''), [[Löwe]] (''Panthera leo''), [[Luchs]] (''Lynx lynx'', auch: ''Felis lynx''), [[Manul]] (''Otocolobus manul''), [[Marguay]] (''Leopardus wiedii''), [[Marmorkatze]] (''Felis marmorata''), [[Nebelparder]] (''Neofelis nebulosa''), [[Ozelot]] (''Leopardus pardalis''), [[Ozelotkatze]] (''Leopardus tigrinus''), [[Pampaskatze]] (''Oncifelis colocolo''), [[Puma]] (''Puma concolor''), [[Rohrkatze]] (''Felis chaus''), [[Rostkatze]] (''Prionailurus rubiginosus''), [[Säbelzahnkatze]] (''Machairodontinae''), [[Salzkatze]] (''Oncifelis geoffroyi''), [[Sandkatze]] (''Felis margarita''), [[Schleichkatze]] (''Viverridae''), [[Schneeleopard]] (''Uncia uncia''), [[Schwarzfußkatze]] (''Felis nigripes''), [[Serval]] (''Leptailurus serval''),  [[Steppenkatze]] (''Felis ornata''), [[Tiger]] (''Panthera tigris''), [[Vankatze]], [[Wildkatze]] (''Felis silvestris'')",
   "",
   "{{Beispiele}}",
   ":[1] Eine ''Katze'' jagt eine Maus.",
   ":[1] „Doch binnen einer halben Stunde fand sich die ''Katze'' erneut vor dem Amtszimmer des Schatzmeisters ein, weitaus hungriger als vorher.“<ref>{{Literatur | Autor= Philip J. Davis | Titel= Pembrokes Katze | TitelErg= Die wundersame Geschichte über eine philosophierende Katze, ein altes mathematisches Problem und die Liebe| Verlag= Fischer Taschenbuch Verlag | Ort= Frankfurt/Main |Jahr= 1991| Seiten= 19.|ISBN= 3-596-10646-X}} Englisches Original 1988.</ref>",
   ":[1a] Ist das eine ''Katze'' oder ein Kater?",
   ":[2] Der Brückenkran mit seiner ''Katze'' steht in der Montagehalle.",
   ":[3] ''Katzen'' sind Jäger mit sehr guter Nachtsicht.",
   "",
   "{{Redewendungen}}",
   ":''[[Augen auskratzen wie eine Katze]]'' - eine gefährlich werdende (weibliche) Person",
   ":''[[da beißt sich die Katze in den Schwanz]]'' - ''ein Problem'' führt auf sich selbst zurück und kann deshalb nicht gelöst werden; ''ein Beweis'' ist zirkulär",
   ":''[[damit kann man keine Katze mehr hinter dem Ofen hervorlocken]]'' - veraltete bzw. zwecklose Methode, Sache, etc.",
   "",
   "{{Sprichwörter}}",
   ":''[[die Katze lässt das Mausen nicht]]'' - ein (angeborenes) Verhalten kommt immer wieder zum Vorschein",
   ":''[[Ist die Katze aus dem Haus, tanzen die Mäuse auf dem Tisch]]'' - ist die gewöhnliche Autorität abwesend, schlagen alle über die Stränge",
   "::''[[Ist die Katze aus dem Haus, rührt sich die Maus]]'' -",
   "::''[[Ist die Katze aus dem Haus, freut sich die Maus]]'' -",
   ":''[[Käm' eine Katze ins Morgenland, sie würde miauen, wie es hier bekannt]]''. - manche Dinge sind überall gleich",
   ":''[[nachts sind alle Katzen grau]]''. - ''(Motivierung: nachts sieht das menschliche Auge keine Farben)'' wo Licht fehlt, sieht oder beachtet man die (feinen) Unterschiede nicht; unter besonderen Umständen fallen die üblichen Unterscheidungen zusammen",
   "",
   "{{Charakteristische Wortkombinationen}}",
   ":[1] ''Katzen'' [[fauchen]], [[jagen]], [[lauern]], [[kratzen]], [[mausen]], [[mau(n)zen]], [[miauen]], [[schlecken]], (herum-/umher-)[[schleichen]], [[schmusen]], [[schnurren]]",
   ":[1] (die) ''Katze'' im [[Sack]], (die) ''Katze'' aus dem Sack, , wie eine ''Katze'', die ''Katze'' auf dem [[heiß]]en [[Blechdach]], wie [[Hund]] und ''Katz'', die ''Katze'' im Sack [[kaufen]], wie die ''Katze'' um den [[heiß]]en [[Brei]], die ''Katze'' aus dem Sack [[lassen]], wie die ''Katze'' auf die [[Füße]] [[fallen]], eine ''Katze'' mag zu einem König aufblicken, eine ''Katze'' mit [[Handschuhen]] [[fängt]] keine [[Mäuse]], der ''Katze'' die [[Schelle]] [[anhängen]], [[schleich]] nicht wie die ''Katze'' um den heißen Brei, eine [[braun]] [[gezeichnete]] ''Katze'', so [[nass]] wie eine [[ertränkte]] ''Katze'', eine ''Katze'' hat ein [[zäh]]es [[Leben]], leben wie Hund und ''Katze'', eine [[verbrüht]]e ''Katze'' [[fürchtet]] [[kalt]]es [[Wasser]], man muss die ''Katze'' nicht im Sack kaufen, wie Hund und ''Katze'' leben, eine ''Katze'' hat [[neun]] [[Leben]], Schmitts ''Katze'', [[Schrödingers Katze|Schrödingers ''Katze'']]",
   ":[1] eine [[abessinisch]]e ''Katze'', {{Audio|De-eine gefleckte Katze.ogg|->}} eine [[gefleckt]]e ''Katze,'' eine [[gestreift]]e ''Katze,'' eine [[getigerte]] ''Katze,'' eine [[schwanzlos]]e ''Katze,'' eine [[schwarz]]e ''Katze''",
   ":[?] [[Neunschwänzige Katze]] (=[[Peitsche]])",
   "",
   "{{Wortbildungen}}",
   ":[[Katzenallergie]], [[Katzenauge]], [[Katzenbaum]], <!--(Kratzbaum) das kann man dann unter Katzenbaum bzw. Kratzbaum schreiben --> [[Katzenbuckel]], [[Katzendreck]], [[Katzenfell]], [[Katzenfutter]], [[Katzengold]], [[Katzengras]], [[Katzenjammer]], [[Katzenjunges]], [[Katzenklappe]], [[Katzenklo]], [[Katzenkonzert]], [[Katzenleukose]], [[Katzenminze]],  [[Katzenmusik]], [[Katzenpfote]], [[Katzenschnupfen]], [[Katzensprung]], [[Katzentisch]], [[Katzenwäsche]]",
   "",
   "==== Übersetzungen ====",
   "{{Ü-Tabelle|Ü-links=",
   "*{{ar|DMG}}:",
   "**{{MHA}}: [1] {{Üxx4|ar|بس|v=بَسّ|d=bass|DMG=0}} {{m}}, {{Üxx4|ar|DMG=0|d=qiṭṭ|v=قِطّ|قط}} {{m}}, {{Üxx4|ar|DMG=0|d=hirr|v=هِرّ|هر}} {{m}}, [1a] {{Üxx4|ar|بسة|v=بَسَّة|d=bassa|DMG=0}} {{f}}, {{Üxx4|ar|DMG=0|d=qiṭṭa|v=قِطَّة|قطة}} {{f}}, {{Üxx4|ar|DMG=0|d=hirra|v=هِرَّة|هرة}} {{f}}, [3] {{Üxx4|ar|سنور|v=سِنَّوْر|d=sinnawr|DMG=0}} {{m}}",
   "**{{ary}}: [1] {{Üxx4|ar|DMG=0|d=qaṭṭ<ref name=\"Moscoso Garcia\">Nach {{Literatur | Autor=Francisco Moscoso García | Titel=Diccionario español – árabe marroquí | Verlag=Junta de Andalucía, Dirección General de Coordinación de Políticas Migratorias | Ort=Sevilla | Jahr=2005 | ISBN=84-689-2464-4 }}, Stichwort »Gato«, Seite 140.</ref>; ''mundartnah:'' qeṭṭ<ref name=\"DMA-ME118\">Mundartnahe Umschrift nach {{Literatur | Herausgeber=Richard S. Harrell; compiled by Thomas Fox, Mohammed Abu-Talib, with the assistance of Ahmed Ben Thami, Allal Chreibi, Habiba Kanouni, Ernest Ligon, Mohammed Mekaoui | Titel=A Dictionary of Moroccan Arabic | TitelErg=Moroccan–English | Verlag=Georgetown University Press | Ort=Washington, D.C. | Jahr=1966 }}, Stichwort »''qeṭṭ''« sowie Stichwort »''qeṭṭa''«, Seite 118.</ref><ref name=\"DMA-EM30\">Mundartnahe Umschrift nach {{Literatur | Herausgeber=Harvey Sobleman, Richard S. Harrell; compilation by Thomas Fox, Alan McAninch, Allal Chreibi, Majid Soussane, Mohamed Neheiri | Titel=A Dictionary of Moroccan Arabic | TitelErg=English–Moroccan | Verlag=Georgetown University Press | Ort=Washington, D.C. | Jahr=1963 }}, Stichwort »cat«, Seite 30.</ref>|v=قَطّ|قط}} {{m}}, {{Üxx4|ar|DMG=0|d=qiṭṭ|v=قِطّ|قط}} {{m}}<ref name=\"Moscoso Garcia\"/>, {{Üxx4|ar|مش|v=مَشّ|d=mašš; ''mundartnah:'' mešš<ref name=\"Moscoso Garcia\"/><ref name=\"DMA-ME88\">Mundartnahe Umschrift nach {{Literatur | Herausgeber=Richard S. Harrell; compiled by Thomas Fox, Mohammed Abu-Talib, with the assistance of Ahmed Ben Thami, Allal Chreibi, Habiba Kanouni, Ernest Ligon, Mohammed Mekaoui | Titel=A Dictionary of Moroccan Arabic | TitelErg=Moroccan–English | Verlag=Georgetown University Press | Ort=Washington, D.C. | Jahr=1966 }}, Stichwort »''mešš, mošš''« sowie Stichwort »''mešša''«, Seite 88.</ref><ref name=\"DMA-EM30\"/>|DMG=0}} {{m}} ~ {{Üxx4|ar|مش|v=مُشّ|d=mušš<ref name=\"Moscoso Garcia\"/>; ''mundartnah:'' mošš<ref name=\"DMA-ME88\"/><ref name=\"DMA-EM30\"/>|DMG=0}} {{m}}, [1a] {{Üxx4|ar|DMG=0|d=qaṭṭa<ref name=\"Moscoso Garcia\"/>; ''mundartnah:'' qeṭṭa<ref name=\"DMA-ME118\"/>|v=قَطَّة|قطة}} {{f}},{{Üxx4|ar|DMG=0|d=qiṭṭa|v=قِطَّة|قطة}} {{f}}<ref name=\"Moscoso Garcia\"/>, {{Üxx4|ar|مشة|v=مَشَّة|d=mašša; ''mundartnah:'' mešša<ref name=\"DMA-ME88\"/><ref name=\"DMA-EM30\"/>|DMG=0}} {{f}}",
   "**{{arz}}: [1] {{Üxx4|ar|DMG=0|d=quṭṭ; ''mundartnah:'' ʾuṭṭ<ref name=\"DEA\">Mundartnahe Umschrift nach {{Literatur | Autor=El-Said Badawi, Martin Hinds | Titel=A Dictionary of Egyptian Arabic | TitelErg=Arabic-English | Verlag=Librairie du Liban | Ort=Beirut | Jahr=1986 }}, Stichwort »{{Arab|قطّ}}« und Stichwort »{{Arab|قطّة}}«, Seite 707.</ref>|v=قُطّ|قط}} {{m}}, [1a] {{Üxx4|ar|DMG=0|d=quṭṭa; ''mundartnah:'' ʾuṭṭa<ref name=\"DEA\"/>|v=قُطَّة|قطة}} {{f}}",
   "**[[w:en:Levantine Arabic|Levantinisches Arabisch]]:",
   "***[[w:Palästinensisch-Arabisch|Palästinensisch-Arabisch]]: [1] {{Üxx4|ar|بس|v=بِسّ|d=biss|DMG=0}} {{m}}<ref name=\"Bauer\">Nach {{Lit-Bauer: Wörterbuch der arabischen Umgangssprache|A=2}}, Stichwort »Kater« und Stichwort »Katze« , Seite 171 sowie Anmerkungen zur Realisierung des [[w:Qaf|Qāf]] Seite ⅩⅣ.</ref>, {{Üxx4|ar|DMG=0|d=quṭṭ; ''mundartnah: städtisch zumeist nur:'' ʾuṭṭ, ''beduinisch sowie in Nazareth, Ostjerusalem:'' guṭṭ, ''fellachisch:'' kuṭṭ|v=قُطّ|قط}} {{m}}<ref name=\"Bauer\"/>, [1a] {{Üxx4|ar|بسة|v=بِسَّة|d=bissa; ''mundartnah:'' bisse<ref name=\"Bauer\"/>|DMG=0}} {{f}}, {{Üxx4|ar|DMG=0|d=quṭṭa; ''mundartnah:'' quṭṭe, ''städtisch zumeist nur:'' ʾuṭṭe, ''beduinisch sowie in Nazareth, Ostjerusalem:'' guṭṭe, ''fellachisch:'' kuṭṭe|v=قُطَّة|قطة}} {{f}}",
   "***[[w:Libanesisch-Arabisch|Libanesisch-Arabisch]]: [1] {{Üxx4|ar|بسين|v=بُسَيْن|d=busayn; ''mundartnah:'' bseyn<ref name=\"Bauer\"/>|DMG=0}} {{m}}, [1a] {{Üxx4|ar|بسينة|v=بُسَيْنَة|d=busayna; ''mundartnah:'' bseyne<ref name=\"Bauer\"/>|DMG=0}} {{f}}  ",
   "***[[w:Syrisch-Arabisch|Syrisch-Arabisch]]: [1] {{Üxx4|ar|DMG=0|d=qaṭṭ|v=قَطّ|قط}} {{m}}<ref name=\"DSA\">{{Literatur | Herausgeber=Karl Stowasser, Moukhtar Ani | Titel=A Dictionary of Syrian Arabic | TitelErg=English–Arabic | Verlag=Georgetown University Press | Ort=Washington, D.C. | Jahr=2004 (Georgetown classics in Arabic language and linguistics) | ISBN=1-58901-105-8 }}, Stichwort »cat«, Seite 36.</ref>, [1a] {{Üxx4|ar|DMG=0|d=qaṭṭa<ref name=\"DSA\"/>; ''mundartnah:'' qaṭṭe ''städtisch zumeist nur:'' ʾaṭṭe, ʾaṭṭi|v=قَطَّة|قطة}} {{f}}",
   "**[[w:Irakisch-Arabisch|Irakisch-Arabisch]]: [1] {{Üxx4|ar|بزون|v=بَزُّون|d=bazzūn|DMG=0}} {{m}}<ref name=\"DIA1967-34\">{{Literatur | Autor=D.R. Woodhead, Wayne Beene (Hrsg.); under the technical direction of Karl Stowasser, with the assistance of Majid Damah, Faisal Al-Khalaf, Husain Mustafa, Darrel Smith, Ronald G. Wolfe | Titel=A Dictionary of Iraqi Arabic | TitelErg=Arabic–English | Verlag=Georgetown University Press | Ort=Washington, D.C. | Jahr=1967 | ISBN=0-87840-281-0 }}, Stichwort »b-z-z-w-n, bazzuun, bazzuuna«, Seite 34.</ref><ref name=\"DIA2003-34\">{{Literatur | Herausgeber=Beverly E. Clarity, Karl Stowasser, Ronald G. Wolfe, D.R. Woodhead, Wayne Beene | Titel=A Dictionary of Iraqi Arabic | TitelErg=English–Arabic Arabic–English | Verlag=Georgetown University Press | Ort=Washington, D.C. | Jahr=2003 | ISBN=0-87840-136-9 }}, Stichwort »b-z-z-w-n, bazzuun, bazzuuna«, Seite 34 (arabisch-englischer Teil).</ref>, [1a] {{Üxx4|ar|بزونة|v=بَزُّونَة|d=bazzūna|DMG=0}} {{f}}<ref name=\"DIA1967-34\"/><ref name=\"DIA2003-34\"/>",
   "*{{hy}} <small>([[w:Armenisches_Alphabet#Buchstaben|DIN 32706]])</small>: [1] {{Üt|hy|կատու|katow}}",
   "*{{az}}: [1] {{Ü|az|pişik}}",
   "*{{eu}}: [1] {{Ü|eu|katu}}",
   "*{{br}}: [1] {{Ü|br|kazh}}",
   "*{{bg}} <small>([[w:ISO 9|ISO 9]])</small>: [1] {{Üt|bg|котка|kótka}}",
   "*{{zh}}:",
   "**[[Hochchinesisch|Mandarin]] <small>([[w:Pinyin|Pinyin]])</small>: [1] ''traditionelle Schreibweise:'' {{Üt|zh|貓|māo}} / ''vereinfachte Schreibweise:'' {{Üt|zh|猫|māo}}",
   "*{{da}}: [1] {{Ü|da|kat}}",
   "*{{en}}: [1] {{Ü|en|cat}}; [1a] {{Ü|en|she-cat}}; [3] {{Ü|en|feline}}",
   "|Dialekttabelle=",
   "{{überarbeiten|1=unbelegte Angaben belegen, [[Benutzer:Caligari|Caligari]] [[Benutzer_Diskussion:Caligari|<span style=\"font-family: 'Arial Unicode MS', sans-serif;\"><span class=\"ipa\" style=\"padding: 0 1px; text-decoration: none;\"><sup>Ɔ</sup>ɐ<sup>ƀïи</sup>Ϡ<sub>Ⴕ</sub></span></span>]] 19:29, 11. Apr. 2015 (MESZ)|2=Deutsch}}",
   "*'''Westoberdeutsch ([[Alemannisch]]):'''",
   "**Schwäbisch: [1] [[Katz]]{{QS Herkunft|unbelegt}}, [[Mull]]{{QS Herkunft|unbelegt}}",
   "**Schweizerdeutsch: [1] [[Chatz]]{{QS Herkunft|unbelegt}}, [[Chätzli]]{{QS Herkunft|unbelegt}}; ''mundartnah'' {{fam.|:}} [[Büsi]]",
   "|D-rechts=",
   "*'''Ostmitteldeutsch:'''",
   "**Sächsisch: [1] [[Mullemusch]]{{QS Herkunft|unbelegt}}",
   "}}",
   "",
   "{{Referenzen}}",
   ":[1] {{Wikipedia}}",
   ":[1–3] {{Wikipedia|Katze (Begriffsklärung)}}",
   ":[1, 2] {{Ref-Grimm}}",
   ":[1] {{Ref-DWDS}}",
   ":[1, 3] {{Ref-Canoo}}",
   ":[1, 2] {{Ref-UniLeipzig}}",
   ":[1, 3] {{Ref-FreeDictionary}}",
   ":[1] Wiktionary-Verzeichnis [[Verzeichnis:Tiere|Tiere]]",
   "",
   "{{Quellen}}",
   "",
   "{{Ähnlichkeiten 1|[[Atze]], [[Glatze]], [[Kate]], [[Karzer]], [[Kitze]], [[Kotze]], [[kotze]], [[kratze]], [[Matze]], [[patze]], [[Ratze]], [[Tatze]]}}"
   ]

catFacts :: [WiktionaryFact]
catFacts = [
    WiktionaryFact "form/nominativ_singular" (term ["Katze"]) (term ["Katze","de","Substantiv"]),
    WiktionaryFact "form/nominativ_plural" (term ["Katzen"]) (term ["Katze","de","Substantiv"]),
    WiktionaryFact "form/genitiv_singular" (term ["Katze"]) (term ["Katze","de","Substantiv"]),
    WiktionaryFact "form/genitiv_plural" (term ["Katzen"]) (term ["Katze","de","Substantiv"]),
    WiktionaryFact "form/dativ_singular" (term ["Katze"]) (term ["Katze","de","Substantiv"]),
    WiktionaryFact "form/dativ_plural" (term ["Katzen"]) (term ["Katze","de","Substantiv"]),
    WiktionaryFact "form/akkusativ_singular" (term ["Katze"]) (term ["Katze","de","Substantiv"]),
    WiktionaryFact "form/akkusativ_plural" (term ["Katzen"]) (term ["Katze","de","Substantiv"]),
    WiktionaryFact "definition" (term ["Katze","de","Substantiv","","def.1"]) (term ["dem Menschen verbundenes, anschmiegsames Haustier (Felis silvestris catus), in zahlreichen Rassen gezüchtet","de"]),
    WiktionaryFact "link" (term ["Katze","de","Substantiv","","def.1"]) (term ["Mensch"]),
    WiktionaryFact "link" (term ["Katze","de","Substantiv","","def.1"]) (term ["verbunden"]),
    WiktionaryFact "link" (term ["Katze","de","Substantiv","","def.1"]) (term ["anschmiegsam"]),
    WiktionaryFact "link" (term ["Katze","de","Substantiv","","def.1"]) (term ["Haustier"]),
    WiktionaryFact "definition" (term ["Katze","de","Substantiv","","def.2"]) (term ["ein Teil eines Brückenkranes","de"]),
    WiktionaryFact "link" (term ["Katze","de","Substantiv","","def.2"]) (term ["Teil"]),
    WiktionaryFact "link" (term ["Katze","de","Substantiv","","def.2"]) (term ["Brückenkran"]),
    WiktionaryFact "definition" (term ["Katze","de","Substantiv","","def.3"]) (term ["Plural, Zoologie: eine Familie (Félidae) der Raubtiere","de"]),
    WiktionaryFact "link" (term ["Katze","de","Substantiv","","def.3"]) (term ["Zoologie"]),
    WiktionaryFact "link" (term ["Katze","de","Substantiv","","def.3"]) (term ["Familie"]),
    WiktionaryFact "link" (term ["Katze","de","Substantiv","","def.3"]) (term ["Raubtier"]),
    WiktionaryFact "synonym" (term ["Katze","de","Substantiv","","def.1"]) (term ["Hauskatze"]),
    WiktionaryFact "synonym" (term ["Katze","de","Substantiv","","def.1"]) (term ["Stubentiger"]),
    WiktionaryFact "synonym" (term ["Katze","de","Substantiv","","def.1"]) (term ["Dachhase"]),
    WiktionaryFact "synonym" (term ["Katze","de","Substantiv","","def.1"]) (term ["Mieze"]),
    WiktionaryFact "synonym" (term ["Katze","de","Substantiv","","def.1"]) (term ["Miezekatze"]),
    WiktionaryFact "synonym" (term ["Katze","de","Substantiv","","def.1"]) (term ["Büsi"]),
    WiktionaryFact "synonym" (term ["Katze","de","Substantiv","","def.2"]) (term ["Laufkatze"]),
    WiktionaryFact "form/feminine" (term ["Kätzin"]) (term ["Katze","de","Substantiv","","def.1"]),
    WiktionaryFact "form/masculine" (term ["Kater"]) (term ["Katze","de","Substantiv","","def.1"]),
    WiktionaryFact "form/masculine" (term ["Kater"]) (term ["Katze","de","Substantiv","","def.1a"]),
    WiktionaryFact "form/diminutive" (term ["Kätzchen"]) (term ["Katze","de","Substantiv"]),
    WiktionaryFact "form/diminutive" (term ["Kätzlein"]) (term ["Katze","de","Substantiv"]),
    WiktionaryFact "hypernym" (term ["Katze","de","Substantiv","","def.1"]) (term ["Haustier"]),
    WiktionaryFact "hypernym" (term ["Katze","de","Substantiv","","def.1"]) (term ["Säugetier"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.1"]) (term ["Kater"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.1"]) (term ["Kätzin"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.1"]) (term ["Angorakatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.1"]) (term ["Heilige Birma"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.1"]) (term ["Britisch Kurzhaar"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.1"]) (term ["Europäisch Kurzhaar"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.1"]) (term ["Perserkatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.1"]) (term ["Siamkatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.1"]) (term ["Schmusekatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.1"]) (term ["Schmusekätzchen"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.1"]) (term ["Geldkatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Raubkatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Andenkatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Angorakatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Bengalkatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Borneokatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Chilenische Waldkatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Falbkatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Fischkatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Flachkopfkatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Gepard"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Goldkatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Großkatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Iriomotekatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Jaguar"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Karakal"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Leopard"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Löwe"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Luchs"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Manul"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Marguay"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Marmorkatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Nebelparder"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Ozelot"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Ozelotkatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Pampaskatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Puma"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Rohrkatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Rostkatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Säbelzahnkatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Salzkatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Sandkatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Schleichkatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Schneeleopard"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Schwarzfußkatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Serval"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Steppenkatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Tiger"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Vankatze"]),
    WiktionaryFact "hyponym" (term ["Katze","de","Substantiv","","def.3"]) (term ["Wildkatze"]),
    WiktionaryFact "derived" (term ["Katze","de","Substantiv"]) (term ["Katzenallergie"]),
    WiktionaryFact "derived" (term ["Katze","de","Substantiv"]) (term ["Katzenauge"]),
    WiktionaryFact "derived" (term ["Katze","de","Substantiv"]) (term ["Katzenbaum"]),
    WiktionaryFact "derived" (term ["Katze","de","Substantiv"]) (term ["Katzenbuckel"]),
    WiktionaryFact "derived" (term ["Katze","de","Substantiv"]) (term ["Katzendreck"]),
    WiktionaryFact "derived" (term ["Katze","de","Substantiv"]) (term ["Katzenfell"]),
    WiktionaryFact "derived" (term ["Katze","de","Substantiv"]) (term ["Katzenfutter"]),
    WiktionaryFact "derived" (term ["Katze","de","Substantiv"]) (term ["Katzengold"]),
    WiktionaryFact "derived" (term ["Katze","de","Substantiv"]) (term ["Katzengras"]),
    WiktionaryFact "derived" (term ["Katze","de","Substantiv"]) (term ["Katzenjammer"]),
    WiktionaryFact "derived" (term ["Katze","de","Substantiv"]) (term ["Katzenjunges"]),
    WiktionaryFact "derived" (term ["Katze","de","Substantiv"]) (term ["Katzenklappe"]),
    WiktionaryFact "derived" (term ["Katze","de","Substantiv"]) (term ["Katzenklo"]),
    WiktionaryFact "derived" (term ["Katze","de","Substantiv"]) (term ["Katzenkonzert"]),
    WiktionaryFact "derived" (term ["Katze","de","Substantiv"]) (term ["Katzenleukose"]),
    WiktionaryFact "derived" (term ["Katze","de","Substantiv"]) (term ["Katzenminze"]),
    WiktionaryFact "derived" (term ["Katze","de","Substantiv"]) (term ["Katzenmusik"]),
    WiktionaryFact "derived" (term ["Katze","de","Substantiv"]) (term ["Katzenpfote"]),
    WiktionaryFact "derived" (term ["Katze","de","Substantiv"]) (term ["Katzenschnupfen"]),
    WiktionaryFact "derived" (term ["Katze","de","Substantiv"]) (term ["Katzensprung"]),
    WiktionaryFact "derived" (term ["Katze","de","Substantiv"]) (term ["Katzentisch"]),
    WiktionaryFact "derived" (term ["Katze","de","Substantiv"]) (term ["Katzenwäsche"]),
    WiktionaryFact "translation" (term ["Katze","de","Substantiv","","def.1"]) (term ["بس","ar"]),
    WiktionaryFact "translation" (term ["Katze","de","Substantiv","","def.1"]) (term ["قط","ar"]),
    WiktionaryFact "translation" (term ["Katze","de","Substantiv","","def.1"]) (term ["هر","ar"]),
    WiktionaryFact "translation" (term ["Katze","de","Substantiv","","def.1"]) (term ["قط","ar"]),
    WiktionaryFact "translation" (term ["Katze","de","Substantiv","","def.1"]) (term ["قط","ar"]),
    WiktionaryFact "translation" (term ["Katze","de","Substantiv","","def.1"]) (term ["مش","ar"]),
    WiktionaryFact "translation" (term ["Katze","de","Substantiv","","def.1"]) (term ["مش","ar"]),
    WiktionaryFact "translation" (term ["Katze","de","Substantiv","","def.1"]) (term ["قط","ar"]),
    WiktionaryFact "translation" (term ["Katze","de","Substantiv","","def.1"]) (term ["بس","ar"]),
    WiktionaryFact "translation" (term ["Katze","de","Substantiv","","def.1"]) (term ["قط","ar"]),
    WiktionaryFact "translation" (term ["Katze","de","Substantiv","","def.1"]) (term ["بسين","ar"]),
    WiktionaryFact "translation" (term ["Katze","de","Substantiv","","def.1"]) (term ["قط","ar"]),
    WiktionaryFact "translation" (term ["Katze","de","Substantiv","","def.1"]) (term ["بزون","ar"]),
    WiktionaryFact "translation" (term ["Katze","de","Substantiv","","def.1"]) (term ["կատու","hy"]),
    WiktionaryFact "translation" (term ["Katze","de","Substantiv","","def.1"]) (term ["pişik","az"]),
    WiktionaryFact "translation" (term ["Katze","de","Substantiv","","def.1"]) (term ["katu","eu"]),
    WiktionaryFact "translation" (term ["Katze","de","Substantiv","","def.1"]) (term ["kazh","br"]),
    WiktionaryFact "translation" (term ["Katze","de","Substantiv","","def.1"]) (term ["котка","bg"]),
    WiktionaryFact "translation" (term ["Katze","de","Substantiv","","def.1"]) (term ["貓","zh"]),
    WiktionaryFact "translation" (term ["Katze","de","Substantiv","","def.1"]) (term ["猫","zh"]),
    WiktionaryFact "translation" (term ["Katze","de","Substantiv","","def.1"]) (term ["kat","da"]),
    WiktionaryFact "translation" (term ["Katze","de","Substantiv","","def.1"]) (term ["cat","en"]),
    WiktionaryFact "translation" (term ["Katze","de","Substantiv","","def.1a"]) (term ["she-cat","en"]),
    WiktionaryFact "translation" (term ["Katze","de","Substantiv","","def.3"]) (term ["feline","en"])
    -- cut many more translations
    ]

compareLists :: (Eq a, Show a) => String -> [a] -> [a] -> [Test]
compareLists name input output =
  -- This deliberately runs off the end of the list. If the lists are the
  -- same length, then indexing both of them by (length input) will
  -- confirm this by successfully comparing Nothing to Nothing.
  [(name <> ": item " <> (show i)) ~: (index input i) ~?= (index output i) | i <- [0..(length input)]]

entryTests = compareLists "Example entry for 'Katze'" (deParseWiktionary "Katze" catEntry) catFacts

tests = test entryTests

main :: IO ()
main = void (runTestTT tests)
