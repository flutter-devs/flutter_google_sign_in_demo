import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_sign_in_demo/View_Model/home_view_model.dart';
import 'package:flutter_google_sign_in_demo/View_Model/sign_in_view_model.dart';
import 'package:flutter_google_sign_in_demo/utils/locator.dart';
import 'package:flutter_google_sign_in_demo/utils/prefer.dart';
import 'package:flutter_google_sign_in_demo/utils/routes.dart';
import 'package:provider/provider.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Prefs.init();
  setLocator();
  runApp(MultiProvider(child: MyApp(), providers: [
    ChangeNotifierProvider<HomeViewModel>(
      builder: (_) => HomeViewModel(),
    ),
  ],));}


class MyApp extends StatefulWidget{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale locale;
  bool localeLoaded = false;

  @override
  void initState() {
    super.initState();
    print('initState()');

    //MyApp.setLocale(context, locale);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.grey[400],
//        statusBarColor: Styles.blueColor,
        statusBarIconBrightness:
        Brightness.light //or set color with: Color(0xFF0000FF)
    ));
    return ChangeNotifierProvider<SignInViewModel>(
      builder: (_) => SignInViewModel(),
      child: Center(
        child: MaterialApp(
          initialRoute: '/',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.onGenerateRoute,

          theme: ThemeData(
            primaryColor:Colors.black,

            fontFamily: 'FA',

          ),
        ),
      ),
    );
  }
}
