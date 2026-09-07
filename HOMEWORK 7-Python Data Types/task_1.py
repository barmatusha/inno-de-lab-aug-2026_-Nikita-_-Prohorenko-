raw_user_record = " 10827 ; aLeXanDer_vLaDimiRov ; mInSk ; ACTIVE "

raw_user_record_list = raw_user_record.split(';')

normalize_user_record_list = []

for p in raw_user_record_list:
    normalize_user_record_list.append(p.strip())

print(f"Исходная строка: {raw_user_record}")

normalize_user_record_list[0] = f"UID-{normalize_user_record_list[0]}"

normalize_user_record_list[1] = normalize_user_record_list[1].replace("_", " ").title()

normalize_user_record_list[2] = normalize_user_record_list[2].upper()

normalize_user_record_list[3] = normalize_user_record_list[3].lower()

normalize_user_record_str = " | ".join(normalize_user_record_list)

print(f"Нормализованная строка: {normalize_user_record_str}")
