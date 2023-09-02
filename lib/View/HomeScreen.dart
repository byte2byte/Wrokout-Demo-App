import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer_pro/sizer.dart';
import 'package:workout_demo_app/Models/ExcerciseListModel.dart';
import 'package:workout_demo_app/Services/Webservices.dart';
import 'package:workout_demo_app/Utils/KSTyles.dart';
import 'package:workout_demo_app/View/DetailScreen.dart';

import 'WorkoutTile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Webservices _webservices = Webservices();
  List<ExcerciseListModel> _allExcersize = [];
  bool loading = true;

  fetchData() async {
    await _webservices.fetchAllExcersize().then((value) {
      if (value != null) {
        _allExcersize = value;
        loading = false;
      } else {
        Fluttertoast.showToast(msg: "Unable to load excersizes");
        loading = false;
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: 100.0.w,
        height: 100.0.h,
        padding: EdgeInsets.symmetric(horizontal: 5.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top + 2.0.h,
            ),
            Text(
              "Workouts",
              style: KStyles.superHeading,
            ),
            Expanded(
              child: loading
                  ? ListView.builder(
                      padding: EdgeInsets.only(top: 3.0.h),
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) => getShimmerPlaceholder())
                  : ListView.builder(
                      padding: EdgeInsets.only(top: 3.0.h),
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _allExcersize.length,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Get.to(
                                  () => DetailScreen(
                                      id: _allExcersize[index].id ?? "-1"),
                                  transition: Transition.fadeIn);
                            },
                            child: WorkoutTile(
                              model: _allExcersize[index],
                            ),
                          )),
            )
          ],
        ),
      ),
    );
  }

  Container getShimmerPlaceholder() {
    return Container(
      margin: EdgeInsets.only(bottom: 3.0.h),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeShimmer(
                  height: 1.0.h,
                  width: double.infinity,
                  radius: 4,
                  highlightColor: const Color(0xffF9F9FB),
                  baseColor: const Color(0xffE6E8EB),
                ),
                SizedBox(
                  height: 3.0.h,
                ),
                FadeShimmer(
                  height: 1.0.h,
                  width: double.infinity,
                  radius: 4,
                  highlightColor: const Color(0xffF9F9FB),
                  baseColor: const Color(0xffE6E8EB),
                ),
                SizedBox(
                  height: 3.0.h,
                ),
                FadeShimmer(
                  height: 1.0.h,
                  width: double.infinity,
                  radius: 4,
                  highlightColor: const Color(0xffF9F9FB),
                  baseColor: const Color(0xffE6E8EB),
                )
              ],
            ),
          ),
          SizedBox(
            width: 5.0.w,
          ),
          FadeShimmer(
            height: 15.h,
            width: 15.h,
            radius: 5.w,
            fadeTheme: FadeTheme.light,
          ),
        ],
      ),
    );
  }
}
