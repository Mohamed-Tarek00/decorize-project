import 'dart:io';
import 'package:decorize_project/core/utils/logic_images.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/user/add_ad/presentation/widgets/add_ad/add_another_image_card.dart';
import 'package:decorize_project/features/user/add_ad/presentation/widgets/add_ad/add_image_card.dart';
import 'package:decorize_project/features/user/add_ad/presentation/widgets/add_ad/remove_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

              child:AddImageCard()
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

                    child: AddAnotherImageCard()
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
                 RemoveImageWidget(
                      onTap: () {
                        setState(() {
                          _images.removeAt(index);
                        });
                      },
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

