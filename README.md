Практическая работа 8. Выполнил: Земсков Андрей ЭФБО-06-23. 


1.Скриншот настроенного проекта Firebase:

<img width="334" height="209" alt="image" src="https://github.com/user-attachments/assets/ad2927ec-e313-40b6-b502-3e32c3cb9870" />

<img width="150" height="320" alt="image" src="https://github.com/user-attachments/assets/97920e67-21fe-4fe4-81c3-c87851e9c489" />

2. Отображение списка:

<img width="224" height="479" alt="image" src="https://github.com/user-attachments/assets/5f07a042-8bc9-4027-95ce-f96703499d61" />

3. После добавления заметки: 

<img width="452" height="279" alt="image" src="https://github.com/user-attachments/assets/a4fbc790-d397-43b6-ad11-725cad5b27c0" />

4. После редактирования заметки:

<img width="282" height="595" alt="image" src="https://github.com/user-attachments/assets/a0753a0d-7ebe-42d3-bcec-976a381e99c5" />

<img width="269" height="585" alt="image" src="https://github.com/user-attachments/assets/3807b7b3-8e2f-4a9c-aa1c-7c0d9756ff6d" />

<img width="452" height="276" alt="image" src="https://github.com/user-attachments/assets/7665c791-4edd-4dc5-9232-372ec25de225" />

5. После удаления заметки: 

<img width="260" height="570" alt="image" src="https://github.com/user-attachments/assets/25166a64-a624-4ae1-8c55-b434e9073b0c" />

<img width="452" height="282" alt="image" src="https://github.com/user-attachments/assets/94352081-ced7-4994-8885-831538b3924f" />


6. Краткий отчет 

# Отчет по проекту Firebase Notes App

## Настройка Firebase проекта

**Создан проект в Firebase Console:**
- Название проекта: `notes-app-andrey`
- Подключенные платформы: Android, iOS, Web, macOS, Windows
- Автоматически сгенерирован файл конфигурации `lib/firebase_options.dart`

## Техническая реализация

### Зависимости проекта (`pubspec.yaml`)

```
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^3.15.2
  cloud_firestore: ^5.6.10
  cupertino_icons: ^1.0.8
```

### Инициализация Firebase
Инициализация выполнена в `main.dart`:

```
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
```

## Архитектура приложения

### Основной экран (`NotesPage`)
- **Коллекция Firestore:** `notes`
- **Режим реального времени:** StreamBuilder с `notes.snapshots()`
- **Основные функции:**
  - Просмотр списка заметок
  - Добавление новых заметок
  - Редактирование существующих заметок
  - Удаление заметок

### Структура данных в Firestore
**Коллекция:** `notes`

**Поля документа:**
```
{
  "text": "string",
  "created_at": "timestamp",
  "updated_at": "timestamp"
}
```

## Функциональность

### CRUD операции
- **CREATE:** Добавление заметки через диалоговое окно
- **READ:** Отображение списка в реальном времени
- **UPDATE:** Редактирование текста заметки
- **DELETE:** Удаление заметки с подтверждением

### Особенности реализации
- Использование `StreamBuilder` для автоматического обновления UI
- Диалоговые окна для добавления/редактирования заметок
- Хранение временных меток создания и обновления
- Кросс-платформенная конфигурация Firebase

## Безопасность

### Текущие правила Firestore
```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if true;
    }
  }
}
```
## Решенные технические задачи
- ✅ Настройка Firebase для всех платформ
- ✅ Реализация потокового обновления данных
- ✅ Сохранение временных меток создания и обновления
- ✅ Создание интуитивного пользовательского интерфейса

## Рекомендации для улучшения
- Добавить аутентификацию пользователей
- Настроить правила безопасности Firestore
- Реализовать разделение данных по пользователям
- Добавить категории и теги для заметок
- Реализовать поиск и фильтрацию заметок


видео : 
<img width="921" height="847" alt="Снимок экрана 2025-11-18 в 3 22 54 PM" src="https://github.com/user-attachments/assets/21d5fa5f-676b-458b-b600-c630e08e96f2" />


