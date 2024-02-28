import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapView extends StatefulWidget {
  MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {

  MapboxMap? mapboxMap;

  _onMapCreated(MapboxMap mapboxMap) {
    this.mapboxMap = mapboxMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MapWidget(
          cameraOptions: CameraOptions(center:Point(coordinates: Position(10.227168,36.781019)).toJson(),zoom: 14.0),
          key: const ValueKey("mapWidget"),
          resourceOptions: ResourceOptions(accessToken: "pk.eyJ1IjoiYXJjYW5hc29mdCIsImEiOiJjbHJ0aXQ1b2kwMXR0MmpudTF6d2FmbGUzIn0.YRntgQIe61l6LOpaAB-1eg"),
          onMapCreated: _onMapCreated,
        ));
  }
}
