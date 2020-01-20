import 'package:docs_app/Constants/constants.dart';
import 'package:docs_app/screen/docsapp.dart';
import 'package:docs_app/screen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      // systemNavigationBarColor: Colors.blue[800],
      //   statusBarColor:Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return MaterialApp(
      title: 'AEO UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      routes: <String, WidgetBuilder> {
        Constants.SPLASH_SCREEN: (BuildContext context) => AnimatedSplashScreen(),
        Constants.AEO_DOCS: (BuildContext context) => DocsApp(),
      },
      initialRoute: Constants.SPLASH_SCREEN,
    );
  }
}

