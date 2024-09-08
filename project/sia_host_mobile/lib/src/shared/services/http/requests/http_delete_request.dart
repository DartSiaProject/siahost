// import 'package:dio/dio.dart';

// import '../configs/dio_instance.dart';

// class HttpDeleteRequest {
//   static Future<Map<String, dynamic>> delete<T>({
//     required String api,
//     required Map<String, dynamic> headers,
//     ResponseType responseType = ResponseType.json,
//   }) async {
//     return await dio
//         .delete<T>(
//           api,
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
