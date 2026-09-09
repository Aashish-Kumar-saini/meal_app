# 🍽️ Meals App (Flutter Practice Project)

A modern, responsive Flutter application built to demonstrate core Flutter concepts, **State Management with Flutter Riverpod**, multi-screen navigation, **Implicit/Explicit Animations**, and **Hero Transitions**.

---

## 📱 Features

- **Category Browser**: Browse meals categorized across various cuisines (Italian, Asian, German, French, etc.) with custom gradient cards.
- **Dietary Filter System**: Filter recipes in real-time by dietary preferences:
  - Gluten-Free
  - Lactose-Free
  - Vegetarian
  - Vegan
- **Favorites Management**: Save favorite recipes with instantaneous UI updates, animated star button, and snackbar notifications.
- **Detailed Recipe View**: Step-by-step cooking instructions, ingredient lists, duration, complexity, and affordability indicators.
- **Drawer & Tab Navigation**: Seamless navigation using Bottom Navigation Bar (Categories & Favorites tabs) and a Side Navigation Drawer for filters.
- **Robust Network Image Handling**:
  - Progressive image loading with custom semi-transparent placeholder containers and `CircularProgressIndicator` via `loadingBuilder`.
  - Graceful error fallback UI with `Icons.image_not_supported_outlined` via `errorBuilder` when images fail to load.
  - Android Internet permission (`android.permission.INTERNET`) configured in `AndroidManifest.xml` for seamless network image fetching.

---

## 🧠 State Management (Flutter Riverpod)

This project demonstrates clean, reactive state management using **Riverpod**:

| Provider | Type | Description |
| :--- | :--- | :--- |
| `mealsProvider` | `Provider` | Provides the static catalog of meals (`dummyMeals`). |
| `filterProvider` | `StateNotifierProvider` | Manages the active state of dietary filter toggles. |
| `favoriteMealProvider` | `Provider` | Computed provider that watches `mealsProvider` and `filterProvider` to automatically return filtered meals. |
| `favoriteMealsProvider` | `StateNotifierProvider` | Manages user's favorite meal list and handles toggle operations (`toggleFavoriteMealStatus`). |

---

## ✨ Animations & UI Highlights

- **Hero Transitions**: Smooth shared element transition for meal images moving seamlessly from the meal cards (`MealItems` in `meal_item.dart`) into the recipe detail header (`MealDetailScreen` in `meal_detail_screen.dart`) tagged by `meal.id`.
- **Animated Favorite Button**: `AnimatedSwitcher` paired with `RotationTransition` (0.5 to 1.0 turns) that animates and morphs the star icon when adding or removing a meal from favorites.
- **Progressive Image Loading & Error Handling**:
  - `Image.network` with `loadingBuilder` showing a styled progress indicator while the image buffers.
  - `errorBuilder` displaying an intuitive fallback placeholder when an image fails to load.
- **Material 3 Dark Theme**: Elegant dark mode theme with dynamic color seeds (`ColorScheme.fromSeed`) and typography powered by `GoogleFonts.lato`.

---

## 📂 Project Structure

```text
lib/
├── data/
│   └── dummy_data.dart          # Categories and meal dataset
├── models/
│   ├── category.dart            # Category model
│   └── meal.dart                # Meal model & Enums (Complexity, Affordability)
├── providers/
│   ├── favorites_provider.dart  # Favorite meals StateNotifier & Provider
│   ├── fliters_provider.dart    # Dietary filters StateNotifier & filtered meals Provider
│   └── meals_provider.dart      # Base meals catalog Provider
├── screens/
│   ├── categories.dart          # Category grid screen
│   ├── filtersScreen.dart       # Filter toggle screen
│   ├── meal_detail_screen.dart  # Recipe details with Hero image, ingredients & steps
│   ├── meals.dart               # Meal list view screen
│   └── tabs.dart                # Root screen with BottomNavigationBar & Drawer
├── widgets/
│   ├── category_grid_item.dart  # Category card widget
│   ├── main_drawer.dart         # Navigation drawer widget
│   ├── meal_item.dart           # Meal card item with Hero image & metadata badges
│   └── meal_item_trait.dart     # Trait pill widget (duration, complexity, cost)
└── main.dart                    # App entrypoint & theme configuration wrapped in ProviderScope
```

---

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (v3.13.0 or newer)
- Dart SDK
- Android Studio / VS Code / Antigravity IDE

### Installation & Run

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Aashish-Kumar-saini/meal_app.git
   cd meal_app
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

---

## 📦 Dependencies

- [`flutter_riverpod`](https://pub.dev/packages/flutter_riverpod): Reactive caching and state management.
- [`google_fonts`](https://pub.dev/packages/google_fonts): Typography powered by Google Fonts (Lato).
- [`transparent_image`](https://pub.dev/packages/transparent_image): Transparent memory image utilities.
