import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mahool/animations/bottomAnimation.dart';

class MapsScreen extends StatefulWidget {
  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  LatLng latLng;
  double pLat,pLong;
  Iterable markers = [];
  //String API_KEY = apikey;

  String address;
  bool loading=true;CameraPosition _position;
  List<Marker> _markers = <Marker>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getlocation();
  }
  getlocation() async {

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    setState(()  {
      latLng=LatLng(position.latitude,position.longitude);
      var address  = addresses.first;
      print(address.addressLine);
      this.address=address.addressLine;
      loading=false;
      _markers.add(
        Marker(
          markerId: MarkerId('1'),
          position: latLng,
          draggable: true,
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WidgetAnimator(
            Container(
              color: Colors.white,
              height: 450,
              child: GoogleMap(
                //onMapCreated: _onMapCreated(),
                markers: Set.from(
                  markers,
                ),
                initialCameraPosition: latLng == null? CameraPosition(target: LatLng(24.7976208,67.0328722)) : CameraPosition(target: latLng, zoom: 14.0),
                mapType: MapType.terrain,
                myLocationEnabled: true,
              ),
            ),
          ),
          WidgetAnimator(
            Align(
            alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.recommend),
                    ),
                    title: Text("Organization Name"),
                    subtitle: Text("Location of the place"),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
