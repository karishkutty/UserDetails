import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:test_flutter/Utility/utility.dart';

import 'Model/detailsModal.dart';

class ApiCall {
  Future<dynamic> getMethod(url) async {
    var responseJson = '';
    try {
      final apiUrl = Uri.parse(url);
      final response = await http.get(apiUrl);
      responseJson = _response(response);
    } on SocketException {
      Utility.toastMessage('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.body;
        return responseJson;
      case 400:
        Utility.toastMessage("Invalid Request: ");

        return '';
      case 401:
      case 403:
        Utility.toastMessage("Unauthorised: ");

        return '';
      case 500:
      default:
        Utility.toastMessage("Error occurred with StatusCode :");
    }
  }
}

// class HttpService {
//   final String postsURL = "https://gorest.co.in/public-api/users";

//   Future<List<Data>> getusers() async {
//     Response res = await get(Uri.parse(postsURL));
//     print(res);
//     if (res.statusCode == 200) {
//       List<dynamic> body = jsonDecode(res.body);
//       print(res.body);
//       List<Data> users = body
//           .map(
//             (dynamic item) => Data.fromJson(item),
//           )
//           .toList();

//       return users;
//     } else {
//       throw "Unable to retrieve posts.";
//     }
//   }
// }
