import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/location/cubit/location_cubit_cubit.dart';
import 'package:decorize_project/core/location/cubit/location_cubit_state.dart';
import 'package:decorize_project/core/utils/geo_locator.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddLocationViewBody extends StatefulWidget {
  const AddLocationViewBody({super.key});

  @override
  State<AddLocationViewBody> createState() => _AddLocationViewBodyState();
}

class _AddLocationViewBodyState extends State<AddLocationViewBody> {
  GoogleMapController? _mapController;
  LatLng? _selectedLocation;

  @override
  Widget build(BuildContext context) {
    final locationCubit = context.read<LocationCubit>();

    return SizedBox.expand(
      child: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(30.033333, 31.233334),
              zoom: 15,
            ),
            onMapCreated: (controller) {
              _mapController = controller;
            },
            onTap: (position) async {
              setState(() {
                _selectedLocation = position;
              });
              locationCubit.getLocation(
                latitude: position.latitude,
                longitude: position.longitude,
              );
            },
            markers: _selectedLocation != null
                ? {
                    Marker(
                      markerId: const MarkerId('Selectedposition'),
                      position: _selectedLocation!,
                    ),
                  }
                : {},
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: [
                  SizedBox(height: MediaQuery.of(context).padding.top),
                  CustomButton(
                    onPressed: () async {
                      final position = await SetLocation.getLocation();
                      setState(() {
                        if (position != null) {
                          _selectedLocation = LatLng(
                            position.latitude,
                            position.longitude,
                          );
                          _mapController?.animateCamera(
                            CameraUpdate.newLatLngZoom(_selectedLocation!, 15),
                          );
                          locationCubit.getLocation(
                            latitude: position.latitude,
                            longitude: position.longitude,
                          );
                        }
                      });
                    },
                    text: 'تفقد موقعي',
                  ),
                ],
              ),
            ),
          ),
          _selectedLocation != null
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BlocBuilder<LocationCubit, LocationState>(
                          builder: (context, state) {
                            if (state is LocationLoading) {
                              return Padding(
                                padding: EdgeInsets.all(12),
                                child: CircularProgressIndicator(
                                  color: kPrimaryColor,
                                ),
                              );
                            } else if (state is LocationLoaded) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 8.h,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/location.svg',
                                      width: 24.w,
                                      height: 24.h,
                                      color: kPrimaryColor,
                                    ),
                                    SizedBox(width: 6.w), 
                                    Expanded(
                                      child: Text(
                                        state.location.displayName,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Styles.textStyle12.copyWith(
                                          fontSize: 12.sp, 
                                          fontWeight: FontWeight.w600,
                                          height: 1.4,
                                          color: const Color(0xFF1D1B20),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else if (state is LocationError) {
                              return Padding(
                                padding: EdgeInsets.all(12.r),
                                child: Text(
                                  state.message,
                                  style: const TextStyle(color: Colors.red),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                        CustomButton(
                          onPressed: () {
                            print('Selected Location: $_selectedLocation');
                          },
                          text: 'أضف الموقع',
                        ),
                      ],
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
