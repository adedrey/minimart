# 🛒 Minimart

Minimart is a Flutter project for managing a minimal grocery shopping experience with flavor-based environments.

---

## 🚀 Getting Started

Follow these steps to set up and run the project locally.

### 1. Clone the Repository

```sh
# Copy to your machine
$ git clone git@github.com:adedrey/minimart.git
$ cd minimart

# Install Dependencies
$ flutter pub get

# Generate Code
$ dart run build_runner build

# Run the App 

# Development
$ flutter run --flavor development --debug -t lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

### Screenshots

🏠 Home Screen

![Home Screen Initial State](screenshots/HomeScreen-Loading.png)
![Home Screen Loaded State](screenshots/HomeScreen-Loaded.png)
![Home Screen Pull to Refresh](screenshots/HomeScreen-Loading-Refresh.png)
![Home Screen with Cart Added](screenshots/HomeScreen-CartAdded.png)

🏠 Product Detail Screen

![Product Detail Screen](screenshots/ProductDetail.png)
![Product Detail - Like a product](screenshots/ProductDetail-FavoriteAdded.png)
![Product Detail - Add to cart](screenshots/ProductDetail-CartAdded.png)

🛒 Cart Screen

![Cart - Checkout Screen](screenshots/Cart-CheckoutFromProduct.png)
![Cart Screen/Tab](screenshots/CartScreen.png)