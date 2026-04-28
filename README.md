# FixCRM New

A premium CRM application built with Flutter, focusing on scalability, performance, and a state-of-the-art user experience.

## 🚀 Getting Started

### Prerequisites
- Flutter SDK: `^3.7.0`
- Dart SDK: `^3.7.0`

### Initial Setup
1. Clone the repository.
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Generate required code (Riverpod, Freezed, JsonSerializable):
   ```bash
   dart run build_runner build -d
   ```

## 🛠 Development Commands

### Code Generation
For continuous code generation while developing:
```bash
dart run build_runner watch -d
```

### Running the App
The project uses environment-specific entry points:

- **Production**:
  ```bash
  flutter run -t lib/main_prod.dart
  ```
- **UAT (Testing)**:
  ```bash
  flutter run -t lib/main_uat.dart
  ```
- **Development**:
  ```bash
  flutter run -t lib/main_dev.dart
  ```

## 🏗 Architecture

This project follows a **Feature-first** architecture powered by **Riverpod 2.x** with code generation.

### Structure
```text
lib/
├── core/             # Global services, API clients, and observers
├── feature/          # Domain-specific modules (auth, dashboard, etc.)
│   └── [feature]/
│       ├── data/         # Models and Repositories
│       └── presentation/ # UI and Riverpod Providers/Notifiers
├── theme/            # App design system (colors, typography)
└── utils/            # Shared helper widgets and extensions
```

### Key Technologies
- **State Management**: [Riverpod](https://riverpod.dev/) (with Generator)
- **Networking**: [Dio](https://pub.dev/packages/dio)
- **Model Generation**: [Freezed](https://pub.dev/packages/freezed) & [JsonSerializable](https://pub.dev/packages/json_serializable)
- **UI Scaling**: [Flutter ScreenUtil](https://pub.dev/packages/flutter_screenutil)
- **Icons & Fonts**: [Google Fonts](https://pub.dev/packages/google_fonts) & [Flutter SVG](https://pub.dev/packages/flutter_svg)

## ✅ Quality Standards
Before committing, ensure the code passes analysis:
```bash
flutter analyze
```

