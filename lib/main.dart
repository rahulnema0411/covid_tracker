import 'package:covidtracker/models/app_data.dart';
import 'package:covidtracker/screens/active_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'constants.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppData(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backGroundColor_dark,
          appBarTheme: AppBarTheme(
            color: backGroundColor_dark,
            elevation: 0.0,
          ),
        ),
        home: ActiveScreen(),
      ),
    );
  }
}
