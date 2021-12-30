import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:welo/pages/onboarding_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: OnboardingPage(),
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(decorationColor: Colors.red),
      ),
    );
  }
}
