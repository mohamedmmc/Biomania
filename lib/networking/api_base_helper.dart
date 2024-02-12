import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

import '../constant/app_fonts.dart';
import '../constant/colors.dart';
import '../helper/helper.dart';
import '../service/shared_preferences.dart';
import 'api_exceptions.dart';

enum RequestType { get, post, delete, upload, download, put }

// const String baseUrl = '10.0.2.2';
const String baseUrl = '192.168.1.19';
// const String baseUrl = 'localhost';

class ApiBaseHelper {
  final String _baseUrl = 'http://$baseUrl:3000';

  // final String _baseUrl = 'https://api.youboost.tn';
  String? getToken() => SharedPreferencesService().get('jwt');

  Future<dynamic> request(RequestType requestType, String url, {Map<String, String>? headers, dynamic body, File? file, bool sendToken = false}) async {
    assert(requestType == RequestType.upload && file != null || requestType != RequestType.upload, 'Please ensure to incule the file to upload!');
    late http.Response response;
    Helper.isLoading.value = true;
    final String? token = sendToken ? getToken() : null;
    final requestUrl = Uri.parse('$_baseUrl/$url');
    switch (requestType) {
      case RequestType.get:
        response = await http.get(requestUrl, headers: headers);
        break;
      case RequestType.post:
        response = await http.post(
          requestUrl,
          body: jsonEncode(body),
          headers: headers ?? {'Content-type': 'application/json', 'charset': 'UTF-8', if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token'},
        );
        break;
      case RequestType.put:
        response = await http.put(
          requestUrl,
          body: jsonEncode(body),
          headers: headers ?? {'Content-type': 'application/json', 'charset': 'UTF-8', if (sendToken) 'Authorization': 'Bearer $token'},
        );
        break;
      case RequestType.delete:
        response = await http.delete(requestUrl);
        break;
      case RequestType.download:
        final response = await http.get(
          requestUrl,
          headers: headers ?? {if (sendToken) 'Authorization': 'Bearer $token'},
        );
        if (response.statusCode == HttpStatus.ok) {
          return response;
        }
      case RequestType.upload:
        final mimeTypeData = lookupMimeType(file!.path, headerBytes: [0xFF, 0xD8])?.split('/');
        final imageUploadRequest = http.MultipartRequest('POST', requestUrl);
        if (sendToken) imageUploadRequest.headers['Authorization'] = 'Bearer $token';
        final uploadedFile = await http.MultipartFile.fromPath(
          'image',
          file.path,
          contentType: MediaType(mimeTypeData![0], mimeTypeData[1]),
        );
        imageUploadRequest.files.add(uploadedFile);
        final streamedResponse = await imageUploadRequest.send();
        response = await http.Response.fromStream(streamedResponse);
    }
    Helper.isLoading.value = false;
    return _returnResponse(response);
  }

  String getImageUrl(String pictureName) => '$_baseUrl/public/$pictureName';
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      return jsonDecode(response.body);
    case 201:
      return jsonDecode(response.body);
    case 400:
      Helper.snackBar(message: jsonDecode(response.body)['message'], title: 'nope', includeDismiss: false, styleMessage: AppFonts.x12Regular);
      throw BadRequestException(response.body.toString());
    case 401:
      Helper.snackBar(message: jsonDecode(response.body)['message'], title: 'nope', includeDismiss: false, styleMessage: AppFonts.x12Regular);
      throw Exception(response.body.toString());
    case 409:
      Helper.snackBar(message: jsonDecode(response.body)['message'], title: 'nope', includeDismiss: false, styleMessage: AppFonts.x12Regular);
      throw ConflictException(response.body.toString());
    case 403:
      Helper.snackBar(message: jsonDecode(response.body)['message'], title: 'nope', includeDismiss: false, styleMessage: AppFonts.x12Regular);
      throw UnauthorisedException(response.body.toString());
    case 404:
      Helper.snackBar(message: jsonDecode(response.body)['message'], title: 'nope', includeDismiss: false, styleMessage: AppFonts.x12Regular);
      throw NotFoundException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
        'Error occured while Communication with Server with StatusCode : ${response.statusCode}',
      );
  }
}
