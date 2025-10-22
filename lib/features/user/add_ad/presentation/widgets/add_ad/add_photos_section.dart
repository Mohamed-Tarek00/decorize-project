import 'dart:io';
import 'package:decorize_project/core/utils/logic_images.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotosSection extends StatefulWidget {
  const AddPhotosSection({super.key});

  @override
  State<AddPhotosSection> createState() => _AddPhotosSectionState();
}

class _AddPhotosSectionState extends State<AddPhotosSection> {
  final List<XFile> _images = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('إضافة صور', style: Styles.textStyle18),
          SizedBox(height: 8.h),

          if (_images.isEmpty)
            GestureDetector(
              onTap: () async {
                await LogicImages.pickImages(_images);
                setState(() {});
              },

              child: Container(
                padding: EdgeInsets.all(8.sp),
                width: double.infinity,
                height: 100.h,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Colors.grey.shade300),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: SvgPicture.asset('assets/icons/add_photo.svg'),
                ),
              ),
            )
          else
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _images.length < 5
                  ? _images.length + 1
                  : _images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8.h,
                crossAxisSpacing: 8.w,
              ),
              itemBuilder: (context, index) {
                if (index == _images.length && _images.length < 5) {
                  return GestureDetector(
                    onTap: () async {
                      await LogicImages.pickImages(_images);
                      setState(() {});
                    },

                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.5,
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: const Icon(Icons.add, color: Colors.grey),
                    ),
                  );
                }

                final image = _images[index];
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.file(
                        File(image.path),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Positioned(
                      top: 4.h,
                      right: 4.w,
                      child: GestureDetector(
                        onTap: () => setState(() {
                          LogicImages.removeImage(index, _images);
                        }),
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black54,
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
        ],
      ),
    );
  }
}
