import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClientWorkerSelection extends StatefulWidget {
  const ClientWorkerSelection({super.key, required this.onChoiceSelected});
  final Function(int) onChoiceSelected;

  @override
  State<ClientWorkerSelection> createState() => _ClientWorkerSelectionState();
}

class _ClientWorkerSelectionState extends State<ClientWorkerSelection> {
  int isSelected = 0;
  List<Map> UserType = [
    {'title': 'مستخدم', 'image': 'assets/icons/user.png'},
    {'title': 'عامل', 'image': 'assets/icons/worker.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(UserType.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              isSelected = index;
              widget.onChoiceSelected(isSelected);
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              height: 170.h,
              width: 140.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: const Color(0xffE7EEEB), width: 1.5),
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
                                    color: const Color(0xff0C5137),
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
                        UserType[index]['image']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(UserType[index]['title']!, style: Styles.textStyle18),
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
