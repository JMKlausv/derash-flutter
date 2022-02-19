import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class DonateBlood extends StatelessWidget {
  const DonateBlood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String phone = '+251983424242';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/national_blood_bank.png',
                ),
              ),
              const Text(
                'National Blood Bank Service',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'National Blood Bank Service is a non profit governmental organization established with core function of community mobilization and education on voluntary blood donation, blood collection, laboratory processing, testing and production of blood; distribute to health facilities; promote appropriate clinical use of blood.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Social',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 2,
                child: ListTile(
                  onTap: () {
                    launch('https://www.facebook.com/ENBBS/');
                  },
                  leading: const Icon(
                    Icons.facebook,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    'Facebook',
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 2,
                child: ListTile(
                  onTap: () {
                    launch('tel:$phone');
                  },
                  leading: const Icon(
                    Icons.phone,
                    color: Colors.green,
                  ),
                  title: Text(
                    phone,
                    style: const TextStyle(
                      fontSize: 23,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
