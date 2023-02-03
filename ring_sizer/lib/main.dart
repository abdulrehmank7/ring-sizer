import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ring_sizer/home_screen.dart';

void main() {
  runApp(const RingSizer());
}

class RingSizer extends StatelessWidget {
  const RingSizer({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const HomeScreen(),
      builder: (childContext, child) {
        return MediaQuery(
          data: MediaQuery.of(childContext).copyWith(textScaleFactor: 1),
          child: child!,
        );
      },
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: Colors.white,
        /*colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: primaryColor,
          secondary: lightGreen4,
          onSecondary: primaryColor,
        ),*/
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
