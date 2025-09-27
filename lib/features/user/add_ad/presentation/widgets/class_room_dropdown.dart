import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClassRoomDropdown extends StatefulWidget {
  const ClassRoomDropdown({super.key});

  @override
  State<ClassRoomDropdown> createState() => _ClassRoomDropdownState();
}

class _ClassRoomDropdownState extends State<ClassRoomDropdown> {
  String? selectedRoom;

  final List<String> rooms = [
    'غرفة معيشة',
    'صالون',
    'مكتب',
    'حمام',
    'مطبخ',
    'سرير',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('التصنيف', style: Styles.textStyle18),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.all(8.sp),
            width: 335.w,
            height: 48.h,
            decoration: BoxDecoration(
              border: Border.all(width: 1.5, color: Colors.grey.shade300),
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: DropdownButton<String>(
              hint: Text("اختر الغرفة", style: Styles.textStyle14),
              value: selectedRoom,
              isExpanded: true,
              underline: const SizedBox(),
              icon: const SizedBox.shrink(),
              items: rooms.map((room) {
                return DropdownMenuItem(
                  value: room,
                  child: Text(room, style: Styles.textStyle14),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedRoom = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
