import 'package:derash/veiws/allergies.dart';
import 'package:derash/veiws/bottom_nav.dart';
import 'package:derash/veiws/current_medication.dart';
import 'package:derash/veiws/donate_blood.dart';
import 'package:derash/veiws/donate_to_cc.dart';
import 'package:derash/veiws/emergency_contacts.dart';
import 'package:derash/veiws/emergency_services.dart';
import 'package:derash/veiws/medical_condition.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Derash',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
        // fontFamily: "OverpassRegular",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const BottomNav(),
      routes: {
        'emergency-services': (context) => EmergencyServices(),
        'donate-to-cc': (context) => DonateToCc(),
        'donate-blood': (context) => DonateBlood(),
        'emergency-contacts': (context) => EmergencyContacts(),
        'allergies': (context) => Allergies(),
        'medical-conditions': (context) => MedicalConditions(),
        'current-medications': (context) => CurrentMedication(),
      },
    );
  }
}
