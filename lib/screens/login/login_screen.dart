// packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loading_overlay/loading_overlay.dart';
// models
import 'package:demonstration_project/models/user_model.dart';
// providers
import 'package:demonstration_project/providers/user_provider.dart';
// components
import 'package:demonstration_project/components/custom_elevated_button.dart';
import 'package:demonstration_project/components/text_fields.dart';
// util
import 'package:demonstration_project/utils/snackbar_util.dart';

const LOGIN_ERROR = 'Login or password are wrong!';

class LoginScreen extends StatefulWidget {
  static const routeName = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  bool showLoader = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void requestUser() async {
    setState(() {
      showLoader = true;
    });
    UserModel? user =
        await Provider.of<UserProvider>(context, listen: false).logIn(
      email: email,
      password: password,
    );
    if (user != null) {
      Navigator.pushReplacementNamed(
          context, LoginScreen.routeName); //Provide your screen
    } else {
      SnackBarUtil.instance.showSnackBar(LOGIN_ERROR);
    }
    setState(() {
      showLoader = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: LoadingOverlay(
        isLoading: showLoader,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Container(
                  height: 300,
                  child: Image.asset('assets/images/logo_new.png'),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                decoration: kTextFieldDecoration.copyWith(hintText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                obscureText: true,
                decoration: kTextFieldDecoration.copyWith(hintText: 'Password'),
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              ElevatedButtonCustom(
                onPressed: requestUser,
                child: Text('Sign In'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
