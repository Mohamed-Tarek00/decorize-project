import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserWorkerSelection extends StatefulWidget {
  const UserWorkerSelection({super.key});

  @override
  State<UserWorkerSelection> createState() => _UserWorkerSelectionState();
}

class _UserWorkerSelectionState extends State<UserWorkerSelection> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(2, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                isSelected = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                height: 155.h,
                                width: 145.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(
                                    color: const Color(0xffE7EEEB),
                                    width: 1.5,
                                  ),
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            height: 20.h,
                                            width: 20.h,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: const Color(0xff0C5137),
                                                width: 1.5,
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            child: isSelected == index
                                                ? Container(
                                                    margin: EdgeInsets.all(4),
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                        0xff0C5137,
                                                      ),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  )
                                                : null,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 64.h,
                                        width: 64.h,
                                        child: Image.asset(
                                          'assets/icons/user.png',
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Text('مستخدم', style: Styles.textStyle18),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).reversed.toList(),
                      );
  }
}