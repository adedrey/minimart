/// Comprehensive error hierarchy for application-wide error handling
sealed class AppError implements Exception {
  const AppError(this.message, {this.stackTrace, this.statusCode, this.data});

  // Factory constructors
  factory AppError.network(
    String message, {
    int? statusCode,
    StackTrace? stackTrace,
  }) = NetworkError;

  factory AppError.typeError(
    String message, {
    int? statusCode,
    StackTrace? stackTrace,
  }) = TypeMismatchError;

  factory AppError.validation(
    String message, {
    Map<String, List<String>> errors,
  }) = ValidationError;

  factory AppError.authentication(
    String message,
    AuthErrorType type,
    int? statusCode, {
    String? data,
  }) = AuthenticationError;

  factory AppError.parse(
    String message,
    dynamic originalException,
  ) = ParseError;

  factory AppError.unexpected(
    String message, {
    StackTrace? stackTrace,
    dynamic originalException,
  }) = UnexpectedError;

  factory AppError.canceled(
    String message, {
    int? statusCode,
    StackTrace? stackTrace,
  }) = CanceledRequestError;

  final String message;
  final StackTrace? stackTrace;
  final int? statusCode;
  final String? data;
}

/// Network-specific errors
class NetworkError extends AppError {
  const NetworkError(
    super.message, {
    super.statusCode,
    super.stackTrace,
  });
}

/// canceled network request error
class CanceledRequestError extends AppError {
  const CanceledRequestError(
    super.message, {
    super.statusCode,
    super.stackTrace,
  });
}

/// Type mismatch errors (renamed from TypeError to avoid collision)
class TypeMismatchError extends AppError {
  const TypeMismatchError(
    super.message, {
    super.statusCode,
    super.stackTrace,
  });
}

/// Validation errors with enhanced Laravel support
class ValidationError extends AppError {
  const ValidationError(
    super.message, {
    this.errors = const {},
  });

  /// Creates a ValidationError from a Laravel validation response
  ///
  /// Example Laravel response:
  /// ```json
  /// {
  ///   "message": "The given data was invalid.",
  ///   "errors": {
  ///     "email": ["The email field is required."],
  ///     "password": ["The password must be at least 8 characters."]
  ///   }
  /// }
  /// ```
  factory ValidationError.fromLaravelResponse(
    Map<String, dynamic>? responseData,
  ) {
    if (responseData == null) {
      return const ValidationError(
        'Validation failed',
      );
    }

    final message = responseData['message'] is String?
        ? (responseData['message'] as String? ?? 'Validation failed')
        : 'Validation failed';
    final errors = _parseValidationErrors(
      responseData['errors'] ?? responseData['message'],
    );

    return ValidationError(message, errors: errors);
  }

  /// Validation errors mapped by field name
  final Map<String, List<String>> errors;

  /// Checks if a specific field has validation errors
  bool hasErrorForField(String field) => errors.containsKey(field);

  /// Gets all errors for a specific field
  List<String> getErrorsForField(String field) => errors[field] ?? const [];

  /// Gets the first error message for a field, if any
  String? getFirstErrorForField(String field) =>
      (errors[field]?.isNotEmpty ?? false) ? errors[field]!.first : null;

  /// Combines all error messages into a single string
  String getAllErrorMessages({String separator = '\n'}) =>
      errors.values.expand((errors) => errors).join(separator);

  /// Gets all field names that have errors
  Set<String> get errorFields => errors.keys.toSet();

  /// Total number of error messages across all fields
  int get totalErrorCount =>
      errors.values.fold(0, (sum, messages) => sum + messages.length);

  /// Converts the error to a map suitable for JSON serialization
  Map<String, dynamic> toJson() => {
        'message': message,
        'errors': errors,
      };

  @override
  String toString() {
    final buffer = StringBuffer('ValidationError: $message');
    if (errors.isNotEmpty) {
      buffer.writeln('\nValidation Errors:');
      errors.forEach((field, messages) {
        buffer.writeln('  $field:');
        for (final message in messages) {
          buffer.writeln('    - $message');
        }
      });
    }
    return buffer.toString();
  }

  /// Helper method to parse nested validation errors from Laravel
  static Map<String, List<String>> _parseValidationErrors(dynamic errorsData) {
    if (errorsData == null) return {};
    if (errorsData is! Map<String, dynamic>) return {};

    final result = <String, List<String>>{};

    void processErrors(String prefix, dynamic value) {
      if (value is List) {
        // Handle array of error messages
        result[prefix] = value.map((e) => e.toString()).toList();
      } else if (value is Map<String, dynamic>) {
        // Handle nested error objects
        value.forEach((key, nestedValue) {
          final newPrefix = prefix.isEmpty ? key : '$prefix.$key';
          processErrors(newPrefix, nestedValue);
        });
      }
    }

    errorsData.forEach(processErrors);

    return result;
  }
}

/// Authentication-specific errors
class AuthenticationError extends AppError {
  const AuthenticationError(
    super.message,
    this.type,
    int? statusCode, {
    super.data,
  }) : super(statusCode: statusCode);

  final AuthErrorType type;

  /// Whether this error indicates the user needs to re-authenticate
  bool get requiresReauthentication => type == AuthErrorType.tokenExpired;
}

/// Parsing/serialization errors
class ParseError extends AppError {
  const ParseError(super.message, this.originalException);

  final dynamic originalException;

  @override
  String toString() =>
      'ParseError: $message\nOriginal Exception: $originalException';
}

/// Unexpected/Generic errors
class UnexpectedError extends AppError {
  const UnexpectedError(
    super.message, {
    super.stackTrace,
    this.originalException,
  });
  final dynamic originalException;
  @override
  String toString() =>
      'UnexpectedError: $message\nOriginal Exception: $originalException';
}

/// Specific authentication error types
enum AuthErrorType {
  tokenExpired,
  invalidCredentials,
  accountLocked,
  unauthorized
}
