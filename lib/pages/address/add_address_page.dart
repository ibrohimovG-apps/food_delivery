import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/controllers/location_controller.dart';
import 'package:food_delivery/controllers/user_controller.dart';
import 'package:food_delivery/models/address_model.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactPersonName = TextEditingController();
  final TextEditingController _contactPersonNumber = TextEditingController();
  late bool _isLogged;
  CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(
      40.36627113717328,
      71.77362535736373,
    ),
    zoom: 17,
  );
  late LatLng _initialPosition = LatLng(
    40.36627113717328,
    71.77362535736373,
  );

  @override
  void initState() {
    super.initState();
    _isLogged = Get.find<AuthController>().userHasLoggedIn();
    if (_isLogged && Get.find<UserController>().userModel == null) {
      Get.find<UserController>().getUserInfo();
    }
    if (Get.find<LocationController>().addressList.isNotEmpty) {
      if (Get.find<LocationController>().getUserAddressFromLocalStorage() ==
          "") {
        Get.find<LocationController>()
            .saveUserAddress(Get.find<LocationController>().addressList.last);
      }
      Get.find<LocationController>().getUserAddress();
      _cameraPosition = CameraPosition(
        target: LatLng(
          double.parse(Get.find<LocationController>().getAddress["latitude"]),
          double.parse(Get.find<LocationController>().getAddress["longitude"]),
        ),
      );
      _initialPosition = LatLng(
        double.parse(Get.find<LocationController>().getAddress["latitude"]),
        double.parse(Get.find<LocationController>().getAddress["longitude"]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address page"),
        backgroundColor: AppColors.mainColor,
      ),
      body: GetBuilder<UserController>(
        builder: (userController) {
          if (userController.userModel != null &&
              _contactPersonName.text.isEmpty) {
            _contactPersonName.text = '${userController.userModel?.name}';
            _contactPersonNumber.text = '${userController.userModel?.phone}';
            if (Get.find<LocationController>().addressList.isNotEmpty) {
              _addressController.text =
                  Get.find<LocationController>().getUserAddress().address;
            }
          }
          return GetBuilder<LocationController>(
            builder: (locationController) {
              _addressController.text =
                  '${locationController.placemark.name ?? ''}'
                  '${locationController.placemark.locality ?? ''}'
                  '${locationController.placemark.postalCode ?? ''}'
                  '${locationController.placemark.country ?? ''}';
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: Dimensions.height10 * 20,
                      width: Dimensions.screenWidth,
                      margin: EdgeInsets.all(
                        Dimensions.height10 * 0.5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 2,
                          color: AppColors.mainColor,
                        ),
                      ),
                      child: Stack(
                        children: [
                          GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: _initialPosition,
                              zoom: 17,
                            ),
                            zoomControlsEnabled: false,
                            compassEnabled: false,
                            indoorViewEnabled: true,
                            mapToolbarEnabled: false,
                            myLocationEnabled: true,
                            onCameraIdle: () {
                              locationController.updatePosition(
                                _cameraPosition,
                                true,
                              );
                            },
                            onCameraMove: ((position) =>
                                _cameraPosition = position),
                            onMapCreated: (GoogleMapController controller) {
                              locationController.setMapController(controller);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height10 * 2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: Dimensions.height10),
                      child: SizedBox(
                        height: Dimensions.height10 * 7,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: locationController.addressTypeList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                locationController.setAddressTypeIndex(index);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.height10 * 2,
                                  vertical: Dimensions.height10,
                                ),
                                margin: EdgeInsets.all(Dimensions.height10),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(
                                          Dimensions.height10 * 0.5),
                                  color: Theme.of(context).cardColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[200]!,
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                    )
                                  ],
                                ),
                                child: Icon(
                                  index == 0
                                      ? Icons.home_filled
                                      : index == 1
                                          ? Icons.work
                                          : Icons.location_on,
                                  color: locationController.addressTypeIndex ==
                                          index
                                      ? AppColors.mainColor
                                      : Theme.of(context).disabledColor,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height10 * 2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: Dimensions.height10 * 2),
                      child: BigText(text: "Delivery Address"),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    AppTextField(
                      text: "Your Address",
                      controller: _addressController,
                      icon: Icons.map,
                      iconColor: AppColors.mainColor,
                    ),
                    SizedBox(
                      height: Dimensions.height10 * 2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: Dimensions.height10 * 2),
                      child: BigText(text: "Contact Name"),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    AppTextField(
                      text: "Your Name",
                      controller: _contactPersonName,
                      icon: Icons.person,
                      iconColor: AppColors.mainColor,
                    ),
                    SizedBox(
                      height: Dimensions.height10 * 2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: Dimensions.height10 * 2),
                      child: BigText(text: "Phone Number"),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    AppTextField(
                      text: "Your Phone Number",
                      controller: _contactPersonNumber,
                      icon: Icons.phone,
                      iconColor: AppColors.mainColor,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: GetBuilder<LocationController>(
        builder: (locationController) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: Dimensions.height10 * 12,
                padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height10 * 2,
                  horizontal: Dimensions.height10 * 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.height10 * 4),
                    topRight: Radius.circular(Dimensions.height10 * 4),
                  ),
                  color: AppColors.buttonBackgroundColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        AddressModel _addressModel = AddressModel(
                          addressType: locationController.addressTypeList[
                              locationController.addressTypeIndex],
                          contactPersonName: _contactPersonName.text,
                          contactPersonNumber: _contactPersonNumber.text,
                          address: _addressController.text,
                          latitude:
                              locationController.position.latitude.toString(),
                          longitude:
                              locationController.position.longitude.toString(),
                        );
                        locationController
                            .addAddress(_addressModel)
                            .then((response) {
                          if (response.isSuccess) {
                            Get.toNamed(RouteHelper.getInitial());
                            Get.snackbar("Address", "Added succesfully");
                          } else {
                            Get.snackbar("Address", "Couldn't save address");
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(Dimensions.height10 * 2),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.height10 * 2),
                          color: AppColors.mainColor,
                        ),
                        child: BigText(
                          text: "Save Address",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
