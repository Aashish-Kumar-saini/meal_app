# 🍽️ Meals App (Flutter Practice Project)

A modern, responsive Flutter application designed for **beginners** to practice core Flutter concepts, **State Management with Flutter Riverpod**, navigation, and **Implicit Animations / Hero Transitions**.

---

## 📱 Features

- **Category Browser**: Browse meals categorized across cuisines (Italian, Asian, German, French, etc.) with custom gradient cards.
- **Dietary Filter System**: Filter recipes by:
  - Gluten-Free
  - Lactose-Free
  - Vegetarian
  - Vegan
- **Favorites Management**: Save favorite recipes with instantaneous UI updates and snackbar feedback.
- **Detailed Recipe View**: Step-by-step cooking instructions, ingredient checklists, prep duration, complexity, and affordability indicators.
- **Drawer & Tab Navigation**: Seamless navigation using Bottom Navigation Bar and Side Navigation Drawer.

---

## 🧠 State Management (Flutter Riverpod)

This project demonstrates clean, reactive state management using **Riverpod**:

| Provider | Type | Description |
| :--- | :--- | :--- |
| `mealsProvider` | `Provider` | Provides the static catalog of meals (`dummyMeals`). |
| `filterProvider` | `StateNotifierProvider` | Manages the active state of dietary filter toggles. |
| `favoriteMealProvider` | `Provider` | Computed provider that watches both `mealsProvider` and `filterProvider` to automatically return filtered meals. |
| `favoriteMealsProvider` | `StateNotifierProvider` | Manages user's favorite meal list and handles toggle operations (`toggleFavoriteMealStatus`). |

---

## ✨ Animations & UI Highlights

- **Hero Transitions**: Smooth shared element transition for meal images moving from the list view into the detailed recipe page (`Hero` widget tagged by `meal.id`).
- **Implicit & Explicit Animations**:
  - `AnimatedSwitcher` + `RotationTransition`: Rotates and morphs the favorite star icon when toggling favorite state on the recipe detail screen.
  - `FadeInImage`: Smooth fade-in image loading effect with transparent memory placeholder.
- **Material 3 Theming**: Dark mode theme with dynamic color seeds (`ColorScheme.fromSeed`) and typography powered by `GoogleFonts.lato`.

---

## 📂 Project Structure

```text
lib/
├── data/
│   └── dummy_data.dart          # Dummy categories and meal dataset
├── models/
│   ├── category.dart            # Category data model
│   └── meal.dart                # Meal data model & Enums (Complexity, Affordability)
├── providers/
│   ├── favorites_provider.dart  # Favorite meals StateNotifier & Provider
│   ├── fliters_provider.dart    # Dietary filters StateNotifier & filtered meals Provider
│   └── meals_provider.dart      # Base meals catalog Provider
├── screens/
│   ├── categories.dart          # Category grid screen
│   ├── filtersScreen.dart       # Filter toggle screen
│   ├── meal_detail_screen.dart  # Recipe details with ingredients & steps
│   ├── meals.dart               # Meal list view screen
│   └── tabs.dart                # Root screen with BottomNavigationBar & Drawer
├── widgets/
│   ├── category_grid_item.dart  # Category card widget
│   ├── main_drawer.dart         # Navigation drawer widget
│   ├── meal_item.dart           # Meal card item with Hero and metadata badges
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
- [`google_fonts`](https://pub.dev/packages/google_fonts): Beautiful Google Fonts (Lato).
- [`transparent_image`](https://pub.dev/packages/transparent_image): Transparent memory images for smooth fade-in transitions.
