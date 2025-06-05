import 'package:dartz/dartz.dart';
import 'package:minimart/core/models/app_result.dart';
import 'package:minimart/core/models/common/exceptions/app_error.dart';
import 'package:minimart/core/models/products/product.dart';
import 'package:minimart/core/utils/constants.dart';

class ProductRepository {
  const ProductRepository();

  Future<Either<Failure<AppError>, Success<List<Product>>>>
      fetchProducts() async {
    try {
      await Future.delayed(const Duration(seconds: 2), () {});
      return Right(
        Success(Constants.products),
      );
    } catch (e) {
      return Left(Failure(AppError.parse('An error occurred', '')));
    }
  }
}
