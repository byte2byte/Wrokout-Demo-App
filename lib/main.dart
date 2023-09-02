import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer_pro/sizer.dart';
import 'package:workout_demo_app/View/HomeScreen.dart';
import 'package:workout_demo_app/View/NoConnectionScreen.dart';

import 'Services/ConnectivityService.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final ConnectivityService _connectivityService = ConnectivityService();

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(textTheme: GoogleFonts.nunitoSansTextTheme()),
        home: StreamBuilder<bool>(
            stream: _connectivityService.connectionStatusController.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const NoConnection();
              } else {
                return const HomeScreen();
              }
            }),
      );
    });
  }
}
