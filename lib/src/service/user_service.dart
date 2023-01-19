import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:km_test/src/constant/api.dart';
import 'package:km_test/src/models/user_model.dart';

class UserService {
  Future<List<UserModel>> get(int page) async {
    var response =
        await http.get(Uri.parse("${MyApi.urlApi}?per_page=7&page=$page"));
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      List data = map["data"];
      List<UserModel> users =
          data.map((item) => UserModel.fromJson(item)).toList();
      return users;
    }
    return [];
  }
}
