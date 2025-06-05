# 🛒 Minimart

Minimart is a Flutter project for managing a minimal gadgets shopping experience and its an open-source UI.

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

### Folder Structure
assets/
│   ├── fonts/
│   └── images/
│   └── svg/
lib/
├── app/
│   ├── features/
│           ├── dashboard
│                      ├── features/
│                               ├── cart/
│                                       ├── view_models/
│                                       ├── views/
│                                       ├── widgets/
│                               ├── favorites/
│                                       ├── views/
│                               ├── home/
│                                       ├── features/
│                                                  ├── product_detail/
│                                                           ├── views/
│                                                           ├── widgets/
│                                       ├── view_models/
│                                       ├── views/
│                                       ├── widgets/
│                               ├── profile/
│                                       ├── views/
│                      ├── views/
│                      ├── widgets/
│   ├── view/
│   └── profile/
├── core/
│   ├── config/
│           ├── env     
│   ├── models/
│           ├── cart/
│           ├── common/
│           ├── products/
│           ├── app_result.dart
│   ├── providers
│           ├── app/
│           ├── products/
│           ├── repositories/
│                       ├── cart/
│                       ├── product/
│           ├── toast/
│   ├── repositories
│           ├── cart/
│           ├── product/
│   ├── routes
│   ├── utils
│           ├── extensions/
│           ├── formatter/
│           ├── helpers/
│           ├── theme/
│   ├── widgets
│           ├── common/
│           ├── customs/
│           ├── shimmers/

### What was used

- State management - Riverpod
- Navigation - GoRouter (Typed safe routes)
- Responsiveness - Flutter screenutil
- Styling - IBM Plex Sans & SF Pro Text
- Icons - SVG


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

