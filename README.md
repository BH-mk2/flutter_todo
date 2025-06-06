# Flutter Todo App

A simple and intuitive Todo application built with Flutter that allows you to manage your daily tasks efficiently. The app supports adding, editing, deleting, and checking off todo items, with persistent storage to maintain your tasks even after closing the app.

## Features

- ✅ Add new todo items
- ✏️ Edit existing todos
- 🗑️ Delete completed or unwanted tasks
- ☑️ Mark tasks as complete/incomplete
- 💾 Persistent storage - your todos are saved automatically
- 📱 Cross-platform support (iOS, Android, Web, Desktop)

## Dependencies

This project uses the following key dependencies:

- [flutter_riverpod](https://pub.dev/packages/flutter_riverpod) - State management
- [uuid](https://pub.dev/packages/uuid) - Unique ID generation for todos
- [cupertino_icons](https://pub.dev/packages/cupertino_icons) - iOS-style icons

For a complete list of dependencies, see [`pubspec.yaml`](pubspec.yaml).

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.5 <4.0.0)
- Dart SDK
- An IDE with Flutter support (VS Code, Android Studio, or IntelliJ)

### Installation

1. Clone this repository
2. Navigate to the project directory
3. Install dependencies:

```bash
flutter pub get
```

4. Run the app:

```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart              # App entry point
├── todo.dart              # Todo model and state management
└── dialog/
    ├── inputdialog_todo.dart   # Dialog for adding new todos
    └── editdialog_todo.dart    # Dialog for editing existing todos
```

## Flutter Resources

If this is your first Flutter project, here are some helpful resources:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Online documentation](https://docs.flutter.dev/) - Tutorials, samples, guidance on mobile development, and a full API reference
