local _, addonTable = ...

local warrior_spells = {

-- See /entries/classic/spell.lua for data format details.

-- Annihilation
[409073] = { "Анігіляція", "Ваші атаки ближнього бою додають {1} люті.#generate {1} Rage", en="Annihilation" },
-- Astral Perfect Victory
[459612] = { "Бездоганна астральна перемога", nil, "{1} бездоганних дуелей без поразок проти Хонсу.#{1} flawless", en="Astral Perfect Victory" },
-- Battle Forecast
[457816] = { "Бойове передчуття", nil, "Збільшує отриману фізичну шкоду на {1}%.#by {1}%", en="Battle Forecast" },
-- Berserker Forecast
[457817] = { "Передчуття берсерка", nil, "Збільшує ймовірність завдання критичного удару на {1}%.#by {1}%", en="Berserker Forecast" },
-- Blood Frenzy
[403352] = { "Криваве шаленство", "Отримати здібність \"Криваве шаленство\":", rune=412507, en="Blood Frenzy" },
[412507] = { "Криваве шаленство", "\"Розрив\" тепер можна застосовувати в стійці берсерка, його шкоду збільшено на {1}% і щоразу, коли його ефект завдає шкоди, ціль отримує додаткову шкоду в розмірі {2}% від вашої сили атаки.#increased by {1}%#equal to {2}%", en="Blood Frenzy" },
-- Blood Surge
[413380] = { "Приплив крові", "\"Героїчний удар\", \"Кровожерливість\" та \"Вихор\" з ймовірністю 30% дозволяють використати наступне \"Розтрощення\" протягом 15 секунд миттєво, з обох рук і без витрат люті.", en="Blood Surge" },
[413399] = { "Приплив крові", nil, "Ваше наступне \"Розтрощення\" застосується миттєво та без витрат люті.", en="Blood Surge" },
[415743] = { "Приплив крові", "Отримати здібність \"Приплив крові\":", rune=413380, en="Blood Surge" },
-- Charge
[411684] = { "Ривок", "Ривок у ворога, що збільшує лють на {1} і приголомшує його на {2} с.#generate {1} rage#for {2} sec", en="Charge" },
[438538] = { ref=22911 }, -- Charge
[438540] = { "Ривок", "Ривок у ворога, що завдає звичайної шкоди.", en="Charge" },
[438541] = { "Ривок", "Ривок у ворога.", en="Charge" },
[462937] = { ref=22911 }, -- Charge
-- Commanding Shout
[403215] = { "Командирський крик", "Воїн кричить, збільшуючи витривалість всіх членів групи в радіусі {1} м на {2}. Триває {3} хв.#within {1} yards by {2}#Lasts {3} min", "Збільшує вашу витривалість на {1}.#by {1}", en="Commanding Shout" },
[403435] = { "Командирський крик", "Отримати здібність \"Командирський крик\":", rune=403215, en="Commanding Shout" },
-- Consumed By Rage
[425418] = { "Неконтрольована лють", "Коли ви накопичуєте {2} люті, ви скаженієте на {1} секунд, що дозволяє використовувати здібності, що потребують ефекту несамовитості. Окрім того, \"Вихор\" також б'є з обох рук.#for {1} sec#exceed {2} Rage", en="Consumed By Rage" },
-- Consumed by Rage
[425440] = { "Неконтрольована лють", "Отримати здібність \"Неконтрольована лють\":", rune=425418, en="Consumed by Rage" },
-- Coup
[1231416] = { "Переворот", nil, "Отримає на {1}% більше шкоди від наступної \"Страти\".#Take {1}% increased", en="Coup" },
-- Deep Wound
[412609] = { ref=12721 }, -- Deep Wound
-- Defensive Forecast
[457814] = { "Захисне передчуття", nil, "Зменшує отриману фізичну шкоду на {1}%.#by {1}%", en="Defensive Forecast" },
-- Devastate
[403195] = { "Спустошення", "Поки ви перебуваєте в захисній стійці та тримаєте щит, \"Розкол броні\" також завдає {1}% від шкоди вашої зброї за секунду, яка збільшується на {2}% за кожен ефект \"Розколу броні\" на цілі. Шкода \"Спустошення\" спричиняє збільшену загрозу, якщо ви перебуваєте в захисній стійці.#to {1}% of your equipped#by {2}% per", en="Devastate" },
[403355] = { "Спустошення", "Отримати здібність \"Спустошення\":", rune=403195, en="Devastate" },
[403196] = { "Спустошення", "\"Розкол броні\" також завдає {1}% шкоди від зброї, яка збільшується на {2}% за кожен ефект \"Розколу броні\" на цілі.#deals {1}% weapon#by {2}% per", en="Devastate" },
-- Echoes of Battle Stance
[457706] = { "Відлуння бойової стійки", nil, "Ви можете тимчасово використовувати всі здібності, які вимагають бойової стійки.", en="Echoes of Battle Stance" },
-- Echoes of Berserker Stance
[457708] = { "Відлуння стійки берсерка", nil, "Ви можете тимчасово використовувати всі здібності, які вимагають стійки берсерка.", en="Echoes of Berserker Stance" },
-- Echoes of Defensive Stance
[457699] = { "Відлуння захисної стійки", nil, "Ви можете тимчасово використовувати всі здібності, які вимагають захисної стійки.", en="Echoes of Defensive Stance" },
-- Echoes of Gladiator Stance
[457819] = { "Відлуння стійки гладіатора", nil, "Ви можете тимчасово використовувати всі здібності, які вимагають стійки гладіатора.", en="Echoes of Gladiator Stance" },
-- Endless Rage
[403218] = { "Нескінченна лють", "Ви отримуєте на 25% більше люті від усієї завданої шкоди.", en="Endless Rage" },
[403349] = { "Нескінченна лють", "Отримати здібність \"Нескінченна лють\":", rune=403218, en="Endless Rage" },
-- Enrage
[427066] = { "Несамовитість", nil, "Несамовитість. Шкоду \"Смертельного удару\", \"Кровожерливості\" та \"Трощення щитом\" збільшено на {1}%.#by {1}%", en="Enrage" },
-- Enraged Regeneration
[402913] = { "Несамовите відновлення", "Зцілює вам {1}% від максимального запасу здоров'я протягом {2} секунд. Можна використати лише поки діє \"Несамовитість\", \"Лють берсерка\" або \"Кривава лють\". Можна використати під час приголомшення.#for {1}% of#over {2} sec", "Зцілення {1}% від максимального запасу здоров'я щосекунди.#Healing {1}% of", en="Enraged Regeneration" },
[403359] = { "Несамовите відновлення", "Отримати здібність \"Несамовите відновлення\":", rune=402913, en="Enraged Regeneration" },
-- Flagellation
[402877] = { "Бичування", "Ви отримуєте лють від фізичної шкоди так, ніби на вас не одягнено жодних обладунків.", en="Flagellation" },
[402906] = { "Бичування", nil, "Фізичну шкоду збільшено на {1}%.#by {1}%", en="Flagellation" },
[403344] = { "Бичування", "Отримати здібність \"Бичування\":", rune=402877, en="Flagellation" },
-- Focused Rage
[29787] = { "Зосереджена лють", "Зменшує витрати люті ваших атакуючих здібностей на 3.", en="Focused Rage" },
[415745] = { "Зосереджена лють", "Отримати здібність \"Зосереджена лють\":", rune=29787, en="Focused Rage" },
-- Frenzied Assault
[425412] = { "Несамовитий натиск", "Під час використання дворучної зброї, ваша швидкість атаки збільшується на {1}%, а удари в ближньому бою надають {2} додаткової люті та {3}, якщо удар критичний.#increased by {1}%#hits generate {2} additional#or {3} additional", en="Frenzied Assault" },
[425442] = { "Несамовитий натиск", "Отримати здібність \"Несамовитий натиск\":", rune=425412, en="Frenzied Assault" },
[431046] = { ref=425412 }, -- Frenzied Assault
-- Fresh Meat
[440484] = { "Свіже м'ясо", "Ураження цілі \"Кровожерливістю\", \"Смертельним ударом\" чи \"Трощенням щитом\" з ймовірністю {1}% для першого разу і з ймовірністю {2}% для кожного наступного разу викликає у вас оскаженіння, що дозволяє використовувати здібності, що потребують ефекту несамовитості, та збільшує вашу фізичну шкоду на {3}% протягом {4} секунд.#has a {1}% chance#and a {2}% chance#deal {3}% increased#for {4} sec", en="Fresh Meat" },
[440493] = { "Свіже м'ясо", "Отримати здібність \"Свіже м'ясо\":", rune=440484, en="Fresh Meat" },
-- Furious Thunder
[403219] = { "Несамовитий грім", "\"Громовий удар\" тепер збільшує інтервал між атаками на додаткові {1}%, може бути використаний у будь-якій стійці, завдає на {2}% більше шкоди та створює на {3}% більше загрози.#additional {1}%#deals {2}% increased damage#deals {3}% increased threat", en="Furious Thunder" },
[403356] = { "Несамовитий грім", "Отримати здібність \"Несамовитий грім\":", rune=403219, en="Furious Thunder" },
-- Gladiator Stance
[412513] = { "Стійка гладіатора", "Агресивна стійка, що збільшує вашу шкоду на {1}% та збільшує ймовірність блоку на {2}%, поки ви тримаєте щит, але зменшує броню на {3}%, а загрозу - на {4}%. Окрім того, ви отримуєте на {5}% шкоди від автоатак по цілям, що не атакують вас.\n\nПоки ви тримаєте щит в стійці гладіатора, ви можете використовувати здібності інших стійок.#shield by {1}%#chance by {2}%#armor by {3}%#generated by {4}%#gain {5}% increased", en="Gladiator Stance" },
[415598] = { "Стійка гладіатора", "Отримати здібність \"Стійка гладіатора\":", rune=412513, en="Gladiator Stance" },
-- Heroic Shot
[403332] = { "Героїчний постріл", "Постріл в ціль, що завдає 300% шкоди від зброї дальнього бою. Додає 20 люті.", "Знемовлено.", en="Heroic Shot" },
-- Intercept Stun
[427746] = { ref=20253 }, -- Intercept Stun
-- Intervene
[403338] = { "Втручання", "Воїн здійснює стрімкий ривок до члена групи, перехоплюючи наступну атаку ближнього або дальнього бою, а також зменшуючи загрозу цілі на 10%.", "Наступна атака ближнього або дальнього бою, спрямована проти вас, буде спрямована на воїна, що втрутився.", en="Intervene" },
[403437] = { "Втручання", "Отримати здібність \"Втручання\":", rune=403338, en="Intervene" },
-- Intimidating Shout
[1213465] = { ref=19134 }, -- Intimidating Shout
-- Meathook
[403228] = { "М'ясний гак", "Кидок ланцюга з гаком, що чіпляє ціль і притягує її до вас. Не можна використовувати проти ворогів вище {1} рівня або проти ворогів, що позначені як боси.#level {1} or", en="Meathook" },
[403231] = { "М'ясний гак", "Кидок ланцюга з гаком, що чіпляє ціль і притягує її до вас.", en="Meathook" },
[403233] = { "М'ясний гак", "Кидок ланцюга з гаком, що чіпляє ціль і притягує її до вас. Ціль не може бути приголомшеною під час притягування.", "Невразливість до приголомшення.", en="Meathook" },
[403436] = { "М'ясний гак", "Отримати здібність \"М'ясний гак\":", rune=403228, en="Meathook" },
[445558] = { "М'ясний гак", ref=403231, en="Meathook" },
-- Precise Timing
[402922] = { "Точний розрахунок", "\"Розтрощення\" тепер застосовується миттєво, але відновлюється {1} с.#a {1} sec", en="Precise Timing" },
[415744] = { "Точний розрахунок", "Отримати здібність \"Точний розрахунок\":", rune=402922, en="Precise Timing" },
-- Quick Strike
[429765] = { "Швидкий удар", "Безрозсудна миттєва атака дворучною зброєю, що завдає від {1} до {2} фізичної шкоди. Ця здібність отримує бонус від усіх ефектів, пов'язаних з \"Героїчним ударом\", і активує їх.#dealing {1} to {2} physical", en="Quick Strike" },
[429748] = { "Швидкий удар", "Замінює здібність \"Героїчний удар\" на \"Швидкий удар\":", rune=429765, en="Quick Strike" },
[425428] = { "Швидкий удар", "Отримати здібність \"Швидкий удар\":", rune=429765, en="Quick Strike" },
-- Raging Blow
[402911] = { "Лютий удар", "Лютий удар, що завдає {1}% шкоди від зброї, але може бути застосований лише поки діє \"Несамовитість\", \"Лють берсерка\" або \"Кривава лють\". Здібності ближнього бою, застосовані протягом дії \"Несамовитості\", \"Люті берсерка\" або \"Кривавої люті\", скорочують відновлення \"Лютого удару\" на {2} с.#deals {1}% weapon#by {2} sec", en="Raging Blow" },
[425429] = { "Лютий удар", "Отримати здібність \"Лютий удар\":", rune=402911, en="Raging Blow" },
-- Rallying Cry
[426490] = { "Підбадьорливий клич", "Крик, що збільшує максимальний запас здоров'я всіх членів групи або рейду в радіусі {1} м на {2}% протягом {3} с.#{1} yards {2}% increased#for {3} sec", "Максимальний запас здоров'я збільшено на {1}%.#by {1}% of", en="Rallying Cry" },
[426492] = { "Підбадьорливий клич", "Отримати здібність \"Підбадьорливий клич\":", rune=426490, en="Rallying Cry" },
-- Rampage
[426940] = { "Шаленство", "Воїн впадає в шаленство, збільшуючи силу атаки на {1}% протягом {2} с. Цю здібність можна використати тільки в стані несамовитості.#power by {1}% for {2} sec", "Силу атаки збільшено на {1}%.#by {1}%", en="Rampage" },
[427070] = { "Шаленство", "Отримати здібність \"Шаленство\":", rune=426940, en="Rampage" },
-- Shield Mastery
[426980] = { "Майстерність володіння щитом", "Збільшує всю вашу фізичну шкоду на {1}%, поки ви тримаєте є щит, і зменшує тривалість усіх ефектів роззброєння проти вас на {2}%. Цей ефект не поєднується з іншими ефектами, що зменшують тривалість роззброєння.#by {1}% while#against you by {2}%", en="Shield Mastery" },
[427069] = { "Майстерність володіння щитом", "Отримати здібність \"Майстерність володіння щитом\":", rune=426980, en="Shield Mastery" },
-- Shockwave
[440488] = { "Ударна хвиля", "Створює ударну хвилю в конусі перед вами, що завдає {1} шкоди та приголомшує ворогів у межах {2} м на {3} с.#causing {1} damage#within {2} y#for {3} sec", "Приголомшено.", en="Shockwave" },
[440497] = { "Ударна хвиля", "Отримати здібність \"Ударна хвиля\":", rune=440488, en="Shockwave" },
-- Single-Minded Fury
[413404] = { "Цілеспрямована лють", "Коли ви тримає зброю в кожній руці, ваша швидкість руху збільшується на {1}%, а швидкість атаки збільшується на {2}% за кожен послідовний удар автоатакою по цілі. Ефект накопичується до {3} разів та діє {4} с або поки автоатака не вразить іншу ціль.#increased by {1}%#gain {2}% attack#up to {3} times#Lasts {4} sec", en="Single-Minded Fury" },
[415599] = { "Цілеспрямована лють", "Отримати здібність \"Цілеспрямована лють\":", rune=413404, en="Single-Minded Fury" },
-- Slam
[462893] = { ref=1464 }, -- Slam
[462895] = { ref=1464 }, -- Slam
[462896] = { ref=1464 }, -- Slam
[462897] = { ref=1464 }, -- Slam
-- Spectral Shout
[460084] = { "Примарний крик", ref=19134, en="Spectral Shout" },
[460086] = { "Примарний крик", nil, "Тремтить від страху.", en="Spectral Shout" },
-- Sudden Death
[440114] = { "Раптова смерть", nil, "Ви можете використати здібність \"Страта\" незалежно від запасу здоров'я цілі, після чого у вас залишиться {1} люті.#have {1} Rage", en="Sudden Death" },
[440113] = { "Раптова смерть", "Ваші атаки ближнього бою з ймовірністю {1}% дозволяють застосувати \"Страту\" незалежно від рівня здоров'я цілі. Після застосування \"Страти\" таким чином, ви збережете {2} люті.#a {1}% chance#retain {2} rage", en="Sudden Death" },
[440495] = { "Раптова смерть", "Отримати здібність \"Раптова смерть\":", rune=440113, en="Sudden Death" },
-- Sword and Board
[426978] = { "Мечем і щитом", "Коли ваші здібності \"Спустошення\" і \"Помста\" завдають шкоди, вони з ймовірністю {1}% завершують відновлення вашої здібності \"Трощення щитом\" і зменшують витрати люті на неї на {2}% протягом {3} с.#a {1}% chance#by {2}% for {3} sec", en="Sword and Board" },
[426979] = { "Мечем і щитом", nil, "Витрати люті на \"Трощення щитом\" зменшено на {1}%.#by {1}%", en="Sword and Board" },
[427073] = { "Мечем і щитом", "Отримати здібність \"Мечем і щитом\":", rune=426978, en="Sword and Board" },
-- Tactician
[464241] = { "Тактик", "Зменшує витрати люті на наступну бойову здібність на {1}.#by {1}", "Зменшує витрати люті на наступну бойову здібність на {1}.#by {1}", en="Tactician" },
-- Taste for Blood
[426953] = { "Смак крові", "Щоразу, коли ваша здібність \"Розрив\" завдає шкоди, ваша здібність \"Здолання\" активується на {1} секунд або 1 атаку. Цей ефект не може спрацьовувати частіше, ніж раз на {2} секунд.#for {1} sec or#every {2} sec", en="Taste for Blood" },
[426969] = { "Смак крові", nil, "Дозволяє використовувати \"Здолання\".", en="Taste for Blood" },
[427067] = { "Смак крові", "Отримати здібність \"Смак крові\":", rune=426953, en="Taste for Blood" },
-- Thunder Clap
[413589] = { "Громовий удар", nil, "Інтервал між атаками збільшено на {1}%.#by {1}%", en="Thunder Clap" },
[461810] = { ref=8198 }, -- Thunder Clap
[461826] = { ref=8198 }, -- Thunder Clap
[461827] = { ref=8198 }, -- Thunder Clap
[461828] = { ref=8198 }, -- Thunder Clap
[461829] = { ref=8198 }, -- Thunder Clap
[461830] = { ref=6343 }, -- Thunder Clap
-- Valor of Azeroth
[461475] = { "Доблесть Азероту", "Надихає всіх учасників групи чи рейду доблестю Азерота, збільшуючи ймовірність критичного ефекту всіх заклять та атак на {1}% та збільшуючи силу атаки на {2}. Триває {3} год.\n\nНе поєднується з аналогічними довготривалими ефектами.#attacks by {1}% and granting {2} Attack#Lasts {3} hr", "Збільшує ймовірність критичного ефекту всіх заклять та атак на {1}% та силу атаки на {2}.#attacks by {1}% and grants {2} Attack", en="Valor of Azeroth" },
-- Victorious State
[402975] = { "Переможність", "Насолоджується перемогою над ворогом.", en="Victorious State" },
-- Victory Rush
[402927] = { "Переможний запал", "Миттєва атака цілі, що завдає {1} шкоди і зцілює вас на {2}% від вашого максимального запасу здоров'я. Можна застосовувати лише протягом 20 секунд після вбивства ворога, що приносить досвід або честь.#causing {1} damage#for {2}% of", en="Victory Rush" },
[403434] = { "Переможний запал", "Отримати здібність \"Переможний запал\":", rune=402927, en="Victory Rush" },
-- Vigilance
[426972] = { "Пильність", "Ви оберігаєте учасника групи чи рейду, чим зменшуєте отриману ним шкоду на {1}% і перенаправляєте на себе {2}% його загрози. Крім того, щоразу, коли ціль отримує удар, ваша здібність \"Провокація\" відновлюється. Триває {3} хв. Цей ефект може діяти лише на одну ціль одночасно.#by {1}% and transferring {2}%#Lasts {3} min", "Отриману шкоду зменшено на {1}%, а {2}% загрози перенаправляється на воїна.#by {1}% and {2}% of", en="Vigilance" },
[426975] = { "Пильність", nil, "Отриману шкоду зменшено на {1}%, а {2}% загрози перенаправляється на воїна.#by {1}% and {2}% of", en="Vigilance" },
[427068] = { "Пильність", "Отримати здібність \"Пильність\":", rune=426972, en="Vigilance" },
-- War Machine
[413301] = { "Бойова машина", "Вбивство ворога, що приносить досвід або честь, додає {1} люті.#generates {1} Rage", en="War Machine" },
-- Warbringer
[425421] = { "Вісник війни", "Ваші здібності \"Ривок\", \"Перехоплення\" та \"Втручання\" тепер можна використовувати під час бою та в будь-якій стійці, а при активації вони знімають ефекти обмеження руху.", en="Warbringer" },
[425430] = { "Вісник війни", "Отримати здібність \"Вісник війни\":", rune=425421, en="Warbringer" },
-- Whirlwind
[462891] = { ref=1680 }, -- Whirlwind
-- Wrecking Crew
[427065] = { "Погром", "Ваші критичні удари в ближньому бою викликають у вас оскаженіння, що дозволяє використовувати здібності, що потребують ефекту несамовитості, та збільшуюють шкоду \"Смертельного удару\", \"Кровожерливості\" та \"Трощення щитом\" на {1}% протягом {2} секунд.#by {1}% for {2} sec", en="Wrecking Crew" },
[427074] = { "Погром", "Отримати здібність \"Погром\":", rune=427065, en="Wrecking Crew" },

-- Engraving
[416004] = { "Гравіювання пояса - Приплив крові", "Вигравіювати на поясі руну \"Приплив крові\":", rune=413380, en="Engrave Belt - Blood Surge" },
[409163] = { "Гравіювання пояса - Зосереджена лють", "Вигравіювати на поясі руну \"Зосереджена лють\":", rune=29787, en="Engrave Belt - Focused Rage" },
[416005] = { "Гравіювання пояса - Точний розрахунок", "Вигравіювати на поясі руну \"Точний розрахунок\":", rune=402922, en="Engrave Belt - Precise Timing" },
[403467] = { "Гравіювання чоботів - Несамовите відновлення", "Вигравіювати на чоботях руну \"Несамовите відновлення\":", rune=402913, en="Engrave Boots - Enraged Regeneration" },
[416002] = { "Гравіювання чоботів - Стійка гладіатора", "Вигравіювати на чоботях руну \"Стійка гладіатора\":", rune=412513, en="Engrave Boots - Gladiator Stance" },
[403472] = { "Гравіювання чоботів - Втручання", "Вигравіювати на чоботях руну \"Втручання\":", rune=403338, en="Engrave Boots - Intervene" },
[426491] = { "Гравіювання чоботів - Підбадьорливий клич", "Вигравіювати на чоботях руну \"Підбадьорливий клич\":", rune=426490, en="Engrave Boots - Rallying Cry" },
[427081] = { "Гравіювання браслетів - Шаленство", "Вигравіювати на браслетах руну \"Шаленство\":", rune=426940, en="Engrave Bracers - Rampage" },
[427082] = { "Гравіювання браслетів - Мечем і щитом", "Вигравіювати на браслетах руну \"Мечем і щитом\":", rune=426978, en="Engrave Bracers - Sword and Board" },
[427084] = { "Гравіювання браслетів - Погром", "Вигравіювати на браслетах руну \"Погром\":", rune=427065, en="Engrave Bracers - Wrecking Crew" },
[403474] = { "Гравіювання нагрудника - Криваве шаленство", "Вигравіювати на нагруднику руну \"Криваве шаленство\":", rune=412507, en="Engrave Chest - Blood Frenzy" },
[403480] = { "Гравіювання нагрудника - Бичування", "Вигравіювати на нагруднику руну \"Бичування\":", rune=402877, en="Engrave Chest - Flagellation" },
[425444] = { "Гравіювання нагрудника - Лютий удар", "Вигравіювати на нагруднику руну \"Лютий удар\":", rune=402911, en="Engrave Chest - Raging Blow" },
[425445] = { "Гравіювання нагрудника - Вісник війни", "Вигравіювати на нагруднику руну \"Вісник війни\":", rune=425421, en="Engrave Chest - Warbringer" },
[440492] = { "Гравіювання плаща - Свіже м'ясо", "Вигравіювати на плащі руну \"Свіже м'ясо\":", rune=440484, en="Engrave Cloak - Fresh Meat" },
[440496] = { "Гравіювання плаща - Ударна хвиля", "Вигравіювати на плащі руну \"Ударна хвиля\":", rune=440488, en="Engrave Cloak - Shockwave" },
[440494] = { "Гравіювання плаща - Раптова смерть", "Вигравіювати на плащі руну \"Раптова смерть\":", rune=440113, en="Engrave Cloak - Sudden Death" },
[403475] = { "Гравіювання рукавиць - Спустошення", "Вигравіювати на рукавицях руну \"Спустошення\":", rune=403195, en="Engrave Gloves - Devastate" },
[425443] = { "Гравіювання рукавиць - Швидкий удар", "Вигравіювати на рукавицях руну \"Швидкий удар\":", rune=429765, en="Engrave Gloves - Quick Strike" },
[416003] = { "Гравіювання рукавиць - Цілеспрямована лють", "Вигравіювати на рукавицях руну \"Цілеспрямована лють\":", rune=413404, en="Engrave Gloves - Single-Minded Fury" },
[403470] = { "Гравіювання рукавиць - Переможний запал", "Вигравіювати на рукавицях руну \"Переможний запал\":", rune=402927, en="Engrave Gloves - Victory Rush" },
[403489] = { "Гравіювання шолома - Нескінченна лють", "Вигравіювати на шоломі руну \"Нескінченна лють\":", rune=403218, en="Engrave Helm - Endless Rage" },
[427080] = { "Гравіювання шолома - Майстерність володіння щитом", "Вигравіювати на шоломі руну \"Майстерність володіння щитом\":", rune=426980, en="Engrave Helm - Shield Mastery" },
[427076] = { "Гравіювання шолома - Смак крові", "Вигравіювати на шоломі руну \"Смак крові\":", rune=426953, en="Engrave Helm - Taste for Blood" },
[427078] = { "Гравіювання шолома - Пильність", "Вигравіювати на шоломі руну \"Пильність\":", rune=426972, en="Engrave Helm - Vigilance" },
[425446] = { "Гравіювання штанів - Неконтрольована лють", "Вигравіювати на штанях руну \"Неконтрольована лють\":", rune=425418, en="Engrave Pants - Consumed by Rage" },
[425447] = { "Гравіювання штанів - Несамовитий натиск", "Вигравіювати на штанях руну \"Несамовитий натиск\":", rune=425412, en="Engrave Pants - Frenzied Assault" },
[403476] = { "Гравіювання штанів - Несамовитий грім", "Вигравіювати на штанях руну \"Несамовитий грім\":", rune=403219, en="Engrave Pants - Furious Thunder" },

-- Item effects
[1231404] = { "Переворот", "Атакуючи ворогів вищого за вас рівня ви накладаєте на них ефект, що збільшує шкоду наступної \"Страти\" на {1}%, а \"Отруєння\" на {2}% за кожен ефект. При накопиченні {3} ефектів ви зможете застосувати \"Страту\" незалежно від рівня здоров'я цілі.#Execute by {1}% or Envenom by {2}%#At {3} stacks", en="Coup" },
[467499] = { ref=23725 }, -- Gift of Life
[468462] = { "Захист Ґрі'лека", "Збільшує показник блокування щитом на {1} протягом {2} с та миттєво надає {3} люті.#block value by {1} for {2} sec#rage by {3}", "Показник блокування щитом збільшено на {1}.#by {1}", en="Gri'lek's Guard" },
[459608] = { ref=22778 }, -- Hamstring Rage Reduction

-- Set bonus enchants
[1214159] = { "Сезон 3 - Предмет - Набір храму Ан'Кіражу - Воїн - Бонус 2 предметів бійця", "Зменшує час відновлення \"Жаги смерті\" на {1}%.#Death Wish by {1}%", en="S03 - Item - TAQ - Warrior - Damage 2P Bonus" },
[1219754] = { "Душа ворожнечі", "Наповнити наплічники душею ворожнечі:\n\nЗбільшує вашу загрозу в захисній стійці додатково на {1}% та збільшує вашу шкоду в стійці гладіатора на {2}%.#Stance by an additional {1}%#Gladiator Stance by {2}%", en="Soul of Enmity" },
[1219764] = { "Душа землетрусу", "Наповнити наплічники душею землетрусу:\n\nЗменшує час відновлення \"Ударної хвилі\" на {1}%.#Shockwave by {1}%", en="Soul of the Aftershock" },
[1219743] = { "Душа бойового провидця", "Наповнити наплічники душею бойового провидця:\n\nПротягом {1} с після покидання стійки ви отримуєте позитивний ефект:\n\nБойова стіка/Стійка гладіатора: Ви завдаєте на {2}% більше шкоди.\n\nСтійка берсерка: Ймовірність завдання критичого удару збільшується на {3}%.\n\nЗахисна стійка: Ви отримуєте на {4}% менше шкоди.#first {1} sec after#{2}% increased damage done#{3}% increased critical strike chance#{4}% reduced Physical damage taken", en="Soul of the Battle Forecaster" },
[1219745] = { "Душа кровожера", "Наповнити наплічники душею кровожера:\n\nКритичні удари \"Здолання\" поновлюють тривалість ефекту \"Розриву\" на цілі до максимальної тривалості.", en="Soul of the Bloodseeker" },
[1219749] = { "Душа приреченого на смерть", "Наповнити наплічники душею приреченого на смерть:\n\nЗменшує час відновлення \"Жаги смерті\" на {1}%.#Death Wish by {1}%", en="Soul of the Deathbound" },
[1219755] = { "Душа відбивача", "Наповнити наплічники душею відбивача:\n\nВи отримуєте {1} люті щоразу коли парируєте атаку чи вашу атаку парирують.#gain {1} Rage every", en="Soul of the Deflective" },
[1219748] = { "Душа руйнівника", "Наповнити наплічники душею руйнівника:\n\nУдари \"Розтрощення\" завершують відновлення здібностей \"Смертельний удар\", \"Кровожерливість\" та \"Трощення щитом\".", en="Soul of the Destroyer" },
[1219763] = { "Душа гладіатора", "Наповнити наплічники душею гладіатора:\n\nЗменшує час відновлення здібності \"Кривава лють\" на {1} с, поки ви перебуваєте в стійці гладіатора.#Bloodrage ability by {1} sec", en="Soul of the Gladiator" },
[1219757] = { "Душа невпинного", "Наповнити наплічники душею невпинного:\n\nКоли ваша ціль парирує атаку, ви миттєво виконуєте удар у відповідь, завдаючи {1}% шкоди від зброї. Цей удар не можна блокувати, ухилитися від нього або парирувати, але його можна виконати лише раз на {2} секунд проти однієї цілі.#for {1}% weapon#once every {2} sec", en="Soul of the Incessant" },
[1219752] = { "Душа майстра блокування", "Наповнити наплічники душею майстра блокування:\n\nЗбільшує показник блокування щитом на {1}.#block value of your shield by {1}", en="Soul of the Pristine Blocker" },
[1219861] = { ref=1219752 }, -- Soul of the Pristine Blocker
[1219756] = { "Душа месника", "Наповнити наплічники душею месника:\n\n\"Помста\" також надає вам ефект \"Шквалу\", збільшуючи вашу швидкість атаки на {1}% для наступних {2} замахів.#speed by {1}% for the next {2} swings", en="Soul of the Revenger" },
[1219751] = { "Душа кровопивці", "Наповнити наплічники душею кровопивці:\n\nВи завдаєте на {1}% більше шкоди, поки на когось з ворогів неподалік діють обидва ваші ефекти \"Розрив\" та \"Глибокі рани\".#You deal {1}% increased", en="Soul of the Sanguinist" },
[1219753] = { "Душа дикуна", "Наповнити наплічники душею дикуна:\n\nВи отримуєте додатково {1} люті щоразу, коли отримуєте будь-яку шкоду чи завдаєте удару автоматичною атакою.#gain {1} extra Rage every", en="Soul of the Savage" },
[1219760] = { "Душа вартового", "Наповнити наплічники душею вартового:\n\n\"Трощення щитом\" спричиняє на {1}% більше загрози, а його відновлення миттєво завершується, якщо його блокували, ухилилися або парирували.#deals {1}% increased threat", en="Soul of the Sentinel" },
[1219762] = { "Душа шульги", "Наповнити наплічники душею шульги:\n\nЗменшує час відновлення здібності \"Трощення щитом\" на {1} с.#Slam ability by {1} sec", en="Soul of the Southpaw" },
[1219740] = { "Душа тактика", "Наповнити наплічники душею тактика:\n\nПісля зміни стійки витрати люті на вашу наступну бойову здібність зменшуються на {1}.#is reduced by {1}", en="Soul of the Tactician" },
[1219758] = { "Душа громовержця", "Наповнити наплічники душею громовержця:\n\nЗменшує час відновлення \"Громового удару\" на {1}%.#Clap by {1}%", en="Soul of the Thunderbringer" },
[1219747] = { "Душа титана", "Наповнити наплічники душею титана:\n\nЗдібності \"Героїчний удар\", \"Розтрощення\" та \"Здолання\" завдають на {1}% більше шкоди.#abilities deal {1}% more", en="Soul of the Titan" },
[1219742] = { "Душа ветерана війни", "Наповнити наплічники душею ветерана війни:\n\nПротягом {1} с після покидання стійки ви можете використовувати здібності, що вимагають цієї стійки.#For {1} sec after", en="Soul of the War Veteran" },

-- Set bonuses
[1214165] = { "Сезон 3 - Предмет - Набір руїн Ан'Кіражу - Воїн - Бонус 3 предметів танка", "Зменшує час відновлення \"Ударної хвилі\" на {1}%.#Shockwave by {1}%", en="S03 - Item - RAQ - Warrior - Tank 3P Bonus" },
[457652] = { "Сезон 3 - Предмет - Набір 1 - Воїн - Бонус 2 предметів бійця", "Після зміни стійки витрати люті на вашу наступну бойову здібність зменшуються на {1}.#is reduced by {1}", en="S03 - Item - T1 - Warrior - Damage 2P Bonus" },
[457697] = { "Сезон 3 - Предмет - Набір 1 - Воїн - Бонус 4 предметів бійця", "Протягом {1} с після покидання стійки ви можете використовувати здібності, що вимагають цієї стійки.#For {1} sec after", en="S03 - Item - T1 - Warrior - Damage 4P Bonus" },
[457820] = { "Сезон 3 - Предмет - Набір 1 - Воїн - Бонус 6 предметів бійця", "Протягом {1} с після покидання стійки ви отримуєте позитивний ефект:\n\nБойова стіка/Стійка гладіатора: Ви завдаєте на {2}% більше шкоди.\n\nСтійка берсерка: Ймовірність завдання критичого удару збільшується на {3}%.\n\nЗахисна стійка: Ви отримуєте на {4}% менше шкоди.#first {1} sec after#{2}% increased damage done#{3}% increased critical strike chance#{4}% reduced Physical damage taken", en="S03 - Item - T1 - Warrior - Damage 6P Bonus" },
[457645] = { "Сезон 3 - Предмет - Набір 1 - Воїн - Бонус 2 предметів танка", "Збільшує показник блокування щитом на {1}.#block value of your shield by {1}", en="S03 - Item - T1 - Warrior - Tank 2P Bonus" },
[457646] = { "Сезон 3 - Предмет - Набір 1 - Воїн - Бонус 4 предметів танка", "Ви отримуєте додатково {1} люті щоразу, коли отримуєте будь-яку шкоду чи завдаєте удару автоматичною атакою.#gain {1} extra Rage every", en="S03 - Item - T1 - Warrior - Tank 4P Bonus" },
[457651] = { "Сезон 3 - Предмет - Набір 1 - Воїн - Бонус 6 предметів танка", "Збільшує вашу загрозу в захисній стійці додатково на {1}% та збільшує вашу шкоду в стійці гладіатора на {2}%.#Stance by an additional {1}%#Gladiator Stance by {2}%", en="S03 - Item - T1 - Warrior - Tank 6P Bonus" },
[468072] = { "Сезон 3 - Предмет - Набір 2 - Воїн - Бонус 2 предметів бійця", "Критичні удари \"Здолання\" поновлюють тривалість ефекту \"Розриву\" на цілі до максимальної тривалості.", en="S03 - Item - T2 - Warrior - Damage 2P Bonus" },
[468235] = { "Сезон 3 - Предмет - Набір 2 - Воїн - Бонус 4 предметів бійця", "Здібності \"Героїчний удар\", \"Розтрощення\" та \"Здолання\" завдають на {1}% більше шкоди.#abilities deal {1}% more", en="S03 - Item - T2 - Warrior - Damage 4P Bonus" },
[468236] = { "Сезон 3 - Предмет - Набір 2 - Воїн - Бонус 6 предметів бійця", "Удари \"Розтрощення\" завершують відновлення здібностей \"Смертельний удар\", \"Кровожерливість\" та \"Трощення щитом\".", en="S03 - Item - T2 - Warrior - Damage 6P Bonus" },
[468065] = { "Сезон 3 - Предмет - Набір 2 - Воїн - Бонус 2 предметів танка", "Ви отримуєте {1} люті щоразу коли парируєте атаку чи вашу атаку парирують.#gain {1} Rage every", en="S03 - Item - T2 - Warrior - Protection 2P Bonus" },
[468067] = { "Сезон 3 - Предмет - Набір 2 - Воїн - Бонус 4 предметів танка", "\"Помста\" також надає вам ефект \"Шквалу\", збільшуючи вашу швидкість атаки на {1}% для наступних {2} замахів.#speed by {1}% for the next {2} swings", en="S03 - Item - T2 - Warrior - Protection 4P Bonus" },
[468069] = { "Сезон 3 - Предмет - Набір 2 - Воїн - Бонус 6 предметів танка", "Коли ваша ціль парирує атаку, ви миттєво виконуєте удар у відповідь, завдаючи {1}% шкоди від зброї. Цей удар не можна блокувати, ухилитися від нього або парирувати, але його можна виконати лише раз на {2} секунд проти однієї цілі.#for {1}% weapon#once every {2} sec", en="S03 - Item - T2 - Warrior - Protection 6P Bonus" },
[1214163] = { "Сезон 3 - Предмет - Набір храму Ан'Кіражу - Воїн - Бонус 4 предметів бійця", "Ви завдаєте на {1}% більше шкоди, поки на когось з ворогів неподалік діють обидва ваші ефекти \"Розрив\" та \"Глибокі рани\".#You deal {1}% increased", en="S03 - Item - TAQ - Warrior - Damage 4P Bonus" },
[1214160] = { "Сезон 3 - Предмет - Набір храму Ан'Кіражу - Воїн - Бонус 2 предметів танка", "Зменшує час відновлення \"Громового удару\" на {1}%.#Clap by {1}%", en="S03 - Item - TAQ - Warrior - Tank 2P Bonus" },
[1214162] = { "Сезон 3 - Предмет - Набір храму Ан'Кіражу - Воїн - Бонус 4 предметів танка", "\"Трощення щитом\" спричиняє на {1}% більше загрози, а його відновлення миттєво завершується, якщо його блокували, ухилилися або парирували.#deals {1}% increased threat", en="S03 - Item - TAQ - Warrior - Tank 4P Bonus" },
[468452] = { "Сезон 3 - Предмет - Набір Зул'Ґуруба - Воїн - Бонус 3 предметів Гладіатора", "Зменшує час відновлення здібності \"Трощення щитом\" на {1} с.#Slam ability by {1} sec", en="S03 - Item - ZG - Warrior - Gladiator 3P Bonus" },
[468453] = { "Сезон 3 - Предмет - Набір Зул'Ґуруба - Воїн - Бонус 5 предметів Гладіатора", "Зменшує час відновлення здібності \"Кривава лють\" на {1} с, поки ви перебуваєте в стійці гладіатора.#Bloodrage ability by {1} sec", en="S03 - Item - ZG - Warrior - Gladiator 5P Bonus" },
[1219976] = { "Душа ворожнечі", ref=457651, en="Soul of Enmity" },
[1219977] = { "Душа ворожнечі", en="Soul of Enmity" },
[1219992] = { "Душа землетрусу", ref=1214165, en="Soul of the Aftershock" },
[1219993] = { "Душа землетрусу", en="Soul of the Aftershock" },
[1219960] = { "Душа бойового провидця", ref=457820, en="Soul of the Battle Forecaster" },
[1219961] = { "Душа бойового провидця", en="Soul of the Battle Forecaster" },
[1219962] = { "Душа кровожера", ref=468072, en="Soul of the Bloodseeker" },
[1219963] = { "Душа кровожера", en="Soul of the Bloodseeker" },
[1219968] = { "Душа приреченого на смерть", ref=1214159, en="Soul of the Deathbound" },
[1219969] = { "Душа приреченого на смерть", en="Soul of the Deathbound" },
[1219978] = { "Душа відбивача", ref=468065, en="Soul of the Deflective" },
[1219979] = { "Душа відбивача", en="Soul of the Deflective" },
[1219966] = { "Душа руйнівника", ref=468236, en="Soul of the Destroyer" },
[1219967] = { "Душа руйнівника", en="Soul of the Destroyer" },
[1219990] = { "Душа гладіатора", ref=468453, en="Soul of the Gladiator" },
[1219991] = { "Душа гладіатора", en="Soul of the Gladiator" },
[1219982] = { "Душа невпинного", ref=468069, en="Soul of the Incessant" },
[1219983] = { "Душа невпинного", en="Soul of the Incessant" },
[1219972] = { "Душа майстра блокування", ref=21539, en="Soul of the Pristine Blocker" },
[1219973] = { "Душа майстра блокування", en="Soul of the Pristine Blocker" },
[1220180] = { ref=1219972 }, -- Soul of the Pristine Blocker
[1220181] = { ref=1219973 }, -- Soul of the Pristine Blocker
[1219980] = { "Душа месника", ref=468067, en="Soul of the Revenger" },
[1219981] = { "Душа месника", en="Soul of the Revenger" },
[1219970] = { "Душа кровопивці", ref=1214163, en="Soul of the Sanguinist" },
[1219971] = { "Душа кровопивці", en="Soul of the Sanguinist" },
[1219974] = { "Душа дикуна", ref=457646, en="Soul of the Savage" },
[1219975] = { "Душа дикуна", en="Soul of the Savage" },
[1219986] = { "Душа вартового", ref=1214162, en="Soul of the Sentinel" },
[1219987] = { "Душа вартового", en="Soul of the Sentinel" },
[1219988] = { "Душа шульги", ref=468452, en="Soul of the Southpaw" },
[1219989] = { "Душа шульги", en="Soul of the Southpaw" },
[1219956] = { "Душа тактика", en="Soul of the Tactician" },
[1219957] = { "Душа тактика", ref=457652, en="Soul of the Tactician" },
[1219984] = { "Душа громовержця", ref=1214160, en="Soul of the Thunderbringer" },
[1219985] = { "Душа громовержця", en="Soul of the Thunderbringer" },
[1219964] = { "Душа титана", ref=468235, en="Soul of the Titan" },
[1219965] = { "Душа титана", en="Soul of the Titan" },
[1219958] = { "Душа ветерана війни", ref=457697, en="Soul of the War Veteran" },
[1219959] = { "Душа ветерана війни", en="Soul of the War Veteran" },

}

for k, v in pairs(warrior_spells) do addonTable.spell[k] = v end
