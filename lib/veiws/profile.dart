import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.red,
              radius: 50,
              child: Icon(
                Icons.medical_services_outlined,
                size: 50,
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Your Name',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'sex - ',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  'Age - ',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  'Blood group - ',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                'Edit Your profile',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              )),
          Divider(
            color: Colors.red.shade700,
            thickness: 1,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                Card(
                  elevation: 1,
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed('emergency-contacts');
                    },
                    leading: const Icon(
                      Icons.people_alt,
                      size: 30,
                      color: Colors.red,
                    ),
                    title: const Text(
                      'Emergency contacts',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Card(
                  elevation: 1,
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed('allergies');
                    },
                    leading: Image.asset(
                      'assets/images/allergy.png',
                      width: 40,
                    ),
                    title: const Text(
                      'Allergies',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Card(
                  elevation: 1,
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed('medical-conditions');
                    },
                    leading: const Icon(
                      Icons.replay,
                      color: Colors.red,
                      size: 30,
                    ),
                    title: const Text(
                      'Medical Conditions',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Card(
                  elevation: 1,
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed('current-medications');
                    },
                    leading: const Icon(
                      Icons.medication_rounded,
                      color: Colors.red,
                      size: 30,
                    ),
                    title: const Text(
                      'Current Medications',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
