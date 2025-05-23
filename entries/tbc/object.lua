local _, addonTable = ...
local objects_tbc = {

["Altar of Aggonar"] = "вівтар Аґґонара",
["Altar of Naias"] = "вівтар Найаса",
["Altar of Tidal Mastery"] = "вівтар приборкання припливів",
["Altered Bloodmyst Crystal"] = "видозмінений кристал Кривавої Мли",
["Ancient Lichen"] = "древній лишайник",
["Ancient Relic"] = "древня реліквія",
["Ango'rosh Attack Plans"] = "плани нападу племені Анґо'рош",
["Aquatic Stinkhorn"] = "водянистий смердоріг",
["Arelion's Knapsack"] = "торба Ареліона",
["Axxarien Crystal"] = "аксаріенcький кристал",
["Azure Phial"] = "лазурний фіал",
["Azure Snapdragon"] = "лазуровий ротик",
["Barrel of Filth"] = "бочка бруду",
["Basin of Holy Water"] = "чаша зі святою водою",
["Battered Ancient Book"] = "пошарпана древня книга",
["Blackhoof Armaments"] = "озброєння Чорного Копита",
["Blackhoof Cage"] = "клітка Чорного Копита",
["Blood Crystal"] = "кривавий кристал",
["Blood Mushroom"] = "кривавий гриб",
["Bloodthistle"] = "кровополох",
["Bloodthistle Plant"] = "кровополох",
["Bogblossom"] = "болотоцвіт",
["Box of Mushrooms"] = "ящик грибів",
["Bristlelimb Cage"] = "клітка Клишоногих",
["Burial Chest"] = "погребальна скриня",
["Burning Wreckage"] = "палаючі уламки",
["Burstcap Mushroom"] = "гриб-зривошапка",
["Captain Kelisendra's Cargo"] = "вантаж капітана Келісендри",
["Central Beacon"] = "центральний маяк",
["Chalice of Elune"] = "чаша Елуни",
["Clopper's Equipment"] = "обладнання Клоппера",
["Concealed Control Panel"] = "прихована панель управління",
["Corrupted Crystal"] = "зіпсований кристал",
["Corrupted Flower"] = "зіпсована квітка",
["Cove Cannon"] = "портова гармата",
["Crate of Ingots"] = "ящик злитків",
["Cursed Cauldron"] = "проклятий казан",
["Damaged Diving Gear"] = "пошкоджене водолазне спорядження",
["Dead Mire Soil"] = "ґрунт Мертвої Трясовини",
["Deserter Propaganda"] = "дезертирська пропаганда",
["Discarded Nutriment"] = "полишений корм",
["Dragon Bone"] = "кістка дракона",
["Dreaming Glory"] = "мрійник",
["Drycap Mushroom"] = "гриб-сухошапка",
["Duskwither Spire Power Source"] = "джерело енергії шпиля Посушливого Присмерку",
["Dusty Journal"] = "вкритий пилом щоденник",
["East Tent"] = "східний намет",
["Emitter Spare Part"] = "запчастина для передавача",
["Empty Barrel"] = "порожня діжка",
["Ever-burning Pyre"] = "вічне вогнище",
["Featherbeard's Journal"] = "щоденник Пероборода",
["Featherbeard's Remains"] = "рештки Пероборода",
["Fei Fei's Cache"] = "схованка Сір-ка",
["Fel Cone Fungus"] = "конусна поганка",
["Felhound Poo"] = "послід скверногончої",
["Feralfen Idol"] = "ідол Дикотвані",
["Fertile Dirt Mound"] = "родюча купа ґрунту",
["Forge Camp: Portal Glyph"] = "портальна руна табору Легіону",
["Fresh Fish Rack"] = "стійка зі свіжою рибою",
["Fulgor Spore"] = "спори світлошляпки",
["Galaen's Journal"] = "щоденник Ґалена",
["Gilded Brazier"] = "позолочена жаровня",
["Glistening Mud"] = "блискучий мул",
["Glowcap"] = "сяйношляпка",
["Gryphon Egg"] = "яйце грифона",
["Haal'eshi Altar"] = "вівтар Гаал'еші",
["Harbinger of the Second Trial"] = "вісник другого випробування",
["Hellfire Spineleaf"] = "пекельний хребтолист",
["Hollowed Out Tree"] = "порожнисте дерево",
["Holy Coffer"] = "священа скриня",
["Hyal Family Monument"] = "пам'ятник сім'ї Хіалів",
["Ikeyen's Belongings"] = "речі Ікейена",
["Impact Site Crystal"] = "кристал з місця падіння",
["Irradiated Power Crystal"] = "опромінений силовий кристал",
["Jakk's Cage"] = "клітка Джакка",
["Lumber Pile"] = "купа деревини",
["Manni's Cage"] = "клітка Манні",
["Mature Spore Sac"] = "мішечок зрілих спор",
["Medical Supplies"] = "ящик з медикаментами",
["Metal Coffer"] = "металева скриня",
["Moh's Cage"] = "клітка Мога",
["Mound of Dirt"] = "купа землі",
["Mummified Troll Remains"] = "муміфіковані рештки троля",
["Mysteries of the Light"] = "Таємниці Світла",
["Naga Flag"] = "прапор наг",
["Nautical Compass"] = "морський компас",
["Nautical Map"] = "морська мапа",
["Nazzivus Monument Glyphs"] = "гліфи монумента Наззивія",
["Night Elf Moon Crystal"] = "місячний кристал нічних ельфів",
["Night Elf Plans: An'daroth"] = "плани нічних ельфів: Ан'дарот",
["Night Elf Plans: An'owyn"] = "плани нічних ельфів: Ан'овін",
["Night Elf Plans: Scrying on the Sin'dorei"] = "плани нічних ельфів: спостереження за сін’дорай",
["North Tent"] = "північний намет",
["Northeast Tent"] = "північно-східний намет",
["Orb of Translocation"] = "сфера транслокації",
["Pile of Leaves"] = "купа листя",
["Portal Grimh"] = "портал Ґрімг",
["Portal Kaalez"] = "портал Каалез",
["Primitive Chest"] = "примітивна скриня",
["Princess Stillpine's Cage"] = "клітка принцеси Тихохвоїв",
["Ragveil"] = "ганчірниця",
["Rathis Tomber's Supplies"] = "вантаж Ратіса Могильника",
["Ravager Cage"] = "клітка спустошника",
["Ravager Egg"] = "яйце спустошника",
["Raven Stone Fragment"] = "фрагмент каменя Ворона",
["Raw Meat Rack"] = "стійка з сирим м'ясом",
["Ruinous Polyspore"] = "руйнівна поліспора",
["Salvageable Metal"] = "металолом",
["Salvageable Wood"] = "обрізки деревини",
["Sand Pear"] = "піщана груша",
["Scourge Meat Wagon"] = "м'ясний фургон Скари",
["Scroll of Scourge Magic"] = "сувій магії Скари",
["Sha'naar Relic"] = "реліквія Ша'наар",
["Shipwreck Debris"] = "уламки кораблетрощі",
["Shredder Parts"] = "частини подрібнювача",
["Shrine of Dath'Remar"] = "вівтар Дат'Ремара",
["Smoked Meat Rack"] = "стійка з копченим м'ясом",
["Soaked Tome"] = "промоклий фоліант",
["Solanian's Journal"] = "щоденник Соланіана",
["Solanian's Scrying Orb"] = "віщувальна куля Соланіана",
["Southern Beacon"] = "південний маяк",
["Springpaw Appetizer"] = "закуска з пругколапа",
["Stillpine Grain"] = "мішок зерна Тихохвоїв",
["Stonemaul Clan Banner"] = "знамено клану Каменедовбні",
["Sun Gate"] = "сонячна брама",
["Sunhawk Portal Controller"] = "портальний контролер Сонячних Яструбів",
["Suntouched Special Reserve"] = "Сонцесяйне Особливе",
["Tainted Soil Sample"] = "зразок зіпсованого ґрунту",
["Tainted Wood"] = "осквернена деревина",
["The Raven's Claw"] = "пазур воронв",
["Tool Kit"] = "набір інструментів",
["Torn Pilgrim's Pack"] = "порвана сумка паломниці",
["Trampled Skeleton"] = "розтоптаний скелет",
["Unopened Crate"] = "закритий ящик",
["Unstable Mana Crystal Crate"] = "ящик з нестабільними кристалами мани",
["Unyielding Banner"] = "стяг Непохитних",
["Void Stone"] = "камінь Пустоти",
["Voidstone"] = "камінь Пустоти",
["Wanted Poster"] = "оголошення про розшук",
["Wanted Poster: Kel'gash the Wicked"] = "оголошення про розшук: Кел'ґаш Лихий",
["Wanted: Thaelis the Hungerer"] = "розшук: Теліс-Ненажера",
["Weapon Container"] = "ящик зі зброєю",
["Weapon Rack"] = "стійка для зброї",
["Western Beacon"] = "західний маяк",
["Wickerman Effigy"] = "плетене опудало",
["Witchbane"] = "відьмобій",
["Worn Chest"] = "обдерта скриня",
["Wyrmtail"] = "змієхвіст",
["Ysera's Tear"] = "сльоза Ізери",
["Zeppelin Cargo"] = "вантаж з дирижабля",
["Zeppelin Debris"] = "частини дирижабля",
}

for k, v in pairs(objects_tbc) do addonTable.object[k] = v end
