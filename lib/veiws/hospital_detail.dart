import 'package:derash/helper_functions/boxes.dart';
import 'package:derash/models/hospital.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
//import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:haversine/haversine.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:great_circle_distance2/great_circle_distance2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalDetail extends StatefulWidget {
  final Hospital hospital;
  const HospitalDetail({Key? key, required this.hospital}) : super(key: key);

  @override
  State<HospitalDetail> createState() => _HospitalDetailState();
}

class _HospitalDetailState extends State<HospitalDetail> {
  final Completer<GoogleMapController> _controller = Completer();
  final box = Boxes.getHospitals();

  late LatLng showLocation;
  late double distance = 111111;

  Set<Marker> markers = {};
  double getDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var radlat1 = pi * lat1 / 180;
    var radlat2 = pi * lat2 / 180;
    var theta = lon1 - lon2;
    var radtheta = pi * theta / 180;
    var dist = sin(radlat1) * sin(radlat2) +
        cos(radlat1) * cos(radlat2) * cos(radtheta);
    dist = acos(dist);
    dist = dist * 180 / pi;
    dist = dist * 60 * 1.1515;
    dist = dist * 1.609344;
    return dist;
  }

  calc() async {
    // //LocationPermission permission = await Geolocator.requestPermission();
    // LocationPermission permission = await Geolocator.checkPermission();
    // if (permission == LocationPermission.denied ||
    //     permission == LocationPermission.unableToDetermine) {
    //   permission = await Geolocator.requestPermission();
    // }
    // if (permission == LocationPermission.always ||
    //     permission == LocationPermission.whileInUse) {
    Position? userLocation = await Geolocator.getLastKnownPosition();
    //   double dist = calculateDistance(
    //       showLocation.latitude,
    //       showLocation.longitude,
    //       userLocation!.latitude,
    //       userLocation.longitude);
    Dio dio = Dio();
    Response response = await dio.get(
        "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins= ${showLocation.latitude},${showLocation.longitude}&destinations=${userLocation!.latitude},${userLocation.longitude}&key=AIzaSyB4gWIsaYU2vgYvc3xDxsWIVXHSqoOR0vA");
    print(
        'anaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    print(response.data);
    // double dist = response.data as double ;
    // setState(() {
    //   distance = dist;
    //   print('what is ur probleeemmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm');
    //   print(distance);
    //   print('yyyyyyyyyyyyyyy');
    //   print(dist);
    // });
  }
  // calculateDistance() async {
  //   Position? userLocation = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.bestForNavigation);
  //   var gcd = GreatCircleDistance.fromDegrees(
  //       latitude1: showLocation.latitude,
  //       longitude1: showLocation.longitude,
  //       latitude2: userLocation.latitude,
  //       longitude2: userLocation.longitude);
  //   setState(() {
  //     distance = gcd.vincentyDistance();
  //   });
  // }

  // calculateDistance() async {
  //   LocationPermission permission = await Geolocator.requestPermission();
  //   Position? userLocation = await Geolocator.getLastKnownPosition();

  //   if (userLocation != null) {
  //     // final distanceImMeter = Geolocator.distanceBetween(
  //     //   userLocation.latitude,
  //     //   userLocation.longitude,
  //     //   showLocation.latitude,
  //     //   showLocation.latitude,
  //     // );
  //     // var calculatedDistance = distanceImMeter.round().toInt();
  //     final harvesine = Haversine.fromDegrees(
  //         latitude1: userLocation.latitude,
  //         longitude1: userLocation.longitude,
  //         latitude2: showLocation.latitude,
  //         longitude2: showLocation.longitude);

  //     setState(() {
  //       distance = harvesine.distance();
  //       print("distance isssssssssssssssssssss");
  //       print(distance);
  //     });
  //   }
//     PolylinePoints polylinePoints = PolylinePoints();

//     String googleAPiKey = "AIzaSyCSNmXbVydhv8qLoeNLtvmqY9zOy1eR5J4";
//  //polylines to show direction
//     List<LatLng> polylineCoordinates = [];

//     LocationPermission permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.whileInUse ||
//         permission == LocationPermission.always) {
//       Position? userLocation = await Geolocator.getLastKnownPosition();

//       if (userLocation != null) {
//         PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//           googleAPiKey,
//           PointLatLng(showLocation.latitude, showLocation.longitude),
//           PointLatLng(userLocation.latitude, userLocation.longitude),
//           travelMode: TravelMode.driving,
//         );

//         if (result.points.isNotEmpty) {
//           result.points.forEach((PointLatLng point) {
//             polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//           });
//         } else {
//           print(result.errorMessage);
//         }

// //polulineCoordinates is the List of longitute and latidtude.
//         double totalDistance = 0;
//         for (var i = 0; i < polylineCoordinates.length - 1; i++) {
//           totalDistance += getDistance(
//               polylineCoordinates[i].latitude,
//               polylineCoordinates[i].longitude,
//               polylineCoordinates[i + 1].latitude,
//               polylineCoordinates[i + 1].longitude);
//         }

//         setState(() {
//           distance = totalDistance;
//         });
//       }
//     }
  // }

  @override
  initState() {
    showLocation = LatLng(widget.hospital.location['latitude'],
        widget.hospital.location['longitude']);
    markers.add(Marker(
      //add marker on google map
      markerId: MarkerId(showLocation.toString()),
      position: showLocation, //position of marker
      infoWindow: const InfoWindow(
        //popup info
        title: 'Zenbaba general hospital',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    calc();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('zenbaba general hospital'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.blueGrey,
                height: MediaQuery.of(context).size.height * 0.4,
                child: GoogleMap(
                  markers: markers,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  initialCameraPosition: CameraPosition(
                    target: showLocation,
                    zoom: 35.0,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'More info',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView(
                  children: [
                    Card(
                      elevation: 2,
                      child: ListTile(
                        onTap: () async {
                          await launch('tel:${widget.hospital.phone}');
                        },
                        leading: const Icon(
                          Icons.phone,
                          color: Colors.green,
                          size: 35,
                        ),
                        title: Text(
                          widget.hospital.phone,
                          style: const TextStyle(fontSize: 22),
                        ),
                        subtitle: const Text(
                          'Click to dial',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: ListTile(
                        onTap: () async {
                          String googleUrl =
                              'https://www.google.com/maps/search/?api=1&query=${widget.hospital.location['latitude']},${widget.hospital.location['longitude']}';
                          await launch(googleUrl);
                        },
                        leading: Image.asset(
                          'assets/images/pin_hospital.png',
                          width: 30,
                        ),
                        title: Text(
                          '$distance km away',
                          style: const TextStyle(fontSize: 22),
                        ),
                        subtitle: const Text(
                          'Click to open on google maps',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: ListTile(
                        onTap: () async {
                          await launch(
                              'https://www.facebook.com/${widget.hospital.facebook}/');
                        },
                        leading: Image.asset(
                          'assets/images/facebook.png',
                          width: 30,
                        ),
                        title: Text(
                          widget.hospital.facebook,
                          style: const TextStyle(fontSize: 22),
                        ),
                        subtitle: const Text(
                          'Click to open page',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: ListTile(
                        onTap: () async {
                          final userName =
                              widget.hospital.telegram.substring(1);
                          await launch('https://t.me/$userName');
                        },
                        leading: Image.asset(
                          'assets/images/telegram.png',
                          width: 30,
                        ),
                        title: Text(
                          widget.hospital.telegram,
                          style: TextStyle(fontSize: 22),
                        ),
                        subtitle: const Text(
                          'Click to open page',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
