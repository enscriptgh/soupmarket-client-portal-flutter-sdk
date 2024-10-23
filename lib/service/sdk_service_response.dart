class SDKServiceResponse<T> {
  final T? data;
  final ServiceError? error;
  final bool isSuccess;

  SDKServiceResponse._({
    this.data,
    this.error,
    required this.isSuccess,
  });

  factory SDKServiceResponse.success({required T data}) {
    return SDKServiceResponse._(
      data: data,
      isSuccess: true,
    );
  }

  factory SDKServiceResponse.error({required ServiceError error}) {
    return SDKServiceResponse._(
      error: error,
      isSuccess: false,
    );
  }
}

class ServiceError {
  final String code;
  final String message;
  final dynamic originalError;

  ServiceError({
    required this.code,
    required this.message,
    this.originalError,
  });
}