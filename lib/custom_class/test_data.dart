// ignore_for_file: import_of_legacy_library_into_null_safe

//앞으로 마커가 많아질 것을 대비해 테스트용 데이터셋입니다.

import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'custom_location.dart';

class TestData {
  static final List<AreaType> myareas = [
    SmokingArea(aid: "1-1", location: const LatLng(37.50375605, 127.0241095)),
    SmokingArea(aid: "1-2", location: const LatLng(37.48276664, 127.0349496)),
    SmokingArea(aid: "1-3", location: const LatLng(37.48124455, 127.0361898)),
    TrashCan(aid: "2-1", location: const LatLng(37.5045961, 127.0250184)),
    TrashCan(aid: "2-2", location: const LatLng(37.5057948, 127.0312981)),
  ];

  static List<CustomMarker> markers() {
    List<CustomMarker> list = [];
    for (AreaType st in TestData.myareas) {
      list.add(CustomMarker.fromMyAreas(st));
    }

    return list;
  }
}
