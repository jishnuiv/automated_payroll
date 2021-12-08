import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart'as http;
class UserLocation extends StatefulWidget {
  const UserLocation({Key key}) : super(key: key);

  @override
  _UserLocationState createState() => _UserLocationState();
}

class _UserLocationState extends State<UserLocation> {
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _userLocation;

  Future<void> _getUserLocation() async {
    Location location = new Location();

    // Check if location service is enable
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final _locationData = await location.getLocation();
    setState(() {
      _userLocation = _locationData;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: _getUserLocation, child: Text('Check Location')),
            SizedBox(height: 25),
            _userLocation != null
                ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Your latitude: ${_userLocation.latitude}'),
                  SizedBox(width: 10),
                  Text('Your longtitude: ${_userLocation.longitude}')
                ],
              ),
            )
                : Container()
          ],
        ),
      ),
    );

  }
}
