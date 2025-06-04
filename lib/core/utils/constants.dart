import 'package:minimart/core/models/products/product.dart';
import 'package:minimart/core/utils/assets.dart';

class Constants {
  static String kAppIconImageNetwork = '';

  static List<Product> products = [
    Product(
      id: 1,
      title: 'Apple iPhone 16 128GB|Teal',
      amount: 700,
      image: Assets.images.iphone16PNG,
      about: about,
      total: 5,
    ),
    Product(
      id: 1,
      title: 'M4 Macbook Air 13” 256GB|Sky blue',
      amount: 1000,
      image: Assets.images.macbookJPG,
      about: about,
      total: 5,
    ),
    Product(
      id: 1,
      title: 'Google Pixel 9A 128GB|Iris',
      amount: 499,
      image: Assets.images.pixelPNG,
      about: about,
      total: 5,
    ),
    Product(
      id: 1,
      title: 'Apple Airpods 4 Active Noise Cancellation|Teal',
      amount: 129,
      image: Assets.images.earphoneJPG,
      about: about,
      total: 5,
    ),
  ];

  static List<String> about = [
    'This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.',
    'There will be no visible cosmetic imperfections when held at an arm’s length. There will be no visible cosmetic imperfections when held at an arm’s length.'
  ];
}
