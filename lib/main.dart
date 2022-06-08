import 'package:astrotak/models/Database_Service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => DatabaseService(),
      child: Sizer(builder: (context, orientation, deviceTye) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "AstroTak",
          theme: ThemeData(
            fontFamily: 'WorkSans',
            brightness: Brightness.light,
            primarySwatch: Colors.indigo,
          ),
          darkTheme: ThemeData(
            fontFamily: 'WorkSans',
            brightness: Brightness.dark,
          ),
          themeMode: ThemeMode.light,
          home: Home(),
        );
      }),
    );
  }
}
