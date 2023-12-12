import 'dart:io';
import 'package:dio/dio.dart';
import 'package:let_him_cook/model/network/my_response_model.dart';
import 'package:let_him_cook/utils/constants.dart';
import 'package:let_him_cook/utils/enum/app_enums.dart';
import 'package:let_him_cook/utils/shared_preference_manager.dart';
import 'package:let_him_cook/utils/util.dart';

class BaseServices {
  static BaseServices? _instance;
  static String? hostUrl;
  static String? transactionRedirectEndPoint;
  static EnvironmentType? environmentType;
  String apiUrl() => hostUrl ?? '';

  BaseServices() {
    if (_instance == null) {
      _init();
    }
  }

  /// Generate the token strings with Bearer Authentication format
  String get authToken {
    return SharedPreferenceManager.getAccessToken().isNotEmpty
        ? 'Bearer ${SharedPreferenceManager.getAccessToken()}'
        : '';
  }

  /// Generate the token strings with Bearer Authentication format
  String get refreshToken {
    return SharedPreferenceManager.getRefreshToken().isNotEmpty
        ? 'Bearer ${SharedPreferenceManager.getRefreshToken()}'
        : '';
  }

  // private access dio instance and accessible using dio() getter
  Dio? _dio;

  // eg: single dio instance will created and reuse by all services.
  // remove the needs to create new Dio() instance in every services
  Dio? get dio {
    if (_instance == null || _instance?._dio == null) {
      _instance?._init();
    }
    return _instance?._dio;
  }

  Future _init() async {
    _instance = this;

    _dio = Dio(BaseOptions(headers: <String, String>{
      'Content-Type': ContentType.json.value,
      if (authToken.isNotEmpty) 'Authorization': authToken
    }));

    _dio?.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (options, handler) {
          if (options.headers.containsKey('Authorization') &&
              authToken.isNotEmpty) {
            options.headers['Authorization'] = authToken;
          }

          return handler.next(options);
        },
        onError: (error, handler) async {
          // Access token expired returns 401/403 error codes
          if (error.response?.statusCode == HttpStatus.forbidden ||
              error.response?.statusCode == HttpStatus.unauthorized) {
            try {
              final options = error.response!.requestOptions;
              final dynamic responseRefreshToken =
                  await _fetchRefreshTokenAPI();

              if (responseRefreshToken is bool) {
                options.headers['Authorization'] = authToken;
              }

              await Dio().fetch<dynamic>(options).then(
                (r) {
                  return handler.resolve(r);
                },
                onError: (e) => {handler.reject(e)},
              );
            } catch (error) {
              if (error is DioException) {
                return handler.reject(error);
              }
            }
          }
        },
      ),
    );
  }

  Future<MyResponseModel> callAPI(HttpRequestType requestType, String path,
      {Map<String, dynamic>? queryParams,
      dynamic postBody,
      Options? options}) async {
    if (options != null) {
      dio?.options.headers = options.headers;
    } else {
      //Reset back the header to have the authorization token
      String token = authToken;
      dio?.options.headers = <String, String>{'Authorization': '$token'};
    }

    try {
      dio?.options.contentType = Headers.jsonContentType;
      var response;

      switch (requestType) {
        case HttpRequestType.GET:
          {
            response = await dio?.get(path, queryParameters: queryParams);
          }
          break;
        case HttpRequestType.POST:
          {
            response = await dio?.post(path,
                data: postBody, queryParameters: queryParams);
          }
          break;
        case HttpRequestType.PUT:
          response = await dio?.put(path,
              data: postBody, queryParameters: queryParams);
          break;
        case HttpRequestType.DELETE:
          response = await dio?.delete(path,
              data: postBody, queryParameters: queryParams);
          break;
      }

      if (response?.statusCode == HttpStatus.ok ||
          response?.statusCode == HttpStatus.created) {
        return MyResponseModel.complete(JsonParsing(response.data).toJson());
      }
    } catch (e) {
      if (e is DioException &&
          e.response?.data != null &&
          e.response?.data != '') {
        return MyResponseModel.error(JsonParsing(e.response?.data).toJson());
      }
      return MyResponseModel.error(e);
    }
    return MyResponseModel.error(
        DioException(requestOptions: RequestOptions(path: path)));
  }

  /*-----------API Call Functions-----------*/
  Future<dynamic> _fetchRefreshTokenAPI() async {
    try {
      String apiPath = '${apiUrl()}/TODO: InsertRefreshTokenAPIHere';
      final response = await callAPI(
        HttpRequestType.GET,
        apiPath,
        options:
            Options(headers: <String, String>{'Authorization': refreshToken}),
      );

      if (response.status == HttpStatus.ok) {
        // TODO: Handle Refresh Token here based on the API
        //var tokenResult = jsonDecode(response.data.toString())['result'];
        // final tokenModel = <InsertRefreshTokenModel>.fromJson(jsonEncode(tokenResult));
        // SharedPreferenceManager.putAccessToken(tokenModel.accessToken);
        // SharedPreferenceManager.putRefreshToken(tokenModel.refreshToken);
      }

      return response.status == HttpStatus.ok;
    } catch (error) {
      // TODO: Properly handle error

      return error;
    }
  }
}
