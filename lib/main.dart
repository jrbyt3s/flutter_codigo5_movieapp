import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_codigo5_movieapp/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Color(0xff23dec3),
      //systemNavigationBarColor: Colors.indigo,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.manropeTextTheme(),
      ),
      home: HomePage(),
    );
  }
}
