import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer_pro/sizer.dart';
import 'package:workout_demo_app/Models/ExcerciseListModel.dart';

import '../Services/Webservices.dart';

class DetailScreen extends StatefulWidget {
  String id;
  DetailScreen({super.key, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final Webservices _webservices = Webservices();
  ExcerciseListModel model = ExcerciseListModel();
  bool loading = true;

  fetchData() async {
    await _webservices.getExcersize(widget.id).then((value) {
      if (value != null) {
        model = value;
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 10.0.sp,
              color: Colors.black,
            )),
      ),
      body: loading
          ? const Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            )
          : SizedBox(
              height: 100.0.h,
              width: 100.0.w,
              child: Stack(
                children: [
                  SizedBox(
                    height: 100.0.h,
                    width: 100.0.w,
                    child: Column(
                      children: [
                        Container(
                          height: 50.0.h,
                          width: double.infinity,
                          decoration: model.gifUrl == null
                              ? BoxDecoration(
                                  color: Colors.grey.shade200,
                                )
                              : BoxDecoration(
                                  color: Colors.grey.shade200,
                                  image: DecorationImage(
                                      image: NetworkImage(model.gifUrl!),
                                      fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100.0.h,
                    width: 100.0.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.0.h, horizontal: 5.0.w),
                          width: 100.0.w,
                          height: 55.0.h,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade200,
                                    spreadRadius: 5,
                                    blurRadius: 5)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8.0.w),
                                  topRight: Radius.circular(8.0.w))),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(2.0.w)),
                                height: 1.0.h,
                                width: 30.0.w,
                              ),
                              SizedBox(
                                height: 3.0.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      model.name ?? "",
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.0.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.0.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${model.equipment}".toUpperCase(),
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 6.0.sp,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.0.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      model.target ?? "",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 7.0.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.0.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      model.bodyPart ?? "",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 7.0.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
