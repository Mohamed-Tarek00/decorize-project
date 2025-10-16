import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
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
            onTap: (position) {
              setState(() {
                _selectedLocation = position;
              });
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
          _selectedLocation != null
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: CustomButton(
                      onPressed: () {
                        print(_selectedLocation);
                      },
                      text: 'اضف الموقع',
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
