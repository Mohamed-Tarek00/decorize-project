import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({
    super.key,
    this.leadingWidget,
    this.userName,
    this.userImage,
  });
  final Widget? leadingWidget;
  final String? userName;
  final String? userImage;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  bool isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 12.w,
          right: 12.w,
          bottom: 12.h,
          top: 12.h,
        ),

        child: Row(
          children: [
            CustomNetworkImage(
              imageUrl: widget.userImage!,
              height: 40.h,
              width: 40.w,
              shape: ImageShape.circle,
            ),

            SizedBox(width: 10.w),
            Column(
              children: [
                Text('مرحبا بك !', style: Styles.textStyle16),
                Text(widget.userName!, style: Styles.textStyle16),
              ],
            ),
            Spacer(),
            widget.leadingWidget ??
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isAvailable ? "متاح" : "غير متاح",
                      style: TextStyle(
                        fontSize: 16,
                        color: isAvailable ? Colors.green : Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Switch(
                      value: isAvailable,
                      onChanged: (value) {
                        setState(() {
                          isAvailable = value;
                        });
                      },
                      activeThumbColor: Colors.white,
                      activeTrackColor: Colors.green,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                    ),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
