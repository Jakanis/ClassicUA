local _, addonTable = ...

local deathknight_spells = {

-- See /entries/classic/spell.lua for data format details.

-- Abomination's Might
[53137] = { "Міць поганища", "Збільшує силу атаки ближнього бою на {1}%, а силу атаки дальнього бою на {2}% для всіх учасників групи чи рейду в межах {3} м. Також збільшує вашу силу на {4}%.#melee attack power by {1}%#ranged attack power by {2}%#within {3} y#Strength by {4}%", "Силу атаки ближнього бою збільшено на {1}%, а силу атаки дальнього бою збільшено на {2}%.#melee attack power by {1}%#ranged attack power by {2}%" }, -- Abomination's Might (Rank 1)
[53138] = { ref=53137 }, -- Abomination's Might (Rank 2)
-- Acherus Deathcharger
[48778] = { "Смертегін Акеруса", "Викликає та відпускає верхового смертегона Акеруса.", "Швидкість руху збільшено на {1}%.#by {1}%" }, -- Acherus Deathcharger (Summon)
-- Annihilation
[51468] = { "Анігіляція", "Збільшує шкоду \"Знищення\" на {1}%.#by {1}%" }, -- Annihilation (Rank 1)
[51472] = { ref=51468 }, -- Annihilation (Rank 2)
[51473] = { ref=51468 }, -- Annihilation (Rank 3)
-- Anti-Magic Shell
[48707] = { "Антимагічний панцир", "Оточує лицаря смерті антимагічним панциром, що поглинає {1}% шкоди від заклять (до {2}% від здоров'я лицаря смерті) і запобігає накладанню шкідливих магічних ефектів. Триває {3} с.#absorbing {1}%#maximum of {2}%#Lasts {3} sec", "Отриману шкоду від заклять зменшено на {1}%. Невразливість до магічних шкідливих ефектів.#by {1}%" }, -- Anti-Magic Shell
-- Blade Barrier
[49182] = { "Клинковий бар'єр", "Ви отримуєте на {1}% менше шкоди зі всіх джерел.#take {1}% less" }, -- Blade Barrier (Rank 1)
[49500] = { ref=49182 }, -- Blade Barrier (Rank 2)
[49501] = { ref=49182 }, -- Blade Barrier (Rank 3)
-- Blood Boil
[48721] = { "Скипання крові", "Кров усіх ворогів у межах {1} м закипає, що завдає {2} шкоди від тіні. Завдає додаткової шкоди цілям, ураженим \"Кривавою чумою\" чи \"Морозною лихоманкою\".#within {1} y#dealing {2} Shadow" }, -- Blood Boil
-- Blood Parasite
[49027] = { "Кривавий паразит", "Ваші атаки ближнього бою з ймовірністю {1}% викликають кривавого паразита. Паразит атакує ваших ворогів, поглинаючи їхню кров, поки не вибухне, зцілюючи союзників неподалік, Існує до {2} с.#a {1}% chance#up to {2} sec" }, -- Blood Parasite (Rank 1)
[49542] = { ref=49027 }, -- Blood Parasite (Rank 2)
-- Blood Plague
[59879] = { "Кривава чума", "Хвороба, що завдає {1} шкоди від тіні кожні {2} с протягом {3} с. Ефект спричиняється \"Ударом чуми\" та іншими здібностями.#dealing {1} Shadow#every {2} sec for {3} sec" }, -- Blood Plague (Passive)
-- Blood Presence
[48263] = { "Сила крові", "Ви сповнюєтесь силою крові, що збільшує витривалість на {1}%, збільшує броню від предметів на {2}% та зменшує отриману шкоду на {3}%. Збільшує загрозу. Одночасно може бути активною лише одна сила, а її зміна поглинає всю силу рун.#Stamina by {1}%#items by {2}%#taken by {3}%", "Витривалість збільшено на {1}%.\nБроню від тканинних, шкіряних, кольчужних та латних предметів збільшено на {2}%.\nОтриману шкоду зменшено на {3}%.#Stamina increased by {1}%#items increased by {2}%#reduced by {3}%" }, -- Blood Presence
-- Blood Rites
[50034] = { "Кривавий обряд", "Коли ви влучаєте \"Ударом смерті\" чи \"Знищенням\", руни криги та нечестивості при активації перетворюються на руни смерті. Руни смерті можна використати як руни крові, криги чи нечестивості." }, -- Blood Rites (Passive)
-- Blood Strike
[45902] = { "Кривавий удар", "Миттєвий удар, що завдає ворогу {1}% шкоди зброї плюс {2}. Шкода збільшується на {3}% за кожну вашу хворобу на цілі.#causing {1}%#plus {2}#by {3}%" }, -- Blood Strike
-- Blood of the North
[54637] = { "Кров півночі", "Назавжди перетворює ваші руни крові на руни смерті. Руни смерті можна використати як руни крові, криги чи нечестивості." }, -- Blood of the North (Passive)
-- Blood-Caked Blade
[49219] = { "Закривавлений клинок", "Ваші автоатаки з ймовірністю {1}% викликають удар закривавленим клинком, що завдає {2}% шкоди зброї плюс {3}% за кожну вашу хворобу на цілі.#a {1}% chance#hits for {2}% weapon damage plus {3}%" }, -- Blood-Caked Blade (Rank 1)
[49627] = { ref=49219 }, -- Blood-Caked Blade (Rank 2)
[49628] = { ref=49219 }, -- Blood-Caked Blade (Rank 3)
-- Bone Shield
[49222] = { "Кістяний щит", "Оточує вас бар'єром з кісток. Щит з'являється з {1} зарядами і кожна атака, що завдає шкоди лицарю смерті, поглинає заряд. Поки існує хоча б один заряд щита, ви отримуєте на {2}% менше шкоди з усіх джерел та завдаєте на {3}% більше шкоди атаками, закляттями та здібностями. Триває {4} хв.#with {1} charges#take {2}% less#deal {3}% more#Lasts {4} min", "Отриману шкоду зменшено на {1}%.\nЗавдану шкоду збільшено на {2}%.#reduced by {1}%#dealt increased by {2}%" }, -- Bone Shield
-- Brittle Bones
[81327] = { "Крихкість кісток", "Ваша сила збільшується на {1}%, а \"Морозна лихоманка\" проморожує кістки цілі, збільшуючи отриману нею шкоду на {2}%.#increased by {1}%#taken by {2}%" }, -- Brittle Bones (Rank 1)
[81328] = { ref=81327 }, -- Brittle Bones (Rank 1)
-- Butchery
[48979] = { "М'ясар", "Після вбивства цілі, що приносить досвід або честь, ви генеруєте {1} од. сили рун. Окрім того, ви генеруєте {2} од. сили рун кожні {3} с, поки перебуваєте в бою.#up to {1} Runic#generate {2} Runic Power per {3} sec" }, -- Butchery (Rank 1)
[49483] = { ref=48979 }, -- Butchery (Rank 2)
-- Chains of Ice
[45524] = { "Льодяні окови", "Заковує ворога крижаними оковами, зменшуючи швидкість руху на {1}% протягом {2} с. Також вражає ворога \"Морозною лихоманкою\".#by {1}% for {2} sec", "Сповільнено крижаними оковами." }, -- Chains of Ice
-- Chilblains
[50040] = { "Обмороження", "Жертви \"Морозної лихоманки\" охолоджуються, внаслідок чого їхня швидкість руху зменшується на {1}% протягом {2} с, а \"Льодяні окови\" знерухомлюють ціль на {3} с.#by {1}% for {2} sec#targets for {3} sec" }, -- Chilblains (Rank 1)
[50041] = { ref=50040 }, -- Chilblains (Rank 2)
-- Chill of the Grave
[49149] = { "Могильний холод", "Здібності \"Льодяні окови\", \"Виючий вітер\", \"Льодяний дотик\" та \"Знищення\" генерують додатково {1} од сили рун.#generate {1} additional" }, -- Chill of the Grave (Rank 1)
[50115] = { ref=49149 }, -- Chill of the Grave (Rank 2)
-- Contagion
[91316] = { "Заразність", "Збільшує шкоду хвороб, поширених \"Мором\", на {1}%.#by {1}%" }, -- Contagion (Rank 1)
[91319] = { ref=91316 }, -- Contagion (Rank 1)
-- Crimson Scourge
[81135] = { "Кривава Скара", "Збільшує шкоду \"Скипання крові\" на {1}%, а коли ви вражаєте атакою ближнього бою ціль, уражену \"Кривавою чумою\", з ймовірністю {2}% наступне \"Скипання крові\" не витрачатиме руни.#Boil by {1}%#a {2}% chance" }, -- Crimson Scourge (Rank 1)
[81136] = { ref=81135 }, -- Crimson Scourge (Rank 2)
-- Dancing Rune Weapon
[49028] = { "Танцююча рунічна зброя", "Викликає другу рунічну зброю, що атакує протягом {1} с, повторюючи атаки лицаря смерті. Рунічна зброя також захищає свого господаря, збільшуючи шанс парирування на {2}%.#for {1} sec#additional {2}%" }, -- Dancing Rune Weapon
-- Dark Simulacrum
[77606] = { "Темний симулякр", "Накладає на ворога темне заклинання, що триває {1} с та спрацьовує, коли ворог витрачає ману на закляття, дозволяючи лицарю смерті застосувати його точну копію. При застосуванні на ворогів, що не є гравцями, поглинає лише деякі шкідливі заклинання.#for {1} sec", "Наступне закляття, що витрачає ману, буде скопійовано рунічним клинком лицаря смерті." }, -- Dark Simulacrum
-- Dark Transformation
[63560] = { "Темне перетворення", "Поглинає {1} ефектів \"Вливання тіні\" з вашого вурдалака та перетворює його на могутню неживу потвору на {2} с. Здібності вурдалака підсилюються та отримують нові ефекти на час перетворення.#Consume {1} charges#for {2} sec", "Перетворено на неживу потвору.\nШкоду збільшено на {1}%.#by {1}%" }, -- Dark Transformation
-- Death Coil
[47541] = { "Спіраль смерті", "Заряд нечестивої енергії, що завдає {1} шкоди від тіні ворожій цілі або відновлює {2} здоров'я дружній невмерлій цілі.#causing {1} Shadow#healing {2} damage" }, -- Death Coil
-- Death Strike
[49998] = { "Удар смерті", "Потужний удар, що зцілює вам {1}% від шкоди, яку ви отримали протягом попередніх {2} секунд (мінімум {3}% від вашого максимального запасу здоров'я), а також завдає {4}% шкоди зброї плюс {5} цілі, якщо атака буде успішною.#for {1}% of#preceding {2} sec#least {3}% of#dealing {4}% weapon damage plus {5} to" }, -- Death Strike
-- Death and Decay
[43265] = { "Смерть і гниття", "Оскверняє вказану ділянку землі, завдаючи {1} шкоди від тіні щосекунди всім цілям в її межах протягом {2} с. Ця здібність спричиняє велику загрозу.#causing {1} Shadow#for {2} sec", "Завдає {1} шкоди щосекунди.#Suffering {1} Shadow" }, -- Death and Decay
-- Death's Advance
[96269] = { "Хода смерті", "Коли обидві ваші руни нечестивості використані, ефекти обмеження руху не можуть зменшити вашу швидкість руху нижче {1}% від звичайної.#below {1}%" }, -- Death's Advance (Rank 1)
[96270] = { ref=96269 }, -- Death's Advance (Rank 2)
-- Desecration
[55666] = { "Осквернення", "Здібності \"Удар чуми\", \"Удар Скари\" та \"Некротичний удар\" оскверняють землю в радіусі {1} м навколо цілі. Швидкість руху ворогів в цій зоні зменшується на {2}%. Не спрацьовує проти цілей, що мають невразливість до сповільнення руху. Триває {3} с.#within {1} y#slowed by {2}%#Lasts {3} sec" }, -- Desecration (Rank 1)
[55667] = { ref=55666 }, -- Desecration (Rank 2)
-- Ebon Plaguebringer
[51099] = { "Розносник чорної чуми", "\"Удар чуми\", \"Льодяний дотик\", \"Льодяні окови\" та \"Спалах хвороби\" також вражають ціль чорною чумою, що збільшує отриману нею шкоду від ваших хвороб на {1}% та збільшує всю отриману магічну шкоду ще на {2}%.#diseases by {1}%#additional {2}%" }, -- Ebon Plaguebringer (Rank 1)
[51160] = { ref=51099 }, -- Ebon Plaguebringer (Rank 2)
-- Empower Rune Weapon
[47568] = { "Підсилення рунічної зброї", "Підсилює вашу рунічну зброю, миттєво завершуючи відновлення всіх рун та генеруючи {1} од. сили рун .#generating {1} Runic" }, -- Empower Rune Weapon
-- Endless Winter
[49137] = { "Нескінченна зима", "\"Замороження мозку\" витрачає {1} од. сили рун.#to {1} Runic" }, -- Endless Winter (Rank 1)
[49657] = { nil, "\"Замороження мозку\" не витрачає сили рун.", ref=49137 }, -- Endless Winter (Rank 2)
-- Epidemic
[81334] = { ref=49036 }, -- Epidemic (Rank 3)
-- Festering Strike
[85948] = { "Гнійний удар", "Миттєва атака, що завдає {1}% шкоди зброї плюс {2} та продовжує тривалість дії \"Кривавої чуми\", \"Морозної лихоманки\" та \"Льодяних оков\" на цілі до {3} c.#deals {1}% weapon damage plus {2} and#up to {3} sec" }, -- Festering Strike
-- Festering Strike Off-Hand
[86061] = { "Гнійний удар (ліва рука)", ref=85948 }, -- Festering Strike Off-Hand
-- Frost Fever
[59921] = { "Морозна лихоманка", "Хвороба, що завдає {1} шкоди від криги кожні {2} с та зменшує швидкість атак ближнього та дальнього бою на {3}% протягом {4} с. Ефект спричиняється \"Льодяним дотиком\" та іншими здібностями.#dealing {1} Frost damage every {2} sec#by {3}% for {4} sec" }, -- Frost Fever (Passive)
-- Frost Presence
[48266] = { "Сила криги", "Ви сповнюєтесь силою криги, що збільшує шкоду на {1}% та збільшує генерацію сили рун на {2}%. Одночасно може бути активною лише одна сила, а її зміна поглинає всю силу рун.#damage by {1}%#generation by {2}%", "Шкоду збільшено на {1}%.\nГенерацію сили рун збільшено на {2}%.#Damage increased by {1}%#generation increased by {2}%" }, -- Frost Presence
-- Hand of Doom
[85793] = { "Десниця згуби", "Зменшує час відновлення \"Удушення\" на {1} с.#by {1} sec" }, -- Hand of Doom (Rank 1)
[85794] = { ref=85793 }, -- Hand of Doom (Rank 2)
-- Heart Strike
[55050] = { "Удар в серце", "Миттєвий удар по цілі та до двох ворогах поблизу, що завдає {1}% шкоди від зброї плюс {2} по основній цілі, а кожен наступний ворог отримує на {3}% менше шкоди, ніж попередня ціль. Шкода, завдана кожній цілі, збільшується на {4}% за кожну вашу хворобу на цілі.#causing {1}% weapon damage plus {2} on#taking {3}% less#additional {4}% for" }, -- Heart Strike
-- Horn of Winter
[57330] = { "Горн зими", "Лицар cмерті дме в горн зими, що генерує {1} од. сили рун і збільшує силу та спритність всіх учасників групи чи рейду в межах {2} м на {3}. Триває {4} хв.#generates {1} Runic#within {2} yards by {3}#Lasts {4} min", "Силу та спритність збільшено на {1}.#by {1}" }, -- Horn of Winter
-- Howling Blast
[49184] = { "Виючий вітер", "Вражає ціль крижаним вітром, завдаючи {1} шкоди від криги їй та {2} шкоди від криги всім ворогам в межах {3} м від цілі.#dealing {1} Frost#and {2} Frost#within {3} y" }, -- Howling Blast
-- Hungering Cold
[49203] = { "Голодна холоднеча", "Лишає землю навколо лицаря смерті тепла. Ворогів у межах {1} м вражає \"Морозна лихоманка\" і потрапляють у крижану пастку, що робить їх недієздатними протягом {2} с. Вороги вважаються замороженими, але будь-яка шкода, окрім хвороб, розбиває лід.#within {1} y#for {2} sec", "Заморожено." }, -- Hungering Cold
-- Icebound Fortitude
[48792] = { "Стійкість льоду", "Лицар смерті заморожує свою кров, отримуючи невразливість до ефектів приголомшення та зменшуючи отриману шкоду на {1}% протягом {2} с.#by {1}% for {2} sec", "Отриману шкоду зменшено на {1}%.\nНевразливість до ефектів приголомшення.#by {1}%" }, -- Icebound Fortitude
-- Icy Talons
[50887] = { "Крижані пазурі", "Швидкість атак бльжнього бою збільшується на {1}%.#by {1}%" }, -- Icy Talons (Passive)
-- Icy Touch
[45477] = { "Льодяний дотик", "Охолоджує ціль, завдаючи {1} шкоди від криги та вражаючи \"Морозною лихоманкою\", що періодично завдає шкоди та зменшує швидкість атак ближнього та дальнього бою на {2}% протягом {3} с.#for {1} Frost#by {2}% for {3} sec", "Швидкість атак ближнього та дальнього бою зменшено на {1}%.#by {1}%" }, -- Icy Touch
-- Improved Blood Presence
[50365] = { "Покращена сила крові", "Збільшує швидкість відновлення рун на {1}% та зменшує шанс отримання критичного удару в ближньому бою на {2}% поки діє \"Сила крові\". Окрім того, під дією \"Сили криги\" чи \"Сили нечестивості\" ви зберігаєте {3}% зменшення шкоди від \"Сили крові\".#regeneration by {1}%#Presence by {2}%#retain {3}% damage" }, -- Improved Blood Presence (Rank 1)
[50371] = { ref=50365 }, -- Improved Blood Presence (Rank 2)
-- Improved Blood Tap
[94553] = { "Покращений крововідвід", "Зменшує час відновлення здібності \"Крововідвід\" на {1} с.#by {1} sec" }, -- Improved Blood Tap (Rank 1)
[94555] = { ref=94553 }, -- Improved Blood Tap (Rank 2)
-- Improved Death Strike
[62905] = { "Покращений удар смерті", "Збільшує шкоду \"Удару смерті\" на {1}%, його шанс критичного удару на {2}%, а обсяг зцілення - на {3}%.#Strike by {1}%#chance by {2}%#healed by {3}%" }, -- Improved Death Strike (Rank 1)
[62908] = { ref=62905 }, -- Improved Death Strike (Rank 2)
[81138] = { ref=62905 }, -- Improved Death Strike (Rank 3)
-- Improved Frost Presence
[50384] = { "Покращена сила криги", "Шкода під \"Силою криги\" збільшується ще на {1}%. Окрім того, під дією \"Сили крові\" чи \"Сили нечестивості\" ви зберігаєте {2}% прискорення генерації сили рун від \"Сили криги\".#additional {1}%#retain {2}%" }, -- Improved Frost Presence (Rank 1)
[50385] = { ref=50384 }, -- Improved Frost Presence (Rank 2)
-- Improved Icy Talons
[55610] = { "Покращені крижані пазурі", "Збільшує швидкість атак ближнього та дальнього бою всіх учасників групи чи рейду в межах {1} м на {2}%, а вашу власну швидкість атак додатково на {3}%.#within {1} yards by {2}%#additional {3}%", "Швидкість атак ближнього та дальнього бою збільшено на {1}%.#by {1}%" }, -- Improved Icy Talons
-- Improved Unholy Presence
[50391] = { "Покращена сила нечестивості", "Ваша швидкість збільшується додатково на {1}% під \"Силою нечестивості\". Окрім того, під дією \"Сили крові\" чи \"Сили криги\" ви зберігаєте {2}% збільшення швидкості руху від \"Сили нечестивості\".#additional {1}%#retain {2}%" }, -- Improved Unholy Presence (Rank 1)
[50392] = { ref=50391 }, -- Improved Unholy Presence (Rank 2)
-- Killing Machine
[51123] = { "Машина для вбивств", "Ваші автоатаки мають шанс збільшити ймовірність завдання критичного удару \"Знищення\" чи \"Крижаного удару\" на {1}%.#a {1}%" }, -- Killing Machine (Rank 1)
[51127] = { nil, "Ваші автоатаки мають шанс збільшити ймовірність завдання критичного удару \"Знищення\" чи \"Крижаного удару\" на {1}%. Ефект спрацьовує частіше за попердній ранг.#a {1}%", ref=51123 }, -- Killing Machine (Rank 2)
[51128] = { ref=51127 }, -- Killing Machine (Rank 3)
-- Magic Suppression
[49224] = { "Придушення магії", "Збільшує об'єм поглинання магічної шкоди \"Антимагічним панцирем\" додатково на {1}%, а шкода, поглинена \"Антимагічним панцирем\", відновлює силу рун.#additional {1}%" }, -- Magic Suppression (Rank 1)
[49610] = { nil, "Збільшує об'єм поглинання магічної шкоди \"Антимагічним панцирем\" додатково на {1}% та збільшує відновлення сили рун від шкоди, поглиненої \"Антимагічним панцирем\".#additional {1}%", ref=49224 }, -- Magic Suppression (Rank 2)
[49611] = { ref=49610 }, -- Magic Suppression (Rank 3)
-- Might of the Frozen Wastes
[81330] = { "Міць крижаної пустки", "Коли ви тримаєте дворучну зброю, ваші атаки ближнього бою завдають додатково {1}% шкоди, а ваші автоатаки з ймовірністю {2}% генерують {3} од. сили рун.#additional {1}%#a {2}% chance#generate {3} Runic" }, -- Might of the Frozen Wastes
[81332] = { ref=81330 }, -- Might of the Frozen Wastes
[81333] = { ref=81330 }, -- Might of the Frozen Wastes
-- Morbidity
[48963] = { "Хворобливість", "Збільшує шкоду та зцілення здібності \"Спіраль смерті\" на {1}%, а здібності \"Смерть і гниття\" - на {2}%.#Coil by {1}%#Decay by {2}%" }, -- Morbidity (Rank 1)
[49564] = { ref=48963 }, -- Morbidity (Rank 2)
[49565] = { ref=48963 }, -- Morbidity (Rank 3)
-- Necrotic Strike
[73975] = { "Некротичний удар", "Жорстокий удар, що завдає {1}% шкоди зброї та поглинає {2} зцілення цілі. Протягом {3} c або поки не буде поглинуто максимальний об'єм зцілення, швидкість вимови заклять ціллю зменшується на {4}%,#deals {1}% weapon#next {2} healing#For {3} sec#by {4}%", "Поглинання зцілення.\nШвидкість вимови заклять зменшено на {1}%.#by {1}%" }, -- Necrotic Strike
-- Nerves of Cold Steel
[49226] = { "Крижана витримка", "Збільшує шанс влучити атаками одноручної зброї ближнього бою на {1}% та збільшує шкоду зброї в лівій руці на {2}%.#weapons by {1}% and#weapon by {2}%" }, -- Nerves of Cold Steel (Rank 1)
[50137] = { ref=49226 }, -- Nerves of Cold Steel (Rank 2)
[50138] = { ref=49226 }, -- Nerves of Cold Steel (Rank 3)
-- Obliterate
[49020] = { "Знищення", "Жорстока атака, що завдає {1}% шкоди зброї плюс {2}. Шкода збільшується на {3}% за кожну вашу хворобу на цілі.#deals {1}% weapon damage plus {2}#by {3}% for each" }, -- Obliterate
-- Obliterate Off-Hand
[66198] = { "Знищення (ліва рука)", "Жорстока атака, що завдає {1}% шкоди зброї в лівій руці. Шкода збільшується на {2}% за кожну вашу хворобу на цілі.#deals {1}% offhand#by {2}% for each" }, -- Obliterate Off-Hand
-- On a Pale Horse
[51986] = { "На блідому коні", "Вас стає так само важко зупинити, як і саму смерть. Тривалість ефектів сповільнення вашого руху зменшується на {1}%, а ваша швидкість верхової їзди збільшується на {2}%. Цей ефект не поєднується з іншими ефектами збільшення швидкості руху.#reduced by {1}%#increased by {2}%" }, -- On a Pale Horse (Rank 2)
-- Outbreak
[77575] = { "Спалах хвороби", "Миттєво заражає ворога \"Кривавою чумою\" та \"Морозною лихоманкою\"." }, -- Outbreak
-- Parry
[82246] = { "Парирування", "Дає шанс парирувати ворожі атаки ближнього бою." }, -- Parry (Passive)
-- Path of Frost
[3714] = { "Крижаний шлях", "Ваша крижана аура утворює лід під ногами, що дозволяє учасникам групи чи рейду в межах {1} м ходити по воді протягом {2} м. Працює, коли ви перебуваєте на транспорті, але ефект скасовується якщо вас атакують або ви отримуєте шкоду.#within {1} y#for {2} min", "Дозволяє ходити по воді." }, -- Path of Frost
-- Pestilence
[50842] = { "Мор", "Поширює \"Криваву чуму\" та \"Морозну лихоманку\" з цілі на всіх інших ворогів в межах {1} м. Хвороби, поширені таким чином, завдають {2}% від звичайної шкоди.#within {1} y#deal {2}% of" }, -- Pestilence
-- Pillar of Frost
[51271] = { "Крижаний стовп", "Закликає силу криги, що збільшує силу лицаря смерті на {1}%. Крижані кристали важким тягарем звисають з тіла лицаря смерті, забезпечуючи невразливість до переміщення від зовнішніх чинників, наприклад, до відкидання. Триває {2} с.#by {1}%#Lasts {2} sec", "Силу збільшено на {1}%.\nНевразливість до переміщення від зовнішніх чинників.#by {1}%" }, -- Pillar of Frost
-- Rage of Rivendare
[51745] = { "Лють Рівендера", "Збільшує шкоду здібностей \"Удар чуми\", \"Удар Скари\" та \"Гнійний удар\" на {1}%.#by {1}%" }, -- Rage of Rivendare (Rank 1)
[51746] = { ref=51745 }, -- Rage of Rivendare (Rank 2)
[91323] = { ref=51745 }, -- Rage of Rivendare (Rank 3)
-- Raise Ally
[61999] = { "Підняття союзника", "Вливає темну енергію в мертву ціль, возз'єднуючи дух і тіло, щоб дозволити їй повернутися в бій з {1}% здоров'я та {2}% мани.#with {1}% health and {2}% mana" }, -- Raise Ally
-- Raise Dead
[46584] = { "Підняття мертвих", "Воскрешає вурдалака, що битиметься на вашій стороні. Ви можете мати не більше одного вурдалака одночасно. Триває {1} хв.#Lasts {1} min", "Вурдалак служить вам." }, -- Raise Dead
-- Reaping
[56835] = { "Жнива", "Коли ви завдаєте удару здібностями \"Кривавий удар\", \"Мор\" чи \"Гнійний удар\", руни, витрачені на здібність, перетворяться на руни смерті при активації. Руни смерті можна використати як руни крові, криги чи нечестивості." }, -- Reaping (Passive)
-- Resilient Infection
[81338] = { "Стійка інфекція", "Коли ваші хвороби розвіюють, ви з ймовірністю {1}% активуєте руну криги при розвіянні \"Морозної лихоманки\", або руну нечестивості при розвіянні \"Кривавої чуми\".#a {1}% chance" }, -- Resilient Infection (Rank 1)
[81339] = { ref=81338 }, -- Resilient Infection (Rank 2)
-- Rime
[49188] = { "Іній", "\"Знищення\" з ймовірністю {1}% дозволить застосувати наступний \"Виючий вітер\" чи \"Льодяний дотик\" без витрат рун.#a {1}% chance" }, -- Rime (Rank 1)
[56822] = { ref=49188 }, -- Rime (Rank 2)
[59057] = { ref=49188 }, -- Rime (Rank 3)
-- Rune Strike
[56815] = { "Рунічний удар", "Удар, що завдає ворогу {1}% шкоди зброї плюс {2}. Можна використовувати з силою крові або протягом {3} c після ухилення чи парирування атаки. Ця атака спричиняє велику загрозу і від неї не можна ухилитися, блокувати чи парирувати.#for {1}% weapon damage plus {2}#for {3} sec" }, -- Rune Strike
-- Rune of the Nerubian Carapace
[70164] = { "Руна нерубського панцира", "Додає на вашу одноручну зброю руну, що збільшує броню на {1}%, а витривалість на {2}%. Для додавання руни необхідно бути біля рунної кузні в Чорній фортеці.#Armor by {1}%#Stamina by {2}%" }, -- Rune of the Nerubian Carapace
-- Rune of the Stoneskin Gargoyle
[62158] = { "Руна кам'яного гаргуйля", "Додає на вашу дворучну зброю руну, що збільшує броню на {1}%, а витривалість на {2}%. Для додавання руни необхідно бути біля рунної кузні в Чорній фортеці.#Armor by {1}%#Stamina by {2}%" }, -- Rune of the Stoneskin Gargoyle
-- Runic Corruption
[51459] = { "Рунічне псування", "Зменшує витрати сили рун \"Спіраллю смерті\" на {1}, а \"Рунічне підсилення\"  більше не відновлює витрачену руну, а натомість прискорює відновлення рун на {2}% протягом {3} с.#Coil by {1}#by {2}% for {3} sec" }, -- Runic Corruption (Rank 1)
[51462] = { ref=51459 }, -- Runic Corruption (Rank 2)
-- Runic Empowerment
[81229] = { "Рунічне підсилення", "Коли ви завдаєте шкоди \"Спіраллю смерті\", \"Крижаним ударом\" чи \"Рунічним ударом\", з ймовірністю {1}% ви активуєте випадкову витрачену руну.#a {1}% chance" }, -- Runic Empowerment (Passive)
-- Runic Power Mastery
[91145] = { ref=49455 }, -- Runic Power Mastery (Rank 3)
-- Sanguine Fortitude
[81125] = { "Кривава стійкість", "\"Стійкість льоду\" зменшує отриману шкоду ще на {1}% та витрачає на {2}% менше сили рун.#additional {1}%#costs {2}% less" }, -- Sanguine Fortitude (Rank 1)
[81127] = { nil, "\"Стійкість льоду\" зменшує отриману шкоду ще на {1}% та не витрачає сили рун.#additional {1}%", ref=81125 }, -- Sanguine Fortitude (Rank 2)
-- Scarlet Fever
[81131] = { "Багряна лихоманка", "\"Кривава чума\" вражає ціль \"Багряною лихоманкою\", що зменшує її фізичну шкоду на {1}% протягом {2} с.#by {1}% for {2} sec" }, -- Scarlet Fever (Rank 1)
[81132] = { ref=81131 }, -- Scarlet Fever (Rank 2)
-- Scent of Blood
[49004] = { "Запах крові", "З ймовірністю {1}% після ухилення, парирування чи отримання прямої шкоди ви отримуєте ефект \"Запах крові\" і відновлюєте {2} од. сили рун при завданні удару в ближньому бою.#a {1}% chance#generate {2} Runic" }, -- Scent of Blood (Rank 1)
[49508] = { nil, "З ймовірністю {1}% після ухилення, парирування чи отримання прямої шкоди ви отримуєте ефект \"Запах крові\" і відновлюєте {2} од. сили рун при завданні {3} наступних ударів у ближньому бою.#a {1}% chance#generate {2} Runic#next {3} melee", ref=49004 }, -- Scent of Blood (Rank 2)
[49509] = { ref=49508 }, -- Scent of Blood (Rank 3)
-- Shadow Infusion
[48965] = { "Вливання тіні", "З ймовірністю {1}% успішне застосування \"Спіралі смерті\" підсилить активного вурдалака, збільшуючи його шкоду на {2}% протягом {3} с. Ефект накопичується до {4} разів.#a {1}% chance#by {2}% for {3} sec#up to {4} times" }, -- Shadow Infusion (Rank 1)
[49571] = { ref=48965 }, -- Shadow Infusion (Rank 2)
[49572] = { ref=48965 }, -- Shadow Infusion (Rank 3)
-- Sudden Doom
[49018] = { "Раптова згуба", "Ваші атаки ближнього бою мають шанс дозволити вам застосувати наступну \"Спіраль смерті\" без витрат сили рун." }, -- Sudden Doom (Rank 1)
[49529] = { nil, "Ваші атаки ближнього бою мають шанс (більший за ранг {1}) дозволити вам застосувати наступну \"Спіраль смерті\" без витрат сили рун.#than rank {1}", ref=49018 }, -- Sudden Doom (Rank 2)
[49530] = { ref=49529 }, -- Sudden Doom (Rank 3)
-- Threat of Thassarian
[65661] = { "Загроза Тассаріана", "Коли ви тримаєте одноручну зброю в кожній руці, здібності \"Удар смерті\", \"Знищення\", \"Удар чуми\", \"Рунічний удар\", \"Кривавий удар\" та \"Крижаний удар\" з ймовірністю {1}% завдають шкоди від зброї в лівій руці.#a {1}% chance" }, -- Threat of Thassarian (Rank 1)
[66191] = { ref=65661 }, -- Threat of Thassarian (Rank 2)
[66192] = { ref=65661 }, -- Threat of Thassarian (Rank 3)
-- Toughness
[49042] = { "Міць", "Збільшує вашу броню з предметів на {1}%.#items by {1}%" }, -- Toughness (Rank 1)
[49786] = { ref=49042 }, -- Toughness (Rank 2)
[49787] = { ref=49042 }, -- Toughness (Rank 3)
-- Unholy Command
[49588] = { "Нечестивий наказ", "Зменшує час відновлення \"Смертельної хватки\" на {1} с і з ймовірністю {2}% \"Смертельна хватка\" завершує відновлення після вбивства цілі, що приносить досвід або честь.#by {1} sec#a {2}% chance" }, -- Unholy Command (Rank 1)
[49589] = { ref=49588 }, -- Unholy Command (Rank 2)
-- Unholy Frenzy
[49016] = { "Нечестиве шаленство", "Викликає в учасника групи чи рейду смертельне шаленство на {1} с. Ціль отримує ефект несамовитості, її швидкість атак ближнього та дальнього бою збільшується на {2}%, але вона втрачає {3}% здоров'я кожні {4} с.#frenzy for {1} sec#haste by {2}%#equal to {3}%#every {4} sec", "Швидкість ближнього та дальнього бою збільшено на {1}%.\nВтрачає {2}% здоров'я кожні {3} с.#increased by {1}%#to {2}% of#every {3} sec" }, -- Unholy Frenzy
-- Unholy Might
[91107] = { "Нечестива міць", "Темна сила тече вашими жилами, збільшуючи силу на {1}%.#by {1}%" }, -- Unholy Might (Passive)
-- Unholy Presence
[48265] = { "Сила нечестивості", "Ви сповнюєтесь нечестивою люттю, що збільшує швидкість атак та відновлення рун на {1}%, збільшує швидкість руху на {2}% та зменшує глобальний час відновлення ваших здібностей на {3} с. Одночасно може бути активною лише одна сила, а її зміна поглинає всю силу рун.#regeneration by {1}%#speed by {2}%#abilities by {3} sec", "Швидкість атак та відновлення рун збільшено на {1}%.\nШвидкість руху збільшено на {2}%.\nГлобальний час відновлення ваших здібностей зменшено на {3} с.#regeneration increased {1}%#speed increased by {2}%#reduced by {3} sec" }, -- Unholy Presence
-- Vampiric Blood
[55233] = { "Вампірська кров", "Тимчасово збільшує максимальний запас здоров'я лицаря смерті на {1}% та збільшує обсяг отриманого здоров'я від зцілення та ефектів на {2}% протягом {3} с. Після завершення ефекту здоров'я втрачається.#Knight {1}%#by {2}% for {3} sec", "Зцілення збільшено на {1}%.\nМаксимальний запас здоров'я збільшено на {2}%.#received increased by {1}%#health increased by {2}" }, -- Vampiric Blood
-- Vengeance
[93099] = { "Помста", "Щоразу, коли ви отримуєте шкоду, ви збільшуєте силу атаки на {1}% від отриманої шкоди, але не більше, ніж на {2}% від вашого здоров'я.#gain {1}% of#of {2}% of" }, -- Vengeance (Passive)
-- Veteran of the Third War
[50029] = { "Ветеран третьої війни", "Збільшує вашу витривалість на {1}%, вправність на {2} та зменшує час відновлення \"Спалаху хвороби\" на {3} с.#Stamina by {1}%#expertise by {2}#by {3} sec" }, -- Veteran of the Third War (Passive)
-- Virulence
[48962] = { "Смертоносність", "Збільшує шкоду ваших хвороб на {1}%.#by {1}%" }, -- Virulence (Rank 1)
[49567] = { ref=48962 }, -- Virulence (Rank 2)
[49568] = { ref=48962 }, -- Virulence (Rank 3)
-- Will of the Necropolis
[81163] = { "Воля некрополя", "Коли атака знижує ваш рівень здоров'я нижче {1}%, відновлення \"Поглинання руни\" завершується, наступне його застосування не витрачає рун, а отримана шкода зменшується на {2}% протягом {3} с. Цей ефект не може спрацьовувати частіше, ніж раз на {4} с.#below {1}% of#by {2}% for {3} sec#every {4} sec" }, -- Will of the Necropolis (Rank 2)
[81164] = { ref=81163 }, -- Will of the Necropolis (Rank 3)

}

for k, v in pairs(deathknight_spells) do addonTable.spell[k] = v end