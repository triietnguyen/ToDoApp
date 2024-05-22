// ignore_for_file: deprecated_member_use
import 'package:dio/dio.dart';
import 'package:todoapp/data/network/api/dio_client.dart';

class AppInterceptors extends Interceptor {
  final Dio dio;
  final Options? customOptions;
  final bool hasToken;

  AppInterceptors(
    this.dio, {
    this.customOptions,
    this.hasToken = false,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Remove param url null or ''
    options.queryParameters
        .removeWhere((key, value) => value == null || value == '');

    // Options? options;
    // if (hasToken && userToken != null) {
    options.headers = <String, dynamic>{
      "Content-Type": "application/json",
      "X-RapidAPI-Key": "dd74554666msh8910cdc1a0ac112p18ed99jsna8fdbcb4a643",
      "X-RapidAPI-Host": "movies-api14.p.rapidapi.com",
      // "Authorization": "Bearer $userToken",
    };
    // }

    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioErrorType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions, err.response!);
          case 401:
            final Api apiDio = Api();
            if (apiDio.isLogged) {
              apiDio.setHeaderToken();
              // StorageHelper().removeStorage();
              // getx.Get.offAllNamed(Routes.SIGN_IN);
            }
            throw UnauthorizedException(err.requestOptions, err.response!);
          case 404:
            throw NotFoundException(err.requestOptions, err.response!);
          case 409:
            throw ConflictException(err.requestOptions, err.response!);
          case 500:
            throw InternalServerErrorException(
              err.requestOptions,
              err.response!,
            );
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.unknown:
      case DioErrorType.connectionError:
        throw NoInternetConnectionException(err.requestOptions);
      case DioErrorType.badCertificate:
        break;
    }

    return handler.next(err);
  }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r, Response res)
      : super(
          requestOptions: r,
          response: res,
        );

  @override
  String toString() {
    return "ErrorType.badRequestException";
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r, Response res)
      : super(
          requestOptions: r,
          response: res,
        );

  @override
  String toString() {
    return "ErrorType.internalServerErrorException";
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r, Response res)
      : super(
          requestOptions: r,
          response: res,
        );

  @override
  String toString() {
    return "ErrorType.conflictException";
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r, Response res)
      : super(
          requestOptions: r,
          response: res,
        );

  @override
  String toString() {
    return "ErrorType.unauthorizedException";
  }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r, Response res)
      : super(
          requestOptions: r,
          response: res,
        );

  @override
  String toString() {
    return "ErrorType.notFoundException";
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return "ErrorType.noInternetConnectionException";
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return "ErrorType.deadlineExceededException";
  }
}
