// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:flutter/material.dart';

//for different areatype, set different name and icon image
abstract class AreaType {
  final String aid = "";
  final String name = "";
  final String markerImage = "";
  final Color color = const Color.fromARGB(255, 255, 255, 255);
  final LatLng location = const LatLng(0, 0);
}

class SmokingArea implements AreaType {
  @override
  final String aid;

  @override
  final String name = "흡연구역";

  @override
  final String markerImage = "assets/markers/smoking.png";

  @override
  final Color color = const Color.fromARGB(255, 255, 0, 0);

  @override
  final LatLng location;

  SmokingArea({
    required this.aid,
    required this.location,
  });
}

class TrashCan implements AreaType {
  @override
  final String aid;

  @override
  final String name = "쓰레기통";

  @override
  final String markerImage = "assets/markers/trash.png";

  @override
  final Color color = const Color.fromARGB(116, 0, 68, 177);

  @override
  final LatLng location;

  TrashCan({
    required this.aid,
    required this.location,
  });
}

class SmokeCan implements AreaType {
  @override
  final String aid;

  @override
  final String name = "담배꽁초수거함";

  @override
  final String markerImage = "assets/markers/smoke.png";

  @override
  final Color color = const Color.fromARGB(255, 0, 88, 15);

  @override
  final LatLng location;

  SmokeCan({
    required this.aid,
    required this.location,
  });
}

//custom my marker extending marker naver plugin
class CustomMarker extends Marker {
  final AreaType area;

  CustomMarker(
      {required this.area,
      required super.position,
      super.width = 30,
      super.height = 30})
      : super(
            markerId: area.aid,
            captionText: area.name,
            iconTintColor: area.color);

  //make marker when areatype is given
  factory CustomMarker.fromMyAreas(AreaType area) =>
      CustomMarker(area: area, position: area.location);

  //create image using naver plugin overlayimage
  Future<void> createImage(BuildContext context) async {
    icon = await OverlayImage.fromAssetImage(
        assetName: area.markerImage, context: context);
  }
}
