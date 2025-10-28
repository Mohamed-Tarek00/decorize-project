import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/widgets/home_app_bar.dart';
import 'package:decorize_project/features/shared/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:decorize_project/features/worker/home/presentation/widgets/home_widgets/custom_banner_widget.dart';
import 'package:decorize_project/features/worker/home/presentation/widgets/home_widgets/jobs_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkerHomeViewBody extends StatelessWidget {
  const WorkerHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).padding.top,
        ),

        /// App Bar
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const HomeAppBar(
                userName: 'جار التحميل...',
                userImage: null,
              );
            } else if (state is ProfileLoaded) {
              final user = state.response;
              return HomeAppBar(userName: user.name, userImage: user.image);
            } else if (state is ProfileFailuer) {
              return const HomeAppBar(
                userName: 'حدث خطأ أثناء تحميل البيانات',
                userImage: null,
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),

        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 12.h),
                  const CustomBannerWidget(),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('احدث الاعلانات', style: Styles.textStyle20),
                      Column(
                        children: [
                          Text(
                            'عرض الكل',
                            style: Styles.textStyle14.copyWith(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Container(
                            width: 56.w,
                            height: 1.h,
                            color: const Color(0xff0C5137),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  const JobsSection(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
