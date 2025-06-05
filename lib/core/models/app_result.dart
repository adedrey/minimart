import 'package:minimart/core/models/common/exceptions/app_error.dart';

sealed class AppResult<T> {
  const AppResult();
}

class Success<T> extends AppResult<T> {
  const Success(this.data);
  final T data;
}

class Failure<T> extends AppResult<T> {
  const Failure(this.error);
  final AppError error;
}
