import 'package:decorize_project/core/location/cubit/location_cubit_cubit.dart';
import 'package:decorize_project/core/utils/geo_locator.dart';
import 'package:decorize_project/features/user/add_ad/presentation/widgets/add_Location/enter_location_section.dart';
import 'package:decorize_project/features/user/add_ad/presentation/widgets/add_Location/get_my_location_section.dart';
import 'package:decorize_project/features/user/add_ad/presentation/widgets/add_Location/map_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          MapSection(
            mapController: _mapController,
            onMapCreated: (controller) {
              _mapController = controller;
            },
            onTap: (position) {
              setState(() {
                _selectedLocation = position;
                locationCubit.getLocation(
                  latitude: position.latitude,
                  longitude: position.longitude,
                );
              });
            },
            selectedLocation: _selectedLocation,
          ),
          GetMyLocationSection(
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
          ),
          
          _selectedLocation != null
              ? EnterLocationSection(selectedLocation: _selectedLocation,)
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}

