import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_interface/flutter_osm_interface.dart';

import '../types/types.dart';

///  [BaseMapController] : base controller for osm flutter
///
///
/// [initMapWithUserPosition] : (bool) if is true, map will show your current location
///
/// [initPosition] : (GeoPoint) if it isn't null, the map will be pointed at this position
abstract class IBaseMapController {
  final bool initMapWithUserPosition;
  final GeoPoint? initPosition;
  final BoundingBox? areaLimit;

  late ValueNotifier<GeoPoint?> _listenerMapLongTapping = ValueNotifier(null);
  late ValueNotifier<GeoPoint?> _listenerMapSingleTapping = ValueNotifier(null);
  late ValueNotifier<bool> _listenerMapIsReady = ValueNotifier(false);

  ValueListenable<GeoPoint?> get listenerMapLongTapping =>
      _listenerMapLongTapping;

  ValueListenable<GeoPoint?> get listenerMapSingleTapping =>
      _listenerMapSingleTapping;

  ValueListenable<bool> get listenerMapIsReady => _listenerMapIsReady;

  IBaseMapController({
    this.initMapWithUserPosition = true,
    this.initPosition,
    this.areaLimit = const BoundingBox.world(),
  }) : assert(initMapWithUserPosition || initPosition != null);

  void init();

  void dispose() {
    // _listenerMapLongTapping.dispose();
    // _listenerMapSingleTapping.dispose();
    // _listenerMapIsReady.dispose();
  }
}

extension setLiteners on BaseMapController {
  void setValueListenerMapLongTapping(GeoPoint p) {
    _listenerMapLongTapping.value = p;
  }

  void setValueListenerMapSingleTapping(GeoPoint p) {
    _listenerMapSingleTapping.value = p;
  }

  void setValueListenerMapIsReady(bool isReady) {
    _listenerMapIsReady.value = isReady;
  }
}
