local _, addonTable = ...

local mage_spells = {

-- See /entries/classic/spell.lua for data format details.

-- Amplify Magic
[1008] = { "Підсилення магії", "Підсилює магію на обраному учаснику групи, збільшуючи отриману ним шкоду від заклять на {1}, а зцілення закляттями на {2}. Триває {3} хв.#by up to {1} and healing spells by up to {2}#Lasts {3} min", "Збільшує отриману магічну шкоду на {1}, а зцілення на {2}.#by up to {1} and healing by up to {2}", en="Amplify Magic" },
[8455] = { ref=1008 }, -- Amplify Magic
[10169] = { ref=1008 }, -- Amplify Magic
[10170] = { ref=1008 }, -- Amplify Magic
-- Arcane Concentration
[11213] = { "Арканічна сконцентрованість", "Після завдання удару закляттям, ви з ймовірністю {1}% отримаєте ефект \"Ясномова\". \"Ясномова\" зменшує витрати мани вашого наступного бойового закляття на {2}%.#you a {1}% chance#spell by {2}%", en="Arcane Concentration" },
[12574] = { ref=11213 }, -- Arcane Concentration
[12575] = { ref=11213 }, -- Arcane Concentration
[12576] = { ref=11213 }, -- Arcane Concentration
[12577] = { ref=11213 }, -- Arcane Concentration
-- Arcane Explosion
[1449] = { "Арканічний вибух", "Створює вибух арканічної магії навколо заклинача, завдаючи від {1} до {2} шкоди арканою всім цілям у радіусі {3} м.#causing {1} to {2}#within {3} yards", en="Arcane Explosion" },
[8437] = { ref=1449 }, -- Arcane Explosion
[8438] = { ref=1449 }, -- Arcane Explosion
[8439] = { ref=1449 }, -- Arcane Explosion
[10201] = { ref=1449 }, -- Arcane Explosion
[10202] = { ref=1449 }, -- Arcane Explosion
-- Arcane Focus
[11222] = { "Арканічна зосередженість", "Зменшує ймовірність опонента протистояти вашим закляттям аркани на {1}%.#spells by {1}", en="Arcane Focus" },
[12839] = { ref=11222 }, -- Arcane Focus
[12840] = { ref=11222 }, -- Arcane Focus
[12841] = { ref=11222 }, -- Arcane Focus
[12842] = { ref=11222 }, -- Arcane Focus
-- Arcane Instability
[15058] = { "Арканічна нестабільність", "Збільшує шкоду заклять та ймовірність критичного удару на {1}%.#chance by {1}", en="Arcane Instability" },
[15059] = { ref=15058 }, -- Arcane Instability
[15060] = { ref=15058 }, -- Arcane Instability
-- Arcane Intellect
[1459] = { "Арканічний інтелект", "Збільшує інтелект цілі на {1} протягом {2} хв.#by {1}#for {2} min", "Збільшує інтелект на {1}.#by {1}", en="Arcane Intellect" },
[1460] = { ref=1459 }, -- Arcane Intellect
[1461] = { ref=1459 }, -- Arcane Intellect
[10156] = { ref=1459 }, -- Arcane Intellect
[10157] = { ref=1459 }, -- Arcane Intellect
[16876] = { ref=1459 }, -- Arcane Intellect
[364161] = { ref=1459 }, -- Arcane Intellect
-- Arcane Meditation
[18462] = { "Арканічна медитація", "Дозволяє {1}% вашого відновлення мани продовжуватися під час вимови заклять.#Allows {1}%", en="Arcane Meditation" },
[18463] = { ref=18462 }, -- Arcane Meditation
[18464] = { ref=18462 }, -- Arcane Meditation
-- Arcane Mind
[11232] = { "Арканічний розум", "Збільшує ваш максимальний запас мани на {1}%.#maximum Mana by {1}%", en="Arcane Mind" },
[12500] = { ref=11232 }, -- Arcane Mind
[12501] = { ref=11232 }, -- Arcane Mind
[12502] = { ref=11232 }, -- Arcane Mind
[12503] = { ref=11232 }, -- Arcane Mind
-- Arcane Missiles
[5143] = { "Арканічні снаряди", "Запускає у ворога арканічні снаряди, що завдають {1} шкоди арканою щосекунди протягом {2} с.#causing {1}#for {2} sec", en="Arcane Missiles" },
[5144] = { ref=5143 }, -- Arcane Missiles
[5145] = { ref=5143 }, -- Arcane Missiles
[8416] = { ref=5143 }, -- Arcane Missiles
[8417] = { ref=5143 }, -- Arcane Missiles
[10211] = { ref=5143 }, -- Arcane Missiles
[10212] = { ref=5143 }, -- Arcane Missiles
[25345] = { ref=5143 }, -- Arcane Missiles
-- Arcane Power
[12042] = { "Арканічна могутність", "При активації збільшує шкоду ваших заклять на {1}%, але збільшує витрати мани на їх вимову на {2}%. Триває {3} с.#deal {1}% more#costing {2}% more#lasts {3} sec", "Збільшено шкоду та витрати мани ваших заклять.", en="Arcane Power" },
-- Arcane Resilience
[28574] = { "Арканічна стійкість", "Підсилює броню на величину, рівну {1}% від значення інтелекту.#equal to {1}", en="Arcane Resilience" },
-- Arcane Subtlety
[11210] = { "Арканічна вправність", "Зменшує опір цілі всім вашим закляттям на {1} та загрозу від ваших заклять аркани на {2}%.#all your spells by {1}#Arcane spells by {2}", en="Arcane Subtlety" },
[12592] = { ref=11210 }, -- Arcane Subtlety
-- Arctic Reach
[16757] = { "Арктична досяжність", "Збільшує дальність заклять \"Крижана стріла\" та \"Метелиця\", а також радіус дії заклять \"Крижаний спалах\" і \"Конус холоду\" на {1}%.#spells by {1}%", en="Arctic Reach" },
[16758] = { ref=16757 }, -- Arctic Reach
-- Blast Wave
[11113] = { "Вибухова хвиля", "Заклинач збурює навколо себе полум'яну хвилю, яка завдає від {1} до {2} шкоди вогнем усім ворогам у радіусі дії, а також паморочить їх на {3} с.#blast for {1} to {2}#dazing them for {3} sec", "Запаморочення.", en="Blast Wave" },
[13018] = { ref=11113 }, -- Blast Wave
[13019] = { ref=11113 }, -- Blast Wave
[13020] = { ref=11113 }, -- Blast Wave
[13021] = { ref=11113 }, -- Blast Wave
[15091] = { "Вибухова хвиля", "Вивільняє полум'яну хвилю, яка завдає шкоди вогнем навколишнім ворогам та зменшує їх швидкість руху на {1} с.#speed for {1} sec", "Швидкість руху зменшено.", en="Blast Wave" },
[15744] = { ref=15091 }, -- Blast Wave
[16046] = { ref=15091 }, -- Blast Wave
[17145] = { ref=15091 }, -- Blast Wave
[17277] = { ref=15091 }, -- Blast Wave
[22424] = { ref=15091 }, -- Blast Wave
[23039] = { ref=15091 }, -- Blast Wave
[23113] = { ref=15091 }, -- Blast Wave
[23331] = { ref=15091 }, -- Blast Wave
[25049] = { ref=15091 }, -- Blast Wave
[30092] = { ref=15091 }, -- Blast Wave
[20229] = { "Вибухова хвиля", "Завдає від {1} до {2} шкоди вогнем навколишнім ворогам та сповільнює їх рух на {3}% протягом {4} с.#Inflicts {1} to {2} Fire#speed by {3}% for {4} sec", "Швидкість руху зменшено на {1}%.#by {1}%", en="Blast Wave" },
-- Blink
[1953] = { "Блим", "Телепортує заклинача на {1} м уперед, якщо на шляху немає перешкод. Також звільняє його від приголомшень та пут.#{1} yards forward", "Блимає.", en="Blink" },
-- Blizzard
[10] = { "Метелиця", "Уламки льоду вкривають вибрану область, завдаючи {1} шкоди від криги протягом {2} с.#doing {1} Frost#over {2} sec", "{1} шкоди від криги щосекунди.#{1} Frost", en="Blizzard" },
[6141] = { ref=10 }, -- Blizzard
[8427] = { ref=10 }, -- Blizzard
[10185] = { ref=10 }, -- Blizzard
[10186] = { ref=10 }, -- Blizzard
[10187] = { ref=10 }, -- Blizzard
-- Burning Soul
[11083] = { "Палаюча душа", "Надає вашим закляттям вогню {1}% ймовірності не втрачати час вимови від отримання шкоди та зменшує загрозу від них на {2}%.#spells a {1}%#spells by {2}%", en="Burning Soul" },
[12351] = { ref=11083 }, -- Burning Soul
-- Chilled
[6136] = { "Охолодження", nil, "Рух сповільнено на {1}%, а інтервал між атаками збільшено на {2}%.#slowed by {1}%#increased by {2}%", en="Chilled" },
[12484] = { "Охолодження", "Охолоджує ціль на {1} c.#for {1} sec", "Рух сповільнено на {1}%.#by {1}%", en="Chilled" },
[12485] = { ref=12484 }, -- Chilled
[12486] = { ref=12484 }, -- Chilled
[7321] = { ref=6136 }, -- Chilled
[15850] = { "Охолодження", nil, "Інтервал між атаками збільшено на {1}%.\nШвидкість руху зменшено на {2}%.#increased by {1}%#reduced by {2}%", en="Chilled" },
[18101] = { ref=15850 }, -- Chilled
[20005] = { "Охолодження", "Зменшує швидкість руху цілі на {1}% та збільшує інтервал між атаками на {2}% протягом {3} с.#slowed by {1}%#increased by {2}% for {3} sec", "Швидкість руху зменшено на {1}%, а інтервал між атаками збільшено на {2}%.#slowed by {1}%#increased by {2}%", en="Chilled" },
-- Clearcasting
[12536] = { "Ясномова", nil, "Витрати мани вашого наступного бойового закляття зменшено на {1}%.#reduced by {1}%", en="Clearcasting" },
-- Cold Snap
[12472] = { "Холодний зрив", "При активації завершує відновлення всіх ваших заклять криги.", en="Cold Snap" },
-- Combustion
[11129] = { "Палання", "При активації збільшує ймовірність критичного удару ваших заклять вогню на {1}% за кожне влучання закляттями вогню. Цей ефект триває, доки ви тричі не завдасте критичного удару закляттями вогню.#spells by {1}%", en="Combustion" },
[28682] = { "Палання", nil, "Підвищує ймовірність критичного удару заклять вогню на {1}%.#spells by {1}%", en="Combustion" },
-- Cone of Cold
[120] = { "Конус холоду", "Завдає цілям у конусі перед заклиначем від {1} до {2} шкоди кригою та сповільнює їх на {3}% протягом {4} с.#take {1} to {2}#slowed by {3}% for {4} sec", "Швидкість руху зменшено на {1}%.#by {1}%", en="Cone of Cold" },
[8492] = { ref=120 }, -- Cone of Cold
[10159] = { ref=120 }, -- Cone of Cold
[10160] = { ref=120 }, -- Cone of Cold
[10161] = { ref=120 }, -- Cone of Cold
[12557] = { "Конус холоду", "Завдає шкоди від криги ворогам у конусі перед заклиначем та зменшує їх швидкість руху на {1} с.#for {1} sec", "Швидкість руху зменшено.", en="Cone of Cold" },
[12611] = { ref=12557 }, -- Cone of Cold
[15244] = { ref=12557 }, -- Cone of Cold
[20828] = { ref=12557 }, -- Cone of Cold
[22746] = { ref=12557 }, -- Cone of Cold
[30095] = { ref=12557 }, -- Cone of Cold
-- Conjure Food
[587] = { "Начаклування їжі", "Начаклувати кекси ({1} шт.), щоб забезпечити мага та союзників їжею.\n\nНачакловані предмети зникнуть, якщо вийти з гри більше, ніж на {2} хв.#Conjures {1} muffins#than {2} min", en="Conjure Food" },
[597] = { nil, "Начаклувати паляниці ({1} шт.), щоб забезпечити мага та союзників їжею.\n\nНачакловані предмети зникнуть, якщо вийти з гри більше, ніж на {2} хв.#Conjures {1} loaves#than {2} min", ref=587 }, -- Conjure Food
[990] = { nil, "Начаклувати житній хліб ({1} шт.), щоб забезпечити мага та союзників їжею.\n\nНачакловані предмети зникнуть, якщо вийти з гри більше, ніж на {2} хв.#Conjures {1} loaves#than {2} min", ref=587 }, -- Conjure Food
[6129] = { nil, "Начаклувати цільнозерновий хліб ({1} шт.), щоб забезпечити мага та союзників їжею.\n\nНачакловані предмети зникнуть, якщо вийти з гри більше, ніж на {2} хв.#Conjures {1} loaves#than {2} min", ref=587 }, -- Conjure Food
[10144] = { nil, "Начаклувати хліб на заквасці ({1} шт.), щоб забезпечити мага та союзників їжею.\n\nНачакловані предмети зникнуть, якщо вийти з гри більше, ніж на {2} хв.#Conjures {1} loaves#than {2} min", ref=587 }, -- Conjure Food
[10145] = { nil, "Начаклувати солодкі рулети ({1} шт.), щоб забезпечити мага та союзників їжею.\n\nНачакловані предмети зникнуть, якщо вийти з гри більше, ніж на {2} хв.#Conjures {1} sweet#than {2} min", ref=587 }, -- Conjure Food
[28612] = { nil, "Начаклувати рулети з корицею ({1} шт.), щоб забезпечити мага та союзників їжею.\n\nНачакловані предмети зникнуть, якщо вийти з гри більше, ніж на {2} хв.#Conjures {1} cinnamon#than {2} min", ref=587 }, -- Conjure Food
-- Conjure Mana Agate
[759] = { "Начаклування маноагату", "Начаклувати маноагат, який можна використати для миттєвого відновлення від {1} до {2} мани.\n\nНачакловані предмети зникнуть, якщо вийти з гри більше, ніж на 15 хвилин.#restore {1} to {2}", en="Conjure Mana Agate" },
-- Conjure Mana Citrine
[10053] = { "Начаклування маноцитрину", "Начаклувати маноцитрин, який можна використати для миттєвого відновлення від {1} до {2} мани.\n\nНачакловані предмети зникнуть, якщо вийти з гри більше, ніж на 15 хвилин.#restore {1} to {2}", en="Conjure Mana Citrine" },
-- Conjure Mana Jade
[3552] = { "Начаклування манонефриту", "Начаклувати манонефрит, який можна використати для миттєвого відновлення від {1} до {2} мани.\n\nНачакловані предмети зникнуть, якщо вийти з гри більше, ніж на 15 хвилин.#restore {1} to {2}", en="Conjure Mana Jade" },
-- Conjure Mana Ruby
[10054] = { "Начаклування манорубіну", "Начаклувати манорубін, який можна використати для миттєвого відновлення від {1} до {2} мани.\n\nНачакловані предмети зникнуть, якщо вийти з гри більше, ніж на 15 хвилин.#restore {1} to {2}", en="Conjure Mana Ruby" },
-- Conjure Water
[5504] = { "Начаклування води", "Начаклувати пляшки води ({1} шт.), щоб забезпечити мага та союзників питвом.\n\nНачакловані предмети зникнуть, якщо вийти з гри більше, ніж на {2} хв.#Conjures {1} bottles#than {2} min", en="Conjure Water" },
[5505] = { nil, "Начаклувати пляшки свіжої води ({1} шт.), щоб забезпечити мага та союзників питвом.\n\nНачакловані предмети зникнуть, якщо вийти з гри більше, ніж на {2} хв.#Conjures {1} bottles#than {2} min", ref=5504 }, -- Conjure Water
[5506] = { nil, "Начаклувати пляшки очищеної води ({1} шт.), щоб забезпечити мага та союзників питвом.\n\nНачакловані предмети зникнуть, якщо вийти з гри більше, ніж на {2} хв.#Conjures {1} bottles#than {2} min", ref=5504 }, -- Conjure Water
[6127] = { nil, "Начаклувати пляшки джерельної води ({1} шт.), щоб забезпечити мага та союзників питвом.\n\nНачакловані предмети зникнуть, якщо вийти з гри більше, ніж на {2} хв.#Conjures {1} bottles#than {2} min", ref=5504 }, -- Conjure Water
[10138] = { nil, "Начаклувати пляшки мінеральної води ({1} шт.), щоб забезпечити мага та союзників питвом.\n\nНачакловані предмети зникнуть, якщо вийти з гри більше, ніж на {2} хв.#Conjures {1} bottle#than {2} min", ref=5504 }, -- Conjure Water
[10139] = { nil, "Начаклувати пляшки газованої води ({1} шт.), щоб забезпечити мага та союзників питвом.\n\nНачакловані предмети зникнуть, якщо вийти з гри більше, ніж на {2} хв.#Conjures {1} bottle#than {2} min", ref=5504 }, -- Conjure Water
[10140] = { nil, "Начаклувати пляшки кристалічної води ({1} шт.), щоб забезпечити мага та союзників питвом.\n\nНачакловані предмети зникнуть, якщо вийти з гри більше, ніж на {2} хв.#Conjures {1} bottle#than {2} min", ref=5504 }, -- Conjure Water
-- Counterspell
[2139] = { "Протизакляття", "Протидіє вимові закляття ворогом та унеможливлює вимову будь-яких інших заклять тієї ж школи магії протягом {1} с. Спричиняє високий рівень загрози.#cast for {1} sec", en="Counterspell" },
-- Counterspell - Silenced
[18469] = { "Протизакляття - Знемовлення", nil, "Знемовлено.", en="Counterspell - Silenced" },
-- Critical Mass
[11115] = { "Критична маса", "Підвищує ймовірність критичного удару ваших заклять вогню на {1}%.#spells by {1}%", en="Critical Mass" },
[11367] = { ref=11115 }, -- Critical Mass
[11368] = { ref=11115 }, -- Critical Mass
-- Dampen Magic
[604] = { "Пом'якшення магії", "Послаблює магію на обраному учаснику групи, зменшуючи отриману ним шкоду від заклять на {1}, а зцілення закляттями на {2}. Триває {3} хв.#by up to {1} and healing spells by up to {2}#Lasts {3} min", "Зменшує отриману магічну шкоду на {1}, а зцілення на {2}.#by up to {1} and healing by up to {2}", en="Dampen Magic" },
[8450] = { ref=604 }, -- Dampen Magic
[8451] = { ref=604 }, -- Dampen Magic
[10173] = { ref=604 }, -- Dampen Magic
[10174] = { ref=604 }, -- Dampen Magic
-- Detect Magic
[2855] = { "Виявлення магії", "Виявляє сприятливі магічні ефекти на цілі протягом {1} хв.#for {1} min", "Виявлення магії.", en="Detect Magic" },
-- Elemental Precision
[29438] = { "Стихійна точність", "Зменшує ймовірність противника протистояти вашим закляттям криги та вогню на {1}%.#spells by {1}%", en="Elemental Precision" },
[29439] = { ref=29438 }, -- Elemental Precision
[29440] = { ref=29438 }, -- Elemental Precision
-- Evocation
[12051] = { "Прикликання", "Під час промовляння цього закляття ви відновлюєте ману зі швидкістю {1}% від звичайної. Триває {2} с.#increased by {1}#Lasts {2} sec", "Відновлення мани збільшено на {1}%.#increased by {1}%", en="Evocation" },
-- Fire Blast
[2136] = { "Вогняний підрив", "Підриває ворога, завдаючи від {1} до {2} шкоди вогнем.#{1} to {2}", en="Fire Blast" },
[2137] = { ref=2136 }, -- Fire Blast
[2138] = { ref=2136 }, -- Fire Blast
[8412] = { ref=2136 }, -- Fire Blast
[8413] = { ref=2136 }, -- Fire Blast
[10197] = { ref=2136 }, -- Fire Blast
[10199] = { ref=2136 }, -- Fire Blast
-- Fire Power
[11124] = { "Сила вогню", "Збільшує шкоду від ваших заклять вогню на {1}%.#spells by {1}%", en="Fire Power" },
[12378] = { ref=11124 }, -- Fire Power
[12398] = { ref=11124 }, -- Fire Power
[12399] = { ref=11124 }, -- Fire Power
[12400] = { ref=11124 }, -- Fire Power
-- Fire Vulnerability
[22959] = { "Вразливість до вогню", nil, "Збільшує отриману шкоду від вогню на {1}%.#by {1}%", en="Fire Vulnerability" },
-- Fire Ward
[543] = { "Вогняний оберіг", "Поглинає {1} шкоди від вогню. Триває {2} с.#Absorbs {1}#Lasts {2} sec", "Поглинає шкоду від вогню.", en="Fire Ward" },
[8457] = { ref=543 }, -- Fire Ward
[8458] = { ref=543 }, -- Fire Ward
[10223] = { ref=543 }, -- Fire Ward
[10225] = { ref=543 }, -- Fire Ward
-- Fireball
[133] = { "Вогняна куля", "Кидає вогняну кулю, що завдає від {1} до {2} шкоди від вогню і додатково {3} шкоди від вогню протягом {4} с.#{1} to {2}#additional {3}#over {4} sec", "{1} шкоди від вогню кожні {2} с.#{1} Fire damage every {2} sec", en="Fireball" },
[143] = { ref=133 }, -- Fireball
[145] = { ref=133 }, -- Fireball
[3140] = { ref=133 }, -- Fireball
[8400] = { ref=133 }, -- Fireball
[8401] = { ref=133 }, -- Fireball
[8402] = { ref=133 }, -- Fireball
[10148] = { ref=133 }, -- Fireball
[10149] = { ref=133 }, -- Fireball
[10150] = { ref=133 }, -- Fireball
[10151] = { ref=133 }, -- Fireball
[25306] = { ref=133 }, -- Fireball
-- Flame Throwing
[11100] = { "Метання полум'ям", "Збільшує дальність дії ваших заклять вогню на {1} м.#by {1} yards", en="Flame Throwing" },
[12353] = { ref=11100 }, -- Flame Throwing
-- Flamestrike
[2120] = { "Полум'яний удар", "Викликає вогняний стовп, що палить усіх ворогів у зоні ураження, завдаючи від {1} до {2} шкоди вогнем і додатково {3} шкоди вогнем протягом {4} с.#for {1} to {2}#additional {3}#over {4} sec", "{1} шкоди вогнем кожні {2} секунди.#{1} Fire damage every {2} sec", en="Flamestrike" },
[2121] = { ref=2120 }, -- Flamestrike
[8422] = { ref=2120 }, -- Flamestrike
[8423] = { ref=2120 }, -- Flamestrike
[10215] = { ref=2120 }, -- Flamestrike
[10216] = { ref=2120 }, -- Flamestrike
-- Frost Armor
[168] = { "Крижаний обладунок", "Збільшує броню на {1}. Якщо противник завдає удару заклиначеві, його рух може сповільнитися на {2}%, а інтервал між атаками збільшитися на {3}% протягом {4} с. Одночасно може бути активним лише один обладунок. Триває {5} хв.#Armor by {1}#slowed by {2}%#increased by {3}% for {4} sec#Lasts {5} min", "Збільшує броню на {1} та може сповільнити нападників.#Armor by {1}", en="Frost Armor" },
[7300] = { ref=168 }, -- Frost Armor
[7301] = { ref=168 }, -- Frost Armor
-- Frost Channeling
[11160] = { "Спрямування криги", "Знижує витрати мани на ваші закляття криги на {1}% і спричинений ними рівень загрози на {2}%.#mana cost of your Frost spells by {1}#threat caused by your Frost spells by {2}", en="Frost Channeling" },
[12518] = { ref=11160 }, -- Frost Channeling
[12519] = { ref=11160 }, -- Frost Channeling
-- Frost Nova
[122] = { "Крижаний спалах", "Вражає ворогів поруч із заклиначем, завдаючи від {1} до {2} шкоди кригою, та приморожує їх на місці на {3} с. Подальше завдання шкоди може перервати дію цього ефекту.#{1} to {2}#up to {3} sec", "Приморожено.", en="Frost Nova" },
[865] = { ref=122 }, -- Frost Nova
[6131] = { ref=122 }, -- Frost Nova
[10230] = { ref=122 }, -- Frost Nova
-- Frost Ward
[6143] = { "Крижаний оберіг", "Поглинає {1} шкоди від криги. Триває {2} сек.#Absorbs {1}#Lasts {2} sec", "Поглинає шкоду від криги.", en="Frost Ward" },
[8461] = { ref=6143 }, -- Frost Ward
[8462] = { ref=6143 }, -- Frost Ward
[10177] = { ref=6143 }, -- Frost Ward
[28609] = { ref=6143 }, -- Frost Ward
-- Frost Warding
[11189] = { "Крижаний захист", "Збільшує броню та опір від ваших заклять \"Крижаний обладунок\" і \"Льодяний обладунок\" на {1}%, а також надає вашому закляттю \"Крижаний оберіг\" {2}% імовірності відбити закляття та ефекти криги.#spells by {1}#{2}% chance to reflect", en="Frost Warding" },
[28332] = { ref=11189 }, -- Frost Warding
-- Frostbite
[11071] = { "Обмороження", "Ваші ефекти \"Охолодження\" з ймовірністю {1}% заморозять ціль на {2} с.#{1}% chance#for {2} sec", en="Frostbite" },
[12496] = { ref=11071 }, -- Frostbite
[12497] = { ref=11071 }, -- Frostbite
[12494] = { "Обмороження", nil, "Заморожено.", en="Frostbite" },
-- Frostbolt
[116] = { "Крижана стріла", "Запускає у ворога крижану стрілу, що завдає від {1} до {2} шкоди кригою та зменшує швидкість руху на {3}% протягом {4} с.#causing {1} to {2}#by {3}% for {4} sec", "Швидкість руху зменшено на {1}%.#by {1}%", en="Frostbolt" },
[205] = { ref=116 }, -- Frostbolt
[837] = { ref=116 }, -- Frostbolt
[7322] = { ref=116 }, -- Frostbolt
[8406] = { ref=116 }, -- Frostbolt
[8407] = { ref=116 }, -- Frostbolt
[8408] = { ref=116 }, -- Frostbolt
[10179] = { ref=116 }, -- Frostbolt
[10180] = { ref=116 }, -- Frostbolt
[10181] = { ref=116 }, -- Frostbolt
[25304] = { ref=116 }, -- Frostbolt
-- Ice Armor
[7302] = { "Льодяний обладунок", "Збільшує броню на {1} та опір кризі на {2}. Якщо ворог завдає удару по заклиначу, його швидкість руху може сповільнитися на {3}%, а інтервал між атаками збільшитися на {4}% протягом {5} с. Одночасно може бути активним лише один обладунок. Триває {6} хв.#Armor by {1}#resistance by {2}#slowed by {3}%#increased by {4}% for {5} sec#Lasts {6} min", "Збільшує броню на {1}, опір кризі на {2} і може сповільнити нападників.#Armor by {1}#resistance by {2}", en="Ice Armor" },
[7320] = { ref=7302 }, -- Ice Armor
[10219] = { ref=7302 }, -- Ice Armor
[10220] = { ref=7302 }, -- Ice Armor
-- Ice Barrier
[11426] = { "Льодяний бар'єр", "Миттєво захищає вас щитом, що поглинає {1} шкоди. Триває {2} хв. Поки щит тримається, вашу вимову заклять не можна перервати.#absorbing {1}#Lasts {2} min", "Поглинає шкоду.", en="Ice Barrier" },
[13031] = { ref=11426 }, -- Ice Barrier
[13032] = { ref=11426 }, -- Ice Barrier
[13033] = { ref=11426 }, -- Ice Barrier
-- Ice Block
[11958] = { "Льодяна брила", "Вас огортає брила льоду, що захищає вас від усіх фізичних атак і заклять на {1} с, але протягом цього часу ви не можете атакувати, рухатися або вимовляти закляття.#for {1} sec", "Невразливість до всіх атак та заклять. Не може атакувати, рухатися та застосовувати закляття.", en="Ice Block" },
-- Ice Shards
[11207] = { "Льодяні уламки", "Збільшує додаткову шкоду від критичних ударів заклять криги на {1}%.#spells by {1}", en="Ice Shards" },
[12672] = { ref=11207 }, -- Ice Shards
[15047] = { ref=11207 }, -- Ice Shards
[15052] = { ref=11207 }, -- Ice Shards
[15053] = { ref=11207 }, -- Ice Shards
-- Ignite
[11119] = { "Займання", "Ваші критичні удари закляттями вогню змушують ціль горіти, отримуючи додатково {1}% від шкоди закляття протягом {2} с.#additional {1}#over {2} sec", en="Ignite" },
[11120] = { ref=11119 }, -- Ignite
[12654] = { "Займання", nil, "Завдає шкоди вогнем кожні {1} с.#every {1} sec", en="Ignite" },
[12846] = { ref=11119 }, -- Ignite
[12847] = { ref=11119 }, -- Ignite
[12848] = { ref=11119 }, -- Ignite
-- Impact
[11103] = { "Струс", "Надає вашим закляттям вогню {1}% ймовірність приголомшити ціль на {2} с.#{1}% chance#for {2} sec", en="Impact" },
[12355] = { "Струс", nil, "Приголомшено.", en="Impact" },
[12357] = { ref=11103 }, -- Impact
[12358] = { ref=11103 }, -- Impact
[12359] = { ref=11103 }, -- Impact
[12360] = { ref=11103 }, -- Impact
-- Improved Arcane Explosion
[11242] = { "Покращений арканічний вибух", "Збільшує ймовірність критичного удару вашого закляття \"Арканічний вибух\" на {1}%.#by an additional {1}", en="Improved Arcane Explosion" },
[12467] = { ref=11242 }, -- Improved Arcane Explosion
[12469] = { ref=11242 }, -- Improved Arcane Explosion
-- Improved Arcane Missiles
[11237] = { "Покращені арканічні снаряди", "Збільшує ймовірність уникнути затримки вимови при отриманні шкоди для \"Арканічних снарядів\"[, \"Регенерації\" та \"Масової регенерації\"#Regeneration, or Mass Regeneration] на {1}%[, а для \"Арканічного спалаху\" та \"Чарокрижаної стріли\" на {1}%#and a {1}% chance to avoid interruption].#Gives you a {1}% chance", en="Improved Arcane Missiles" },
[12463] = { ref=11237 }, -- Improved Arcane Missiles
[12464] = { ref=11237 }, -- Improved Arcane Missiles
[16769] = { ref=11237 }, -- Improved Arcane Missiles
[16770] = { ref=11237 }, -- Improved Arcane Missiles
-- Improved Blizzard
[11185] = { "Покращена метелиця", "Надає вашому закляттю \"Метелиця\" ефект охолодження, що знижує швидкість руху цілей на {1}% протягом {2} с.#speed by {1}#Lasts {2} sec", en="Improved Blizzard" },
[12487] = { ref=11185 }, -- Improved Blizzard
[12488] = { ref=11185 }, -- Improved Blizzard
-- Improved Cone of Cold
[11190] = { "Покращений конус холоду", "Збільшує шкоду від вашого закляття \"Конус холоду\" на {1}%.#spell by {1}%", en="Improved Cone of Cold" },
[12489] = { ref=11190 }, -- Improved Cone of Cold
[12490] = { ref=11190 }, -- Improved Cone of Cold
-- Improved Counterspell
[11255] = { "Покращене протизакляття", "Надає вашому \"Протизакляттю\" {1}% імовірності знемовити ціль на {2} с.#{1}% chance#for {2} sec", en="Improved Counterspell" },
[12598] = { ref=11255 }, -- Improved Counterspell
-- Improved Fire Blast
[11078] = { "Покращений вогняний підрив", "Зменшує час відновлення вашого закляття \"Вогняний підрив\" на {1} с.#by {1} sec", en="Improved Fire Blast" },
[11080] = { ref=11078 }, -- Improved Fire Blast
[12342] = { ref=11078 }, -- Improved Fire Blast
-- Improved Fire Ward
[11094] = { "Покращений вогняний оберіг", "Надає вашому закляттю \"Вогняний оберіг\" {1}% ймовірності відбити закляття вогню.#{1}% chance to reflect", en="Improved Fire Ward" },
[13043] = { ref=11094 }, -- Improved Fire Ward
-- Improved Fireball
[11069] = { "Покращена вогняна куля", "Зменшує час вимови вашого закляття \"Вогняна куля\" на {1} с.#spell by {1} sec", en="Improved Fireball" },
[12338] = { ref=11069 }, -- Improved Fireball
[12339] = { ref=11069 }, -- Improved Fireball
[12340] = { ref=11069 }, -- Improved Fireball
[12341] = { ref=11069 }, -- Improved Fireball
-- Improved Flamestrike
[11108] = { "Покращений полум'яний удар", "Підвищує ймовірність критичного удару вашого закляття \"Полум'яний удар\" на {1}%.#spell by {1}%", en="Improved Flamestrike" },
[12349] = { ref=11108 }, -- Improved Flamestrike
[12350] = { ref=11108 }, -- Improved Flamestrike
-- Improved Frost Nova
[11165] = { "Покращений крижаний спалах", "Зменшує час відновлення вашого закляття \"Крижаний спалах\" на {1} с.#spell by {1}", en="Improved Frost Nova" },
[12475] = { ref=11165 }, -- Improved Frost Nova
-- Improved Frostbolt
[11070] = { "Покращена крижана стріла", "Зменшує час вимови вашого закляття \"Крижана стріла\" на {1} с.#spell by {1} sec", en="Improved Frostbolt" },
[12473] = { ref=11070 }, -- Improved Frostbolt
[16763] = { ref=11070 }, -- Improved Frostbolt
[16765] = { ref=11070 }, -- Improved Frostbolt
[16766] = { ref=11070 }, -- Improved Frostbolt
-- Improved Mana Shield
[11252] = { "Покращений щит мани", "Зменшує кількість витраченої мани на поглинання шкоди закляттям \"Щит мани\" на {1}%.#active by {1}%", en="Improved Mana Shield" },
[12605] = { ref=11252 }, -- Improved Mana Shield
-- Improved Scorch
[11095] = { "Покращений опік", "Ваші закляття \"Опік\" з ймовірністю {1}% зроблять вашу ціль вразливою до шкоди вогнем. Ця вразливість збільшує отриману ціллю шкоду вогнем на {2}% та триває {3} с. Ефект накопичується до {4} разів.#have a {1}% chance#target by {2}% and lasts {3} sec#up to {4} times", en="Improved Scorch" },
[12872] = { ref=11095 }, -- Improved Scorch
[12873] = { ref=11095 }, -- Improved Scorch
-- Incinerate
[18459] = { "Спалення", "Збільшує ймовірність критичного удару ваших заклять \"Вогняний підрив\" та \"Опік\" на {1}%.#spells by {1}%", en="Incinerate" },
[18460] = { ref=18459 }, -- Incinerate
-- Mage Armor
[6117] = { "Магівський обладунок", "Збільшує ваш опір усій магії на {1} і дозволяє {2}% вашого відновлення мани продовжуватися під час вимови заклять. Одночасно може бути активним лише один обладунок. Триває {3} хв.#magic by {1} and allows {2}%#Lasts {3} min", "Збільшує опір усім школам магії на {1} і дозволяє {2}% вашого відновлення мани продовжуватися під час вимови заклять.#by {1} and allows {2}%", en="Mage Armor" },
[22782] = { ref=6117 }, -- Mage Armor
[22783] = { ref=6117 }, -- Mage Armor
-- Magic Absorption
[29441] = { "Магічне поглинання", "Збільшує всі ваші види опору на {1}, а всі закляття, яким ви повністю протистояли, відновлюють {2}% від вашого запасу мани.#resistances by {1}#restore {2}", en="Magic Absorption" },
[29444] = { ref=29441 }, -- Magic Absorption
[29445] = { ref=29441 }, -- Magic Absorption
[29446] = { ref=29441 }, -- Magic Absorption
[29447] = { ref=29441 }, -- Magic Absorption
-- Magic Attunement
[11247] = { "Магічна налаштованість", "Збільшує дію ваших заклять \"Підсилення магії\" та \"Пом'якшення магії\" на {1}%.#spells by {1}%", en="Magic Attunement" },
[12606] = { ref=11247 }, -- Magic Attunement
-- Mana Shield
[1463] = { "Щит мани", "Поглинає {1} фізичної шкоди за рахунок мани. Випалює {2} мани за кожну одиницю поглинутої шкоди. Триває {3} хв.#Absorbs {1} physical#Drains {2} mana#Lasts {3} min", "Поглинає фізичну шкоду за рахунок мани.", en="Mana Shield" },
[8494] = { ref=1463 }, -- Mana Shield
[8495] = { ref=1463 }, -- Mana Shield
[10191] = { ref=1463 }, -- Mana Shield
[10192] = { ref=1463 }, -- Mana Shield
[10193] = { ref=1463 }, -- Mana Shield
-- Master of Elements
[29074] = { "Майстер стихій", "Ваші критичні удари закляттями вогню та криги повернуть {1}% від базових витрат мани на них.#refund {1}%", en="Master of Elements" },
[29075] = { ref=29074 }, -- Master of Elements
[29076] = { ref=29074 }, -- Master of Elements
-- Permafrost
[11175] = { "Вічна мерзлота", "Збільшує тривалість ваших ефектів \"Охолодження\" на {1} с та знижує швидкість ворожої цілі на {2}%.#effects by {1} sec#additional {2}%", en="Permafrost" },
[12569] = { ref=11175 }, -- Permafrost
[12571] = { ref=11175 }, -- Permafrost
-- Piercing Ice
[11151] = { "Пронизливий лід", "Збільшує шкоду від ваших заклять криги на {1}%.#spells by {1}%", en="Piercing Ice" },
[12952] = { ref=11151 }, -- Piercing Ice
[12953] = { ref=11151 }, -- Piercing Ice
-- Polymorph
[118] = { "Поліморфія", "Перетворює ворога на вівцю, змушуючи його блукати до {1} с. Вівця не здатна атакувати або вимовляти закляття, але дуже швидко відновлює здоров'я. Будь-яка шкода поверне ціль до нормального стану. Одночасно лише одна ціль може бути під ефектом \"Поліморфії\". Діє лише на звірів, гуманоїдів і звіряток.#up to {1} sec", "Не може атакувати та вимовляти закляття. Прискорене відновлення здоров'я.", en="Polymorph" },
[12824] = { ref=118 }, -- Polymorph
[12825] = { ref=118 }, -- Polymorph
[12826] = { ref=118 }, -- Polymorph
[28271] = { "Поліморфія", "Перетворює ворога на черепаху, змушуючи його блукати до {1} с. Черепаха не здатна атакувати або вимовляти закляття, але дуже швидко відновлює здоров'я. Будь-яка шкода поверне ціль до нормального стану. Одночасно лише одна ціль може бути під ефектом \"Поліморфії\". Діє лише на звірів, гуманоїдів і звіряток.#up to {1} sec", "Не може атакувати та вимовляти закляття. Прискорене відновлення здоров'я.", en="Polymorph" },
[28272] = { "Поліморфія", "Перетворює ворога на свиню, змушуючи його блукати до {1} с. Свиня не здатна атакувати або вимовляти закляття, але дуже швидко відновлює здоров'я. Будь-яка шкода поверне ціль до нормального стану. Одночасно лише одна ціль може бути під ефектом \"Поліморфії\". Діє лише на звірів, гуманоїдів і звіряток.#up to {1} sec", "Не може атакувати та вимовляти закляття. Прискорене відновлення здоров'я.", en="Polymorph" },
-- Presence of Mind
[12043] = { "Блиск розуму", "При активації ваше наступне закляття з тривалістю вимови менше {1} с буде миттєвим.#less than {1} sec", "Ваше наступне закляття з тривалістю вимови менше {1} с буде миттєвим.#less than {1} sec", en="Presence of Mind" },
-- Pyroblast
[11366] = { "Вогняна брила", "Кидає величезний вогняний валун, що завдає від {1} до {2} шкоди вогнем і додатково {3} шкоди вогнем протягом {4} с.#causes {1} to {2}#additional {3}#over {4} sec", "{1} шкоди вогнем кожні {2} секунди.#{1} Fire damage every {2} sec", en="Pyroblast" },
[12505] = { ref=11366 }, -- Pyroblast
[12522] = { ref=11366 }, -- Pyroblast
[12523] = { ref=11366 }, -- Pyroblast
[12524] = { ref=11366 }, -- Pyroblast
[12525] = { ref=11366 }, -- Pyroblast
[12526] = { ref=11366 }, -- Pyroblast
[18809] = { ref=11366 }, -- Pyroblast
[17273] = { "Вогняна брила", "Завдає ворогу шкоди від вогню та додаткової шкоди кожні {1} с протягом {2} с.#every {1} sec#for {2} sec", "Отримання шкоди від вогню кожні {1} с.#every {1} sec", en="Pyroblast" },
[17274] = { ref=17273 }, -- Pyroblast
-- Remove Lesser Curse
[475] = { "Зняття малого прокляття", "Знімає {1} прокляття з дружньої цілі.#Removes {1}", en="Remove Lesser Curse" },
-- Scorch
[2948] = { "Опік", "Обпікає ворога, завдаючи від {1} до {2} шкоди вогнем.#for {1} to {2}", en="Scorch" },
[8444] = { ref=2948 }, -- Scorch
[8445] = { ref=2948 }, -- Scorch
[8446] = { ref=2948 }, -- Scorch
[10205] = { ref=2948 }, -- Scorch
[10206] = { ref=2948 }, -- Scorch
[10207] = { ref=2948 }, -- Scorch
-- Shatter
[11170] = { "Розтрощення", "Збільшує ймовірність критичного удару всіх ваших заклять проти заморожених цілей на {1}%.#targets by {1}", en="Shatter" },
[12982] = { ref=11170 }, -- Shatter
[12983] = { ref=11170 }, -- Shatter
[12984] = { ref=11170 }, -- Shatter
[12985] = { ref=11170 }, -- Shatter
-- Slow Fall
[130] = { "Повільне падіння", "Сповільнює падіння на {1} с.#for {1} sec", "Падіння сповільнено.", en="Slow Fall" },
-- Wand Specialization
[6057] = { "Спеціалізація на жезлах", "Збільшує шкоду жезлів на {1}%.#by {1}%", en="Wand Specialization" },
[6085] = { ref=6057 }, -- Wand Specialization
-- Wild Magic
[23410] = { "Дика магія", nil, "Ви втратили контроль над своєю магією.", en="Wild Magic" },
-- Wild Polymorph
[23603] = { "Дика поліморфія", nil, "Не може атакувати та вимовляти закляття", en="Wild Polymorph" },
-- Winter's Chill
[11180] = { "Зимова холоднеча", "Ваші крижані закляття з ймовірністю {1}% спричинять ефект \"Зимової холоднечі\", що збільшує ймовірність критичного удару заклять криги по цілі на {2}% протягом {3} с. Ефект накопичується до {4} разів.#{1}% chance#by {2}% for {3} sec#up to {4} times", en="Winter's Chill" },
[12579] = { "Зимова холоднеча", nil, "Закляття криги мають збільшену на {1}% ймовірність завдати критичного удару.#have a {1}%", en="Winter's Chill" },
[28592] = { ref=11180 }, -- Winter's Chill
[28593] = { ref=11180 }, -- Winter's Chill
[28594] = { ref=11180 }, -- Winter's Chill
[28595] = { ref=11180 }, -- Winter's Chill

-- Item effects
[18378] = { "Збільшення відновлення мани", "Відновлює {1} мани кожні {2} с.#Restores {1} mana per {2} sec", en="Increased Mana Regen" },
[23723] = { "Прискорення думок", "Прискорює думки, збільшуючи швидкість вимови заклять на {1}% протягом {2} с.#casting speed by {1}% for {2} sec", "Швидкість вимови заклять збільшено на {1}%.#by {1}%", en="Mind Quickening" },

-- Portals
[11419] = { "Портал: Дарнас", "Створює портал, що телепортує учасників групи до Дарнаса при використанні.", en="Portal: Darnassus" },
[11416] = { "Портал: Залізогарт", "Створює портал, що телепортує учасників групи до Залізогарта при використанні.", en="Portal: Ironforge" },
[11417] = { "Портал: Орґріммар", "Створює портал, що телепортує учасників групи до Орґріммара при використанні.", en="Portal: Orgrimmar" },
[10059] = { "Портал: Штормовій", "Створює портал, що телепортує учасників групи до Штормовія при використанні.", en="Portal: Stormwind" },
[11420] = { "Портал: Громовий Бескид", "Створює портал, що телепортує учасників групи до Громового Бескиду при використанні.", en="Portal: Thunder Bluff" },
[11418] = { "Портал: Підмістя", "Створює портал, що телепортує учасників групи до Підмістя при використанні.", en="Portal: Undercity" },
[3565] = { "Телепортація: Дарнас", "Телепортує заклинача до Дарнаса.", en="Teleport: Darnassus" },
[3562] = { "Телепортація: Залізогарт", "Телепортує заклинача до Залізогарта.", en="Teleport: Ironforge" },
[3567] = { "Телепортація: Орґріммар", "Телепортує заклинача до Орґріммара.", en="Teleport: Orgrimmar" },
[3561] = { "Телепортація: Штормовій", "Телепортує заклинача до Штормовія.", en="Teleport: Stormwind" },
[3566] = { "Телепортація: Громовий Бескид", "Телепортує заклинача до Громового Бескиду.", en="Teleport: Thunder Bluff" },
[3563] = { "Телепортація: Підмістя", "Телепортує заклинача до Підмістя.", en="Teleport: Undercity" },

}

for k, v in pairs(mage_spells) do addonTable.spell[k] = v end
