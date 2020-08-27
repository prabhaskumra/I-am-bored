import 'package:flutter/material.dart';
import './provider/saved_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
// import 'dart:io';

import './screens/settings_screen.dart';
import './screens/about_app_screen.dart';
import './screens/donation_screen.dart';
import './screens/main_screen.dart';
import './screens/list_detail_screen.dart';
import './provider/theme_data.dart';
import './screens/submissions_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    // final selectedThemeData = Provider.of<CustomThemeData>(context);
    // Provider.of<SavedList>(context).getDatabaseList();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SavedList>(
          create: (context) => SavedList(),
        ),
        ChangeNotifierProvider<CustomThemeData>(
          create: (context) => CustomThemeData(),
        ),
      ],
      child: Builder(
        builder: (BuildContext newContext) {
          Provider.of<SavedList>(newContext).getDatabaseList();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch:
                  // primarySwatch: MaterialColor(0X3b5998, Map<>);
                  Provider.of<CustomThemeData>(newContext).themeColor,

              visualDensity: VisualDensity.adaptivePlatformDensity,
              fontFamily: 'SansPro',
              brightness: Brightness.light,
              textTheme: TextTheme(
                caption: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              // darkTheme: ThemeData(
              //   brightness: Brightness.dark,
              // ),
            ),
            home: MainScreen(),
            routes: {
              SettingsScreen.routeName: (ctx) => SettingsScreen(),
              AboutAppScreen.routeName: (ctx) => AboutAppScreen(),
              DonationScreen.routeName: (ctx) => DonationScreen(),
              MainScreen.routeName: (ctx) => MainScreen(),
              ListDetailScreen.routeName: (ctx) => ListDetailScreen(),
              SubmissionScreen.routeName: (ctx) => SubmissionScreen(),
            },
          );
        },
      ),
    );
  }
}
