import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:provider_example/src/model/response_model.dart';
import 'package:provider_example/src/util/constants.dart';

class MovieApi {
  static Future<ResponseModel> fetchMovie() async {
    try {
      var response = await http.get(
        Uri.parse(baseUrl),
      );
      if (response.statusCode.toString()[0] == '2') {
        return ResponseModel(data: response.body, status: 'success');
      } else {
        return ResponseModel(data: response.body, status: 'error');
      }
    } catch (e) {
      print(e);
      return ResponseModel(data: e, status: 'error');
    }
  }

  
}
