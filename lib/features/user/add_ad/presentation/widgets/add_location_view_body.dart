import 'package:decorize_project/core/utils/geo_locator.dart';
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
            onTap: (position) async {
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
                      print(position);
                      setState(() {
                        if (position != null) {
                          _selectedLocation = LatLng(
                            position.latitude,
                            position.longitude,
                          );
                          _mapController?.animateCamera(
                            CameraUpdate.newLatLngZoom(_selectedLocation!, 15),
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
