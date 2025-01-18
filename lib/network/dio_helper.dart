import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:intellicloud/network/api_endpoints.dart';
import 'package:intellicloud/routes/app_routes.dart';

class DioHelper {
  static late Dio dio;

  static String api = APIEndpoints.baseURL;

  static void initialize() {
    dio = Dio(
      BaseOptions(
        followRedirects: true,
        headers: <String, dynamic>{
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        receiveDataWhenStatusError: true,
        validateStatus: (int? state) => state! < 500,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        contentType: 'application/json',
      ),
    );

    dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) =>
                onRequestHandler(options, handler),
        onError: (DioException error, ErrorInterceptorHandler handler) {
          if (error.response?.statusCode == 401 ||
              error.response?.statusCode == 403) {
            if (AppRoutes.shellNavigatorKey != null) {
              GoRouter.of(AppRoutes.shellNavigatorKey.currentContext!)
                  .go(AppRoutes.startScreen);
            } else {
              log('Navigation context is null. Cannot navigate .');
            }
            return;
          }
          handler.next(error);
        },
      ),
      LogInterceptor(
        responseBody: true,
        error: true,
        requestBody: true,
        requestHeader: true,
      ),
    ]);
  }

  static void onRequestHandler(
      RequestOptions req, RequestInterceptorHandler handler) async {
    log("from onRequestHandler");
    req.headers['Content-Type'] = 'application/json';
    handler.next(req);
  }

  Future<dynamic> postDataWithoutToken(String parameter, dynamic data) async {
    final response = await dio.post<dynamic>('$api/$parameter',
        data: data,
        options: Options(
          contentType: "application/json-patch+json",
          validateStatus: (state) => state! < 500,
        ));
    return handleResponse(response);
  }

  Future<dynamic> postData(String parameter, dynamic data,
      {Options? options, bool? isVersion1}) async {
    final response = await dio.post<dynamic>(
        "${(isVersion1 != null && !isVersion1) ? api.replaceAll("v1/", "") : api}$parameter",
        data: data,
        options: options ??
            Options(
              contentType: 'application/json',
              method: 'POST',
              validateStatus: (state) => state! < 500,
            ));
    return handleResponse(response);
  }

  Future<dynamic> postDataWithOtherBaseUrl(String parameter,
      {dynamic data, Options? options}) async {
    final response = await dio.post<dynamic>('$parameter',
        data: data,
        options: options ??
            Options(
              contentType: 'application/json',
              method: 'POST',
              validateStatus: (state) => state! < 500,
            ));
    return handleResponse(response);
  }

  Future<dynamic> patchData(String parameter, dynamic data,
      {Options? options}) async {
    final response = await dio.patch<dynamic>('$api$parameter',
        data: data,
        options: options ??
            Options(
              contentType: 'application/json',
              method: 'PATCH',
              validateStatus: (state) => state! < 500,
            ));
    return handleResponse(response);
  }

  Future<dynamic> refreshTokenApi(
    String parameter,
    dynamic data,
  ) async {
    log('$api$parameter');
    final response = await Dio().post<dynamic>('$api$parameter',
        options: Options(
          contentType: 'application/json',
          method: 'POST',
          headers: data,
          validateStatus: (state) => state! < 500,
        ));
    return handleResponse(response);
  }

  Future<dynamic> postWithParameters(
    String path,
    String parameter,
  ) async {
    log('$api/$path?$parameter');
    final response = await dio.post<dynamic>('$api/$path?$parameter',
        options: Options(
          contentType: 'application/json',
          method: 'POST',
          validateStatus: (state) => state! < 500,
        ));
    return handleResponse(response);
  }

  Future<dynamic> putData(String parameter, Map<String, dynamic> data,
      {bool? isVersion1}) async {
    log('$api$parameter');
    log(data.toString());
    final response = await dio.put<dynamic>(
        "${(isVersion1 != null && !isVersion1) ? api.replaceAll("v1/", "") : api}$parameter",
        data: json.encoder.convert(data),
        options: Options(
          contentType: 'application/json',
          method: 'PUT',
          validateStatus: (state) => state! < 500,
        ));
    return handleResponse(response);
  }

  Future<dynamic> delData(String parameter,
      {Map<String, dynamic>? data}) async {
    final response = await dio.delete<dynamic>('$api$parameter',
        data: data,
        options: Options(
          contentType: 'application/json',
          method: 'DEL',
          validateStatus: (state) => state! < 500,
        ));
    return handleResponse(response);
  }

  Future<dynamic> getData(
      {required String url,
      String? token,
      bool? isVersion1,
      Map<String, dynamic>? query}) async {
    final response = await dio.get<dynamic>(
      url,
      queryParameters: query != null ? query : null,
    );
    return handleResponse(response);
  }

  Future<dynamic> getDataWithoutBaseurl({
    required String url,
    String? token,
    bool? isVersion1,
  }) async {
    final response = await dio.get<dynamic>(
      "$url",
      options: Options(
        headers: <String, dynamic>{
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return handleResponse(response);
  }

  Future<dynamic> getDataWithQuery(
      {required String parameter,
      required Map<String, dynamic> query,
      String? token}) async {
    log('$api/$parameter');
    log(query.toString());
    final response = await dio.get<dynamic>(
      '$api$parameter',
      queryParameters: query,
      options: Options(
        headers: <String, dynamic>{
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return handleResponse(response);
  }

  Future<dynamic> uploadFiles({
    required String url,
    required List<File> files,
    required String keyImage,
    required String? key2,
    required dynamic val2,
    required String? key3,
    required dynamic val3,
    String? key4,
    List<dynamic>? val4,
    String? key5,
    dynamic val5,
    String? token,
  }) async {
    dio.options.headers = <String, dynamic>{
      'Content-Type': 'multipart/form-data',
      'Accept': '*/*',
      'language': 'en',
      'Authorization': 'Bearer $token',
    };
    log(url);

    List<MultipartFile> uploadList = <MultipartFile>[];
    for (File file in files) {
      MultipartFile multipartFile = await MultipartFile.fromFile(file.path);
      uploadList.add(multipartFile);
    }

    FormData formData = FormData.fromMap(<String, dynamic>{
      keyImage: uploadList,
      if (key2 != null) key2: val2,
      if (key3 != null) key3: val3,
      if (key4 != null) key4: val4,
      if (key5 != null) key5: val5,
    });

    final response = await dio.post<dynamic>(
      "$api$url",
      data: formData,
      options: Options(
        followRedirects: false,
        validateStatus: (int? state) => state! < 500,
      ),
    );

    return handleResponse(response);
  }

  dynamic handleResponse(Response response) {
    if (response.statusCode.toString()[0] != "2") {
      if (response.statusCode == 401 || response.statusCode == 403) {
        navigateToPhoneVerificationScreenSafely();
        return;
      }
      throw DioException(
        response: response,
        requestOptions: response.requestOptions,
        type: DioExceptionType.badResponse,
      );
    }
    return response.data;
  }

  void navigateToPhoneVerificationScreenSafely() {
    final context = AppRoutes.shellNavigatorKey.currentContext;

    if (context != null && GoRouter.of(context).canPop()) {
      GoRouter.of(context).pushReplacement(AppRoutes.startScreen);
    } else {
      log('Navigation context is null or cannot navigate. Cannot navigate .');
    }
  }
}
