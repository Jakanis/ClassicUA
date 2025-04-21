import sys
import sqlite3
from xml.etree import ElementTree
import utils

def collect_quests():
    database_path = 'database/classicua.db'
    print(f'Processing {database_path}')
    print('-' * 80)

    conn = sqlite3.connect(database_path)
    quest_expansion_and_id_pairs = [
        r for r in conn.execute('SELECT expansion, id FROM quests ORDER BY id')
    ]

    quests = { e: [] for e in utils.known_expansions }
    quests_cat_count = { e: {} for e in utils.known_expansions }
    quests_cat_total = { e: {} for e in utils.known_expansions }
    text_chars_used = {}
    issues = []

    for expansion, id in quest_expansion_and_id_pairs:
        if not expansion in quests:
            issues.append(f'[!] Unexpected expansion "{expansion}" for #{id}.')
            continue

        cat, side, title, objective, description, progress, completion = conn.execute(
            f'SELECT cat, side, title, objective, description, progress, completion FROM quests WHERE expansion="{expansion}" AND id={id}'
        ).fetchone()

        quests_folder_name = f'quests_{expansion}' if expansion != 'classic' else 'quests'
        quest_path = f'translation_from_crowdin/uk/{quests_folder_name}/{cat}'
        quest_filename = utils.get_quest_filename(id, title)
        xml_path_filename = f'{quest_path}/{quest_filename}.xml'

        try:
            tree = ElementTree.parse(xml_path_filename)
        except FileNotFoundError:
            issues.append(f'[!] File not found {xml_path_filename}')
            continue

        root = tree.getroot()
        strings = root.findall('./string')

        quests_cat_total[expansion][cat] =\
            1 + quests_cat_total[expansion][cat] if cat in quests_cat_total[expansion] else 1

        # if not strings:
        #     continue

        new_quest = {
            'id': id,
            'expansion': expansion,
            'title_en': title,
            'objective_en': objective,
            'description_en': description,
            'progress_en': progress,
            'completion_en': completion,
            'en': title,
            'title_uk': None,
            'objective_uk': None,
            'description_uk': None,
            'progress_uk': None,
            'completion_uk': None,
            'cat': cat
        }

        new_quest_chars = {}
        for s in strings:
            if s.text:
                string_attr = s.attrib['name'].lower()
                string_text = utils.get_clean_text(s.text)
                new_quest[string_attr+'_uk'] = string_text

                for c in string_text:
                    code = ord(c)
                    new_quest_chars[code] = 1 + new_quest_chars[code] if code in new_quest_chars else 1
                    text_chars_used[code] = 1 + text_chars_used[code] if code in text_chars_used else 1

        for b1, b2 in [ ('(', ')'), ('[', ']'), ('{', '}'), ('<', '>')]:
            b1_code, b2_code = ord(b1), ord(b2)

            b1_code_count = new_quest_chars[b1_code] if b1_code in new_quest_chars else 0
            b2_code_count = new_quest_chars[b2_code] if b2_code in new_quest_chars else 0

            if b1_code_count != b2_code_count:
                issues.append(f'[?] Bracers "{b1}" and "{b2}" don\'t match\n\t- quest: {new_quest}')

        if new_quest['title_uk']:
            print(f'{expansion} quest #{id} -> {new_quest["title_uk"]}')
            # quests[expansion][side].append(new_quest)
            quests_cat_count[expansion][cat] =\
                1 + quests_cat_count[expansion][cat] if cat in quests_cat_count[expansion] else 1

        quests[expansion].append(new_quest)
    return quests, quests_cat_count, quests_cat_total, text_chars_used, issues

def print_report(quests, quests_cat_count, quests_cat_total, text_chars_used, issues):
    print('-' * 80)
    total = 0

    for expansion in quests:
        expansion_total = 0
        for side in quests[expansion]:
            expansion_side_total = len(quests[expansion][side])
            expansion_total += expansion_side_total
            total += expansion_side_total
            print(f'[{expansion}] [{side}] quests: {expansion_side_total}')
        print(f'[{expansion}] quests: {expansion_total}\n')

    print(f'Total quests: {total}')

    print('-' * 80)
    for expansion in quests_cat_count:
        for cat in sorted(quests_cat_count[expansion].keys()):
            total = quests_cat_total[expansion][cat]
            count = quests_cat_count[expansion][cat]
            percent = (count * 100) // total if total > 0 else 0
            print(f'{expansion} {cat} - {count}/{total} - {percent}%')

    print('-' * 80)
    print('[Code]\t[Count]\t[Print]')
    untraceable_chars = { 0xa: 'new line', 0x20: 'space' }
    for code in sorted(text_chars_used.keys()):
        p = untraceable_chars[code] if code in untraceable_chars else chr(code)
        print('\\u%04X\t%d\t> %s <' % ( code, text_chars_used[code], p ))

    if issues:
        print('-' * 80)
        print('ISSUES FOUND:')
        for text in issues:
            print(text)

def save_quests_to_cache_db(quests: dict[str, list[dict]]):
    print('Saving quest data to cache DB')
    conn = sqlite3.connect('cache/quests.db')
    conn.execute('DROP TABLE IF EXISTS quests')
    conn.execute('''CREATE TABLE quests (
                        id INTEGER NOT NULL,
                        expansion TEXT NOT NULL,
                        title_en TEXT,
                        objective_en TEXT,
                        description_en TEXT,
                        progress_en TEXT,
                        completion_en TEXT,
                        title_uk TEXT,
                        objective_uk TEXT,
                        description_uk TEXT,
                        progress_uk TEXT,
                        completion_uk TEXT,
                        cat TEXT,
	                    UNIQUE("id","expansion")
                )''')

    conn.commit()
    with conn:
        for quest_expansion, quests in quests.items():
            for quest in quests:
                conn.execute(f'''INSERT INTO quests(id, expansion, title_en, objective_en, description_en, progress_en, completion_en, title_uk, objective_uk, description_uk, progress_uk, completion_uk, cat)
                                    VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)''',
                                (quest["id"], quest["expansion"], quest["title_en"], quest["objective_en"],
                                 quest["description_en"], quest["progress_en"], quest["completion_en"],
                                 quest["title_uk"], quest["objective_uk"], quest["description_uk"], quest["progress_uk"], quest["completion_uk"], quest["cat"]))

def main():
    sys.stdout.reconfigure(encoding='utf-8')

    quests, quests_cat_count, quests_cat_total, text_chars_used, issues = collect_quests()

    save_quests_to_cache_db(quests)
    # for expansion in quests:
    #     for side in quests[expansion]:
    #         utils.write_lua_quest_file(
    #             path    =f'translation_from_crowdin/entries/{expansion}',
    #             filename=f'quest_{side}',
    #             var     =f'quest_{side}',
    #             quests  =quests[expansion][side]
    #         )
    #
    # print_report(quests, quests_cat_count, quests_cat_total, text_chars_used, issues)

main()
