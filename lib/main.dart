import 'package:flutter/material.dart';

import 'routes.dart';
import 'helpers/jsonassetloader.dart';
import 'helpers/themes.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadAssetFromJson("assets/text/apptext.json"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final mainText = snapshot.data;
            return getMaterialApp(context, mainText["appTitle"]);
          } else {
            return getMaterialApp(context, "NAME NOT FOUND");
          }
        });
  }

  Widget getMaterialApp(BuildContext context, String appTitle) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: appTitle,
      initialRoute: '/',
      routes: appRoutes,
      theme: defaultTheme,
      darkTheme: defaultTheme,
    );
  }
}
