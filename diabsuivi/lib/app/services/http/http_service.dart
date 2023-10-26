import 'dart:async';
import 'dart:developer';

import 'package:diabsuivi/app/services/http/http_exeptions.dart';
import 'package:diabsuivi/app/shared/prefereces/app_prefs.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';


enum HttpMethod { get, post, put, delete, patch }

class Api {
  static const apiVersion = '/api/v1';
  static const host = "http://192.168.193.74:8000";
  static const baseUrlVersion = host + apiVersion;
  static const getDossier = '/Commande/get_infos_dossier';
  static const postDossier = '/Commande/store_mvt';
  
  // http://192.168.0.169:8000/api/v1/Commande/get_infos_dossier/fIh6PQlI0v9XG8ybqJjWNd3XvcuND7
}
class HttpService {
  static Dio? _dio;

  //static const int TIME_OUT_DURATION = 30;

  static Dio get client {
    if (_dio == null) {
      _dio = Dio(BaseOptions(baseUrl: Api.baseUrlVersion));
      _dio!.interceptors.add(
        DioCacheManager(
          CacheConfig(
            baseUrl: Api.host,
          ),
        ).interceptor,
      );
    }

    return _dio!;
  }

  static Future request(HttpMethod method, String path,
      {dynamic payload,
      String? baseUrl,
      Map<String, dynamic>? headers,
      bool requestToken = false}) async {
    // http request
    try {
      if (baseUrl != null) {
        client.options.baseUrl = baseUrl;
      }

      final response = await client
          .request(
            path,
            data: payload,
            options: Options(
                method: method.name.toUpperCase(),
                headers: {
                  'X-Requested-With': 'XMLHttpRequest',
                  'Content-Type': 'application/json',
                  if (requestToken)
                    'Authorization': 'Bearer ${AppPrefs.to.token.val}'
                },
                validateStatus: (status) => true),
          )
          .timeout(
            const Duration(seconds: 30),
          );

      return _onResponse(response);
    } on Exception catch (exception) {
      log(exception.toString());
      _onException(exception, path);
    }
  }

  static _onResponse(Response response) {
    log(response.data.toString());
    switch (response.statusCode) {
      // when request is succes
      case 200:
        return response.data;
      case 401:
        // when the user is not authenticated
        throw UnauthenticatedException(
            path: response.requestOptions.path,
            title: 'Unauthenticated',
            message: 'Vous n\'êtes pas authentifié');
      // when the page is not found
      case 404:
        throw NotFoundErrorException(
            path: response.requestOptions.path,
            title: 'NotFound',
            message: 'Cette requêtte est introuvable');

      case 422:
        String errorMessage = '';
        if (response.data != null) {
          if (response.data['errors'] != null) {
            response.data['errors'].values.toList().forEach((el) =>
                errorMessage +=
                    "${el.toString().replaceAll("[", "").replaceAll("]", "")}\n");
          }
          // if (response.data['message'] != null) {
          //   errorMessage = response.data['message'];
          // }
        }
        throw ValidationErrorException(
          title: 'Erreur de validation',
          message: errorMessage,
        );

      // when the server is not responding
      case 500:
        throw ServerErrorException(
            path: response.requestOptions.path,
            title: 'Erreur de Serveur',
            message: 'Veuillez contacter le service technique');
      default:
    }
  }

  static _onException(Exception exception, String path) {
    if (exception is TimeoutException) {
      throw ApiNotRespondingException(
        path: path,
        title: 'Timeout error',
        message: 'le serveur ne repond pas\nveuillez reessayer plus tard',
      );
    }
    if (exception is DioError) {
      if (exception.type == DioErrorType.other) {
        throw ConnectivityException(
          path: path,
          title: 'Connexion impossible',
          message: 'Erreur survenue ${exception.message}',
        );
      }
    } else {
      throw exception;
    }
  }
}

// import 'dart:async';
// import 'dart:developer';
// import 'package:diabsuivi/app/services/http/http_exeptions.dart';
// import 'package:dio/dio.dart';
// import 'package:dio_http_cache/dio_http_cache.dart';
// import 'package:get/get.dart';
// import 'package:dio/src/response.dart';

// enum HttpMethod { get, post, put, delete, patch }

// class Api {
//   static const apiVersion = '/api/v1';
//   static const host = "http://192.168.0.169:8000";

//   static const baseUrlVersion = host + apiVersion;

//   static const getDossier = '/Commande/get_infos_dossier';
//   // http://192.168.0.169:8000/api/v1/Commande/get_infos_dossier/fIh6PQlI0v9XG8ybqJjWNd3XvcuND7


  

// }

// class HttpService {
//   static Dio? _dio;

//   static const int TIME_OUT_DURATION = 30;

//   static Dio get client {
//     if (_dio == null) {
//       _dio = Dio(BaseOptions(baseUrl: Api.baseUrlVersion));
//       _dio!.interceptors.add(
//         DioCacheManager(
//           CacheConfig(
//             baseUrl: Api.host,
//           ),
//         ).interceptor,
//       );
//     }

//     return _dio!;
//   }

//   static Future request(HttpMethod method, String path,
//       {dynamic payload,
//       String? baseUrl,
//       Map<String, dynamic>? headers,
//       Map<String, dynamic>? queryParameters,
//       bool forceRefresh = true,
//       Function(int?, int?)? onSendProgress,
//       bool requestToken = false}) async {
//     // http request
//     try {
//       if (baseUrl != null) {
//         client.options.baseUrl = baseUrl;
//       }

//       headers ??= {
//         'X-Requested-With': 'XMLHttpRequest',
//         'Content-Type': 'application/json',
//         if (requestToken) 'Authorization': 'Bearer ',
//         "Access-Control-Allow-Origin": "*"
//       };

//       final response = await client
//           .request(
//             path,
//             data: payload,
//             queryParameters: queryParameters,
//             options: buildCacheOptions(
//               method == HttpMethod.get ? 7.days : 400.milliseconds,
//               forceRefresh: forceRefresh,
//               options: Options(
//                 method: method.name.toUpperCase(),
//                 headers: headers,
//                 followRedirects: false,
//                 validateStatus: (statusCode) {
//                   return true;
//                 },
//               ),
//             ),
//             onSendProgress: onSendProgress,
//           )
//           .timeout(
//             TIME_OUT_DURATION.seconds,
//             // const Duration(seconds: 30),
//           );

//       return _onResponse(response);
//     } on Exception catch (exception) {
//       log(exception.toString());
//       _onException(exception, path);
//     }
//   }

//   static _onResponse(Response response) async {
//     log(response.data.toString());
//     log(response.statusCode.toString());
//     switch (response.statusCode) {
//       // when request is succes400 Bad Request
//       case 200:
//         return response.data;
//       case 400:
//         throw UnauthenticatedException(
//             path: response.requestOptions.path,
//             title: 'Bad Request',
//             message: 'Une erreur  de syntaxe');
//       case 401:
//         // when the user is not authenticated
//         throw UnauthenticatedException(
//             path: response.requestOptions.path,
//             title: 'Unauthenticated',
//             message: 'Vous n\'êtes pas authentifié');
//       // when the page is not found
//       case 404:
//         throw NotFoundErrorException(
//             path: response.requestOptions.path,
//             title: 'NotFound',
//             message: 'Cette requêtte est introuvable');
//       //
//       case 502:
//         throw NotFoundErrorException(
//             path: response.requestOptions.path,
//             title: 'Bad Gateway',
//             message: 'Url est introuvable');

//       case 422:
//         String errorMessage = '';
//         if (response.data != null) {
//           if (response.data['errors'] != null) {
//             response.data['errors'].values.toList().forEach((el) =>
//                 errorMessage +=
//                     "${el.toString().replaceAll("[", "").replaceAll("]", "")}\n");
//           }
//           if (response.data['message'] != null) {
//             errorMessage = response.data['message'];
//           }
//           if (response.data['error_message'] != null) {
//             errorMessage = response.data['error_message'];
//           }
//         }
//         throw ValidationErrorException(
//           title: 'Erreur de validation',
//           message: errorMessage,
//         );

//       // when the server is not responding
//       case 500:
//         throw ServerErrorException(
//             path: response.requestOptions.path,
//             title: 'Erreur de Serveur',
//             message: 'Veuillez contacter le service technique');
//       default:
//     }
//   }

//   static _onException(Exception exception, String path) {
//     if (exception is TimeoutException) {
//       throw ApiNotRespondingException(
//         path: path,
//         title: 'Timeout error',
//         message: 'le serveur ne repond pas\nveuillez reessayer plus tard',
//       );
//     }
//     if (exception is DioError) {
//       if (exception.type == DioErrorType.other) {
//         throw ConnectivityException(
//           path: path,
//           title: 'Connexion impossible',
//           message: 'Erreur survenue',
//         );
//       }
//     } else {
//       throw exception;
//     }
//   }
// }
