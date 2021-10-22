// packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// providers
import 'package:demonstration_project/providers/user_provider.dart';
// models
import 'package:demonstration_project/models/user_model.dart';
// screen
import 'package:demonstration_project/screens/login/login_screen.dart';

class LoginPreload extends StatelessWidget {
  static const routeName = 'LoginPreload';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<UserProvider>(context, listen: false)
            .getUser(redirect: false),
        builder: (BuildContext context, AsyncSnapshot<UserModel?> user) {
          if (user.connectionState == ConnectionState.done) {
            if (user.data != null) {
              return Text('Log In'); // change to screen
            } else {
              return LoginScreen();
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
