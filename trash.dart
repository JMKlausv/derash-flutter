



 // double calculateDistance(lat1, lon1, lat2, lon2) {
  //   var radlat1 = pi * lat1 / 180;
  //   var radlat2 = pi * lat2 / 180;
  //   var theta = lon1 - lon2;
  //   var radtheta = pi * theta / 180;
  //   var dist = sin(radlat1) * sin(radlat2) +
  //       cos(radlat1) * cos(radlat2) * cos(radtheta);
  //   dist = acos(dist);
  //   dist = dist * 180 / pi;
  //   dist = dist * 60 * 1.1515;
  //   dist = dist * 1.609344;
  //   return dist;
  // }

  // calc() async {
  //   //LocationPermission permission = await Geolocator.requestPermission();
  //   LocationPermission permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied ||
  //       permission == LocationPermission.unableToDetermine) {
  //     permission = await Geolocator.requestPermission();
  //   }
  //   if (permission == LocationPermission.always ||
  //       permission == LocationPermission.whileInUse) {
  //     Position? userLocation = await Geolocator.getCurrentPosition();
  //     String dista = Map().distance(
  //         userLocation.latitude,
  //         userLocation.longitude,
  //         showLocation.latitude,
  //         showLocation.longitude);
  //     setState(() {
  //       dist = dista;
  //     });

      // print(userLocation);
      //   // double dist = calculateDistance(
      //   //     showLocation.latitude,
      //   //     showLocation.longitude,
      //   //     userLocation!.latitude,
      //   //     userLocation.longitude);
      // String googleAPiKey = "AIzaSyB-9bQTibo6-GFFEUdyao16sGyZudCakoE";
      // Dio dio = Dio();
      // Response response = await dio.get(
      //     "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins= ${showLocation.latitude},${showLocation.longitude}&destinations=${userLocation.latitude},${userLocation.longitude}&key=$googleAPiKey");
      // print(
      //     'anaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      // print(response.data);
 //   }
    // double dist = response.data as double ;
    // setState(() {
    //   distance = dist;
    //   print('what is ur probleeemmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm');
    //   print(distance);
    //   print('yyyyyyyyyyyyyyy');
    //   print(dist);
    // });
 // }
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
