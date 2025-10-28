import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/location/cubit/location_cubit_cubit.dart';
import 'package:decorize_project/core/location/cubit/location_cubit_state.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/worker/home/domain/entites/job_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AddressCard extends StatefulWidget {
  const AddressCard({super.key, required this.job});
  final WorkerJobEntity job;

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  @override
  void initState() {
    super.initState();
    final lat = double.tryParse(widget.job.lat) ?? 0.0;
    final lon = double.tryParse(widget.job.long) ?? 0.0;
    if (lat != 0 && lon != 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<LocationCubit>().getLocation(
          latitude: lat,
          longitude: lon,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/location.svg',
                width: 20,
                height: 20,
              ),
              SizedBox(width: 8),
              Text(
                'العنوان',
                style: Styles.textStyle16.copyWith(color: kPrimaryColor),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          const Divider(),
          SizedBox(height: 4.h),
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: Image.asset(
              'assets/icons/Map.png',
              width: double.infinity,
              height: 125.h,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/icons/location.svg',
                  width: 20,
                  height: 20,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: BlocBuilder<LocationCubit, LocationState>(
                    builder: (context, state) {
                      if (state is LocationLoading) {
                        return Text(
                          'جاري تحميل العنوان...',
                          style: Styles.textStyle12.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        );
                      } else if (state is LocationLoaded) {
                        return Text(
                          state.location.displayName,
                          style: Styles.textStyle12.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                          softWrap: true,
                        );
                      } else if (state is LocationError) {
                        return Text(
                          'حدث خطأ أثناء تحميل العنوان',
                          style: Styles.textStyle12.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
