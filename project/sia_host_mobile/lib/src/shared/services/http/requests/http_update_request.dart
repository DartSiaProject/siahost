// import 'package:dio/dio.dart';

// import '../configs/dio_instance.dart';

// class HttpUpdateRequest {
//   static Future<Map<String, dynamic>> put<T>({
//     required String api,
//     required Map<String, dynamic> headers,
//     Object? content,
//     ResponseType responseType = ResponseType.json,
//   }) async {
//     return await dio
//         .put<T>(
//           api,
//           data: content,
//           options: Options(
//             headers: headers,
//             responseType: responseType,
//           ),
//         )
//         .then((response) => {
//               "status": true,
//               "response": response,
//             })
//         .onError<DioException>((error, stackTrace) => {
//               "status": false,
//               "error": error,
//             });
//   }
// }
