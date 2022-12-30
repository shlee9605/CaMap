// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/services.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:csv/csv.dart';
import 'custom_location.dart';

class SmokeCanData {
  //for smoking area
  static List<List<dynamic>>? csvData;

  //read csv data from assets/areas
  static Future<List<List<dynamic>>> processCsv() async {
    var result = await rootBundle.loadString(
      "assets/areas/Seocho_SmokeCan.csv",
    );
    return const CsvToListConverter().convert(result, eol: "\n");
  }

  //return as list of custom marker, using csv data
  static Future<List<CustomMarker>> markers() async {
    List<AreaType> areas = [];
    csvData = await processCsv();

    //add in area list using which gives you areatype
    for (List<dynamic> lt in csvData!) {
      areas.add(SmokeCan(aid: lt[0], location: LatLng(lt[1], lt[2])));
    }

    List<CustomMarker> temp = [];

    //create custom marker list using areatype
    for (AreaType st in areas) {
      temp.add(CustomMarker.fromMyAreas(st));
    }

    return temp;
  }
}
