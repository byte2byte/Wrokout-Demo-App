import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';

class NoConnection extends StatelessWidget {
  const NoConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: 100.0.h,
        width: 100.0.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 30.0.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/noconnection.gif"),
                      fit: BoxFit.contain)),
            ),
            Text(
              "No Internet Connection!!!",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 8.0.sp,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
