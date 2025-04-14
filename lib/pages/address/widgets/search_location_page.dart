import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:food_delivery/controllers/location_controller.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_google_maps_webservices/places.dart';

class SearchLocationPage extends StatelessWidget {
  final GoogleMapController mapController;
  const SearchLocationPage({super.key, required this.mapController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.height10),
      alignment: Alignment.topCenter,
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.height10)),
        child: SizedBox(
          width: Dimensions.screenWidth,
          child: TypeAheadField<Prediction>(
            builder: (context, controller, focusNode) {
              return TextField(
                controller: controller,
                focusNode: focusNode,
                textInputAction: TextInputAction.search,
                autofocus: true,
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                  hintText: "Search location",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  hintStyle: TextStyle(
                    fontSize: Dimensions.height10 * 1.6,
                    color: Colors.grey,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    size: Dimensions.height10 * 2.6,
                    color: Colors.black,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: Dimensions.height10,
                    horizontal: Dimensions.height10,
                  ),
                  filled: true,
                ),
              );
            },
            itemBuilder: (context, Prediction suggestion) {
              return ListTile(
                leading: Icon(
                  Icons.location_on,
                  size: Dimensions.height10 * 2.6,
                  color: Colors.black,
                ),
                title: Text(
                  suggestion.description!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: Dimensions.height10 * 1.6,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              );
            },
            suggestionsCallback: (pattern) async {
              List<Prediction> results = await Get.find<LocationController>()
                  .searchLocation(context, pattern);
              return results;
            },
            onSelected: (Prediction value) async{
              return await Get.find<LocationController>()
                  .setLocation(value.placeId!, value.description!, mapController);
            },
          ),
        ),
      ),
    );
  }
}
