import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_test_project/core/constent.dart';
import 'package:new_test_project/screens/home_page/model/home_model.dart';

class HomeProviders extends ChangeNotifier {
  List<HomeModel>? getHomeModel;
  bool getHomeLoading = false;
  Future<void> fetchUserHome() async {
    try {
      String? token = await getUserTokenSharePref();
      getHomeLoading = true;
      notifyListeners();
      log(token.toString());

      Uri url = Uri.parse(UrlConstant.threadsUrl);
      log(url.toString());
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          "authorization": "Token ${token}"
        },
      );
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        getHomeModel = homeModelFromJson(response.body);
        notifyListeners();
      } else {
        getHomeLoading = false;
        notifyListeners();
      }
      getHomeLoading = false;
      notifyListeners();
    } catch (e) {
      log(e.toString());
      getHomeLoading = false;
      notifyListeners();
    }
  }
}
