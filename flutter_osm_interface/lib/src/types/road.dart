import 'package:flutter/material.dart';

import 'marker.dart';

enum RoadType {
  car,
  foot,
  bike,
}

class Road {
  final Color roadColor;
  final MarkerIcon? startIcon;
  final MarkerIcon? endIcon;
  final MarkerIcon? middleIcon;

  Road({
    this.roadColor = Colors.blue,
    this.startIcon,
    this.middleIcon,
    this.endIcon,
  });
}

class RoadOption {
  final Color? roadColor;
  final int? roadWidth;
  final bool showMarkerOfPOI;

  RoadOption({
    this.roadColor,
    this.roadWidth,
    this.showMarkerOfPOI = false,
  });

  const RoadOption.empty()
      : this.roadWidth = null,
        this.roadColor = null,
        this.showMarkerOfPOI = false;
}

class RoadInfo {
  final double? distance;
  final double? duration;

  RoadInfo({
    this.distance,
    this.duration,
  });

  RoadInfo.fromMap(Map map)
      : this.duration = map["duration"],
        this.distance = map["distance"];
}
