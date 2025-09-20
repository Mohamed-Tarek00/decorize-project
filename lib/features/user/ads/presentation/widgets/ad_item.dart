import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/user/ads/presentation/widgets/ad_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AdItem extends StatelessWidget {
  const AdItem({super.key});

  @override
  Widget build(BuildContext context) {
    final AdModel ad = AdModel(
      imagePath: 'assets/design/modern.png',
      title: 'مطلوب نجار',
      price: 500,
      subTitle:
          'نبحث عن نجار محترف ومبدع لتصميم غرفة مكتب أنيقة وعملية، حيث نرغب في أن تكون المساحة مريحة وعملية في نفس الوقت. نود أن تتضمن الغرفة عناصر تصميم مبتكرة، مثل أرفف مدمجة ومساحة عمل واسعة، بالإضافة إلى استخدام ألوان دافئة تضفي شعوراً بالراحة.',
    );
    return GestureDetector(
      onTap: () {
        context.push(AppRouterNames.adDetails, extra: ad);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 100.h,
                  width: 85.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(ad.imagePath, fit: BoxFit.cover),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            ad.title,
                            style: Styles.textStyle16.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "${ad.price}",
                            style: Styles.textStyle18.copyWith(
                              color: kPrimaryColor,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            'ريال',
                            style: Styles.textStyle16.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        ad.subTitle,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle12.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "عرض التفاصيل",
                            style: Styles.textStyle16.copyWith(
                              color: kPrimaryColor,
                            ),
                          ),
                          SizedBox(height: 3),
                          Container(
                            height: 1.5,
                            width: 95.w,
                            color: kPrimaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
