# Fares - Flutter Delivery App - AI Coding Instructions

## Project Overview
A Flutter-based delivery management app for drivers, built with Clean Architecture, supporting Arabic RTL layout. The app handles order tracking, delivery status management, and driver workflows.

## Architecture & Project Structure

### Clean Architecture Pattern
- **Features**: Organized by domain (auth, driver/home, driver/orders, driver/chat, profile)
- **Layers per feature**:
  - `data/`: datasources, models, repositories
  - `presentation/`: views, widgets, cubit (state management)
  - `feature_di.dart`: Dependency injection setup for each feature

### Feature Module Pattern
Features use `part of` pattern with barrel files:
```dart
// feature_imports.dart acts as the main file
import 'package:flutter/material.dart';
part 'presentation/views/my_view.dart';
part 'presentation/widgets/my_widget.dart';
```
All feature files use `part of '../feature_imports.dart'` or similar.

### Dependency Injection
- **GetIt** service locator pattern
- Each feature has `{feature}_di.dart` file (e.g., `auth_di.dart`, `home_di.dart`)
- Register in `core/di/dependency_injection.dart`:
  - Data sources: `registerLazySingleton`
  - Repositories: `registerLazySingleton`
  - Cubits: `registerFactory` (new instance per request)

**Example pattern** (from `home_di.dart`):
```dart
Future<void> initHomeDI() async {
  getIt.registerLazySingleton<HomeDataSource>(
    () => HomeDataSourceImpl(apiService: getIt()),
  );
  getIt.registerLazySingleton(() => HomeRepo(homeDataSource: getIt()));
  getIt.registerFactory(() => HomeCubit(getIt()));
}
```

## State Management - Bloc/Cubit

### State Pattern
```dart
class HomeState extends Equatable {
  final StateType getAllSummaryState;  // loading, success, error, empty
  final DataModel? data;
  final String? errorMessage;
  // Use copyWith for immutability
}
```

### Cubit Usage
```dart
BlocProvider(
  create: (context) => getIt<HomeCubit>()..fetchData(),
  child: BlocBuilder<HomeCubit, HomeState>(...)
)
```

## Localization & Internationalization

### Arabic-First Approach
- Default locale: `ar` (Arabic)
- RTL layout by default
- Translations in `assets/lang/ar.json`
- Use `easy_localization` package
- Generated keys in `lib/generated/locale_keys.g.dart`

**Usage**:
```dart
import 'package:easy_localization/easy_localization.dart';
Text(LocaleKeys.welcomeMessage.tr())
// For parameters:
tr(LocaleKeys.resendIn, namedArgs: {'seconds': '30'})
```

**Adding new translations**:
1. Add key-value to `assets/lang/ar.json`
2. Run code generation: `flutter pub run easy_localization:generate -S assets/lang -f keys -o locale_keys.g.dart`

## UI Patterns & Conventions

### Scrollable Layouts
- **Use CustomScrollView with Slivers** for all scrollable screens
- Avoid nested scrollables; use `shrinkWrap: true` and `physics: NeverScrollableScrollPhysics()` if necessary
- Replace `Column` + `Expanded` with `SliverToBoxAdapter` + `SliverFillRemaining` in CustomScrollView

**Example**:
```dart
CustomScrollView(
  slivers: [
    SliverToBoxAdapter(child: HeaderWidget()),
    SliverToBoxAdapter(child: verticalSpace(20)),
    SliverList.builder(itemBuilder: ..., itemCount: ...),
  ],
)
```

### Animation Wrappers
Use `animate_do` package with custom wrappers from `core/routing/app_router.dart`:
- `CustomFadeInLeft` - For RTL entry animations (400-800ms duration)
- `CustomFadeInRight` - For LTR animations
- `CustomFadeInUp` - For bottom-to-top (buttons, forms)
- `CustomFadeInDown` - For top-to-bottom

### Spacing Utilities
Use helper functions from `core/helpers/spacing.dart`:
```dart
verticalSpace(20)  // SizedBox with height
horizontalSpace(16) // SizedBox with width
```

### Extension Methods
From `core/helpers/extensions.dart`:
```dart
context.pushNamed(Routes.homeRoute)
context.pushReplacementNamed(...)
context.pop()
widget.withPadding(horizontal: 16, vertical: 20)
widget.center // Align center
widget.toStart // Align start (RTL aware)
```

## Styling System

### Colors
Use `AppColors` constants from `core/theme/app_colors.dart`:
- Primary: `AppColors.primaryColor` (#025046 - Dark teal)
- Light Primary: `AppColors.lightPrimaryColor` (#0EBE7E)
- Accent: `AppColors.tertiaryColor`

### Typography
Use `AppTextStyles` from `core/theme/app_text_styles.dart`:
- Font family: `LamaSans` (Arabic font)
- Pattern: `{weight}{size}` (e.g., `AppTextStyles.bold24`, `med16`, `reg14`)
- Available: `reg`, `med`, `semiBold`, `bold`, `extraBold`

**Usage**:
```dart
Text('مرحباً', style: AppTextStyles.med18.copyWith(color: AppColors.primaryColor))
```

## Network Layer

### API Service (Retrofit + Dio)
- Interface: `core/network/api_service.dart`
- Generated implementation: `api_service.g.dart`
- Interceptors: `AuthInterceptor`, `LanguageInterceptor`
- Base URL from `Env.apiUrl` (environment variables)

**Adding endpoints**:
```dart
@GET(ApiConstants.myEndpoint)
Future<ResponseModel> getData(@Query('id') String id);
```
Then run: `flutter pub run build_runner build --delete-conflicting-outputs`

### Error Handling
- Repository layer wraps with `Either<Failure, Success>` (dartz package)
- Catch `ServerException` from data source
- Return `Left(Failure)` or `Right(Data)`

## Common Widgets

### Forms
- `AppTextFormField`: Standard text input with validation
- `PasswordFormField`: Password input with show/hide toggle
- `AppTextButton`: Primary action button
- `CustomAppBar`: Consistent app bar with back navigation

### Layouts
- `CustomScrollView` + Slivers: All scrollable screens
- `Expanded` only in Row/Column, never in scrollables
- `Flexible`: For wrapping content in rows to prevent overflow

## Development Workflows

### Code Generation
Run after changes to models, API, or localization:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub run easy_localization:generate -S assets/lang -f keys -o locale_keys.g.dart
```

### Adding New Features
1. Create feature folder: `lib/features/{feature_name}/`
2. Add subfolders: `data/`, `presentation/`
3. Create `{feature}_di.dart` for dependency injection
4. Register in `core/di/dependency_injection.dart`
5. Add routes to `core/routing/routes.dart` and `app_router.dart`

### Model Creation
All models use `json_serializable`:
```dart
@JsonSerializable(checked: true)
class MyModel {
  @JsonKey(name: 'api_field_name')
  final String myField;
  
  factory MyModel.fromJson(Map<String, dynamic> json) => _$MyModelFromJson(json);
  
  // Add dummy data factory for testing:
  factory MyModel.dummy() => MyModel(myField: 'test');
}
```

## Important Constraints

1. **Never nest scrollable widgets** without proper constraints
2. **Always use Arabic text** in dummy data and examples
3. **Always generate keys for localization** - no empty keys in `ar.json`
4. **Use GetIt** for dependency injection, never manual instantiation
5. **RTL-first design** - test with Arabic text and RTL layout
6. **Cubit over Bloc** - prefer Cubit unless complex event handling needed
7. **Part files** - features use `part of` pattern, not separate imports

## Key Files Reference
- Entry point: `lib/main.dart`
- DI setup: `lib/core/di/dependency_injection.dart`
- Routes: `lib/core/routing/routes.dart`, `app_router.dart`
- Localization: `assets/lang/ar.json`, `lib/generated/locale_keys.g.dart`
- Theme: `lib/core/theme/app_colors.dart`, `app_text_styles.dart`
- API: `lib/core/network/api_service.dart`
- Extensions: `lib/core/helpers/extensions.dart`
