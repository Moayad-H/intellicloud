import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:intellicloud/errors/exceptions.dart';
import 'package:intellicloud/network/dio_helper.dart';

abstract class Repository {
  final DioHelper dioHelper = DioHelper();

  Future<Either<Failure, ReturnType>> exceptionHandler<ReturnType>(
      Future<ReturnType> Function() function) async {
    try {
      return Right(await function());
    } catch (e, s) {
      log(s.toString());
      log(e.runtimeType.toString());
      if (e is ServerException) {
        return left(
            ServerFailure(e.toString(), data: e.data, errorCode: e.errorCode));
      }

      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }

      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}

abstract class Failure {
  final String message;
  final Map<String, dynamic>? data;
  final String? errorCode;

  Failure(this.message, {this.data, this.errorCode});
}

class ServerFailure extends Failure {
  ServerFailure(super.message, {super.data, super.errorCode});

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure('Request to ApiServer was canceld');
      case DioErrorType.unknown:
        log("dioError message " + dioError.message.toString());
        if (dioError.message?.contains('SocketException') ?? false) {
          return ServerFailure('No Internet Connection');
        }
        if (dioError.error.runtimeType.toString() == "ServerException") {
          ServerException error = dioError.error as ServerException;
          return ServerFailure(error.exceptionMessage!,
              errorCode: error.errorCode!, data: error.data);
        }
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('No Internet Connection, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    log(response.toString());
    if (statusCode == 400 || statusCode == 403) {
      return ServerFailure('errorMessage');
    } else if (statusCode == 401) {
      return ServerFailure('errorMessage');
    } else if (statusCode == 404) {
      return ServerFailure('Item not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else if (statusCode == 502) {
      return ServerFailure('Server error, Please try later');
    } else {
      // return ServerFailure(response['message']);
      return ServerFailure(
          response['message'] ?? 'Opps There was an Error, Please try again');
    }
  }
}
