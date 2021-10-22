// packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
// constants
import 'package:demonstration_project/constants/colors.dart';
// providers
import 'providers/user_provider.dart';
// screens
import 'screens/login/login_screen.dart';
import 'screens/login/login_preload.dart';
// utils
import 'package:demonstration_project/utils/navigation_util.dart';
import 'package:demonstration_project/utils/snackbar_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Demonstration App',
        navigatorKey: NavigationService.instance.navigationKey,
        scaffoldMessengerKey: SnackBarUtil.instance.snackBarKey,
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
        theme: ThemeData(
          fontFamily: 'OpenSans',
          primaryColor: kColorPrimary,
          primaryColorDark: kColorDarkPrimary,
          primaryColorLight: kColorLightPrimary,
          accentColor: kColorAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: LoginPreload.routeName,
        routes: {
          LoginPreload.routeName: (context) => LoginPreload(),
          LoginScreen.routeName: (context) => LoginScreen(),
        },
      ),
    );
  }
}
