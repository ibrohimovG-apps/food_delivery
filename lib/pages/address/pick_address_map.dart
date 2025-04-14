import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_button.dart';
import 'package:food_delivery/controllers/location_controller.dart';
import 'package:food_delivery/pages/address/widgets/search_location_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickAddressMap extends StatefulWidget {
  final bool fromSignUp;
  final bool fromAddressPage;
  final GoogleMapController googleMapController;

  const PickAddressMap({
    super.key,
    required this.fromSignUp,
    required this.fromAddressPage,
    required this.googleMapController,
  });

  @override
  State<PickAddressMap> createState() => _PickAddressMapState();
}

class _PickAddressMapState extends State<PickAddressMap> {
  late LatLng _initialPosition;
  late GoogleMapController _mapController;
  late CameraPosition _cameraPosition;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Get.find<LocationController>().addressList.isEmpty) {
      _initialPosition = LatLng(
        40.36627113717328,
        71.77362535736373,
      );
      _cameraPosition = CameraPosition(
        target: _initialPosition,
        zoom: 17,
      );
    } else {
      if (Get.find<LocationController>().addressList.isNotEmpty) {
        _initialPosition = LatLng(
          double.parse(Get.find<LocationController>().getAddress["latitude"]),
          double.parse(Get.find<LocationController>().getAddress["longitude"]),
        );
        _cameraPosition = CameraPosition(
          target: _initialPosition,
          zoom: 17,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
      builder: (locationController) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: SizedBox(
                width: double.maxFinite,
                child: Stack(
                  children: [
                    GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: _initialPosition,
                        zoom: 17,
                      ),
                      zoomControlsEnabled: false,
                      onCameraMove: (position) {
                        _cameraPosition = position;
                      },
                      onCameraIdle: () {
                        Get.find<LocationController>()
                            .updatePosition(_cameraPosition, false);
                      },
                      onMapCreated: (controller) {
                        _mapController = controller;
                      },
                    ),
                    Center(
                      child: !locationController.loading
                          ? Image.asset(
                              "assets/image/pick_marker.png",
                              height: 50,
                              width: 50,
                            )
                          : CircularProgressIndicator(),
                    ),
                    Positioned(
                      top: Dimensions.height10 * 4.5,
                      left: Dimensions.height10 * 2,
                      right: Dimensions.height10 * 2,
                      child: InkWell(
                        onTap: () {
                          Get.dialog(SearchLocationPage(
                              mapController: _mapController));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.height10,
                          ),
                          height: Dimensions.height10 * 5,
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius:
                                BorderRadius.circular(Dimensions.height10),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: Dimensions.height10 * 2.5,
                                color: AppColors.yellowColor,
                              ),
                              Expanded(
                                child: Text(
                                  "${locationController.pickPlacemark.name ?? ''}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Dimensions.height10 * 1.6,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.height10,
                              ),
                              Icon(
                                Icons.search,
                                size: Dimensions.height10 * 2.5,
                                color: AppColors.yellowColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: Dimensions.height10 * 8,
                      left: Dimensions.height10 * 2,
                      right: Dimensions.height10 * 2,
                      child: locationController.isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : CustomButton(
                              buttonText: locationController.inZone
                                  ? widget.fromAddressPage
                                      ? "Pick Address"
                                      : "Pick Location"
                                  : "Service is not available in your area!",
                              onPressed: (locationController.buttonDisabled ||
                                      locationController.loading)
                                  ? null
                                  : () {
                                      if (locationController
                                                  .pickPosition.latitude !=
                                              0 &&
                                          locationController
                                                  .pickPlacemark.name !=
                                              null) {
                                        if (widget.fromAddressPage) {
                                          widget.googleMapController.moveCamera(
                                              CameraUpdate.newCameraPosition(
                                                  CameraPosition(
                                                      target: LatLng(
                                                          locationController
                                                              .pickPosition
                                                              .latitude,
                                                          locationController
                                                              .pickPosition
                                                              .longitude))));
                                          locationController
                                              .setAddAddressData();
                                          Get.toNamed(
                                              RouteHelper.getAddAddressPage());
                                        }
                                      }
                                    },
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
