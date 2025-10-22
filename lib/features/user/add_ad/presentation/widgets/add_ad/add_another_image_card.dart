import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAnotherImageCard extends StatelessWidget {
  const AddAnotherImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.5,
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: const Icon(Icons.add, color: Colors.grey),
                    );
  }
}
