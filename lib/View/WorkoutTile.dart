import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';

import '../Models/ExcerciseListModel.dart';

class WorkoutTile extends StatelessWidget {
  final ExcerciseListModel model;
  const WorkoutTile({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 3.0.h, right: 2.w, left: 2.w),
      padding: EdgeInsets.symmetric(vertical: 1.0.h, horizontal: 3.0.w),
      height: 15.0.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade100),
          borderRadius: BorderRadius.circular(5.0.w),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200, spreadRadius: 5, blurRadius: 5)
          ]),
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                margin:
                    EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 0.5.h),
                height: 15.0.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            model.target ?? "",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.0.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${model.equipment}".toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 6.0.sp,
                                fontWeight: FontWeight.w100),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            model.name ?? "",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 5.0.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    image: DecorationImage(
                        image: NetworkImage(
                          model.gifUrl!,
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(4.0.w)),
                height: 15.0.h,
              ))
        ],
      ),
    );
  }
}
