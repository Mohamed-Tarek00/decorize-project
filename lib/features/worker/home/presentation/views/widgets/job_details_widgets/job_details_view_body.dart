import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/worker/home/domain/entites/job_entity.dart';
import 'package:decorize_project/features/worker/home/presentation/views/widgets/job_details_widgets/address_card.dart';
import 'package:decorize_project/features/worker/home/presentation/views/widgets/custom_worker_button.dart';
import 'package:decorize_project/features/worker/home/presentation/views/widgets/job_details_widgets/job_details_appbar.dart';
import 'package:decorize_project/features/worker/home/presentation/views/widgets/job_details_widgets/job_details_card.dart';
import 'package:decorize_project/features/worker/home/presentation/views/widgets/job_details_widgets/job_request_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobDetailsViewBody extends StatelessWidget {
  const JobDetailsViewBody({super.key, required this.job});
  final WorkerJobEntity job;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const JobDetailsAppBar(),
                SizedBox(height: 12.h),
                JobDetailsCard(job: job),
                SizedBox(height: 12.h),
                const AddressCard(),
                SizedBox(height: 50.h),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  color: Colors.white,
                  child: CustomWorkerButton(
                    onTap: () => JobRequestBottomSheet.show(context),
                    height: 40.h,
                    width: double.infinity,
                    text: 'التقديم للطلب',
                    textStyle: Styles.textStyle14.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
