import 'package:flutter/material.dart';
import 'package:demonstration_project/utils/http_util.dart';
import 'package:demonstration_project/models/user_model.dart';

class UserProvider extends ChangeNotifier with HttpUtil {
  static const _loginRoute = 'login';
  static const _currentUser = 'current_user';
  UserModel? user;

  Future logIn({String? email, String? password}) {
    Map body = {
      'email': email,
      'password': password,
    };
    return request(
      requestType: RequestType.POST,
      type: ServerType.user,
      path: _loginRoute,
      body: body,
      redirect: false,
    ).then((response) {
      if (response == null) {
        print('Error, token error');
        return null;
      } else {
        String token = response['jwt_token'];
        setToken(token);
        return getUser();
      }
    });
  }

  logOut() {
    user = null;
    removeToken();
  }

  Future<UserModel?> getUser({bool redirect = true}) {
    return request(
      requestType: RequestType.GET,
      type: ServerType.user,
      path: _currentUser,
      redirect: redirect,
    ).then((response) {
      if (response == null) {
        print('Error, response error');
        return null;
      } else {
        Map<String, dynamic> currentUser = response['user'];
        user = UserModel.fromJson(currentUser);
        notifyListeners();
        return user;
      }
    });
  }
}
