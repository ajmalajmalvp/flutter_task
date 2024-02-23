import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_test_project/core/constent.dart';
import 'package:new_test_project/screens/home_page/screen_home.dart';
import 'package:new_test_project/screens/login/model/login_model.dart';

class SignInProvider extends ChangeNotifier {
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  LoginModel? loginModel;
  bool loginLoading = false;
  Future<void> loginUser(BuildContext context,
      {required String username, required String password}) async {
    try {
      log(username.toString());
      log(password.toString());
      loginLoading = true;
      notifyListeners();

      Map<String, dynamic> requestBody = {
        'username': username,
        'password': password,
      };
      String requestBodyJson = json.encode(requestBody);
      final response = await http.post(
        Uri.parse(
          UrlConstant.loginUrl,
        ),
        headers: {
          'Content-Type': 'application/json', // Set the content type to JSON
        },
        body: requestBodyJson,
      );
      log("response ${response.statusCode.toString()}  ${response.body.toString()}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        loginModel = loginModelFromJson(
          response.body,
        );
        // addUserIdSharePref(
        //   userId: loginModel!.userId!,
        // );
        addUserTokenSharePref(
          token: loginModel!.token!,
        );
        // addUserStatusSharePref(
        //   token: loginModel!.status!,
        // );
        // await addUserSubScribeSharePref(
        //     subscribe: loginModel!.isSubscribed.toString());
        print("${await getUserSubScribeSharePref()}worked");
        print("worked");

        if (loginModel != null) {
          if (loginModel!.token != null) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const ScreenHome(),
              ),
              (route) => false,
            );
          }
        }

        print('Login successful');
        log('Response body: ${response.body}');
      } else {
        showCustomSnackBar(
          context: context,
          message: 'Login failed.',
        );
        // Handle errors based on the status code
        print('Login failed. Status Code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      loginLoading = false;
      notifyListeners();
    } catch (error) {
      loginLoading = false;
      notifyListeners();
      // Handle other types of errors (e.g., network errors)
      print('Error during login: $error');
    }
  }
}

void showCustomSnackBar(
    {required BuildContext context, required String message}) {
  final snackBar = SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 3), // Adjust the duration as needed
  );

  // Show the SnackBar
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
