import 'package:dartz/dartz.dart';
import 'package:minimart/core/models/app_result.dart';
import 'package:minimart/core/models/common/exceptions/app_error.dart';

class CartRepository {
  const CartRepository();

  Future<Either<Failure<AppError>, Success<bool>>> checkout() async {
    try {
      await Future.delayed(const Duration(seconds: 2), () {});
      return const Right(
        Success(true),
      );
    } catch (e) {
      return Left(Failure(AppError.parse('An error occurred', '')));
    }
  }
}
