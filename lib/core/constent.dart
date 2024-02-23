import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UrlConstant {
  static const String baseUrl = "http://stuverse.shop/api/";

  static const String loginUrl = "${baseUrl}login/";
  static const String threadsUrl = "${baseUrl}threads/";
}

//ad user id
void addUserIdSharePref({required String userId}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("userId", userId);
}

//get user id
Future<String?> getUserIdSharePref() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("userId");
}

//remove user id
Future<void> removeUserDetailsSharePref({required BuildContext context}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("userId");
  prefs.remove("token");
  prefs.remove("status");
  prefs.remove("subscribe");
  prefs.remove("email");
  prefs.remove("password");
  // Navigator.of(context).pushAndRemoveUntil(
  //   MaterialPageRoute(
  //     builder: (context) => ScreenSignIn(),
  //   ),
  //   (route) => false,
  // );
}

//ad user token
void addUserTokenSharePref({required String token}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("token", token);
}

//get user token
Future<String?> getUserTokenSharePref() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("token");
}

//ad user status
void addUserStatusSharePref({required bool token}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool("status", token);
}

//get user status
Future<bool?> getUserStatusSharePref() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool("status");
}

//ad user subscribe
Future<void> addUserSubScribeSharePref({required String subscribe}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("subscribe", subscribe);
}

//get user subscribe
Future<String?> getUserSubScribeSharePref() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  print(await getUserTokenSharePref());
  return prefs.getString("subscribe");
}

//ad user email
void addUserEmailSharePref({required String email}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("email", email);
}

//get user email
Future<String?> getUserEmailSharePref() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("email");
}

//ad user password
void addUserPasswordSharePref({required String password}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("password", password);
}

//get user email
Future<String?> getUserPasswordSharePref() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("password");
}
