# who_are_you

Мини-игра по фото

## Ссылки на ресурсы

- [CodeChat api]()
- [CodeChat design]()

## Параметры окружения

- Dart 3.0.5 +
- Flutter 3.13 +

## Подготовка проекта

```
// Если не установлен fvm - использовать те же команды,
// но без fvm в начале строки

// 1. Получить зависимости

fvm flutter pub get

// 2. Для datasource моделей используется freezed.
// В случае когда анализатор ругается на отсутствие релизаций
// этих моделей:

fvm flutter pub run build_runner build

// Если происходит ошибка при построении графа - сделать
// генерацию с удаление старого кода

fvm flutter pub run build_runner build -d
```

## ios

```
fvm flutter run
```

## Getting Started

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
