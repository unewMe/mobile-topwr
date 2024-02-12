import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../config.dart';
import '../repository/building_extra_params_ext.dart';
import '../repository/map_buildings_repo.dart';
import 'map_chosen_pin_contrl.dart';

part "map_widget_controller.g.dart";

@riverpod
class MapWidgetController extends _$MapWidgetController {
  static late final BitmapDescriptor mapMarker;
  static late final BitmapDescriptor activeMapMarker;

  static Future<void> loadMapMarkerAssets() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      MapWidgetConfig.mapMarkerAssetName,
    );
    activeMapMarker = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      MapWidgetConfig.activeMapMarkerAssetName,
    );
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Future<GoogleMapController> build() async {
    return await _controller.future;
  }

  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void selectBuildingMarker(Building building) {
    state.value?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: building.location,
      zoom: MapWidgetConfig.defaultMarkerZoom,
    )));
  }

  void onMarkerTap(Building building) {
    ref.read(mapChosenPinControllerProvider.notifier).toggleBuilding(building);
    if (building.isActive(ref.read)) {
      selectBuildingMarker(building);
    }
  }
}
