import 'package:derash/helper_functions/boxes.dart';
import 'package:derash/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<User>>(
        valueListenable: Boxes.getUser().listenable(),
        builder: (context, box, _) {
          final user = box.values.cast<User>();

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    child: Image.asset(
                      'assets/images/med_kit.png',
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      user.isEmpty
                          ? const Text(
                              'Your Name',
                              style: TextStyle(fontSize: 25),
                            )
                          : Text(
                              user.first.userName,
                              style: const TextStyle(fontSize: 25),
                            ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'sex - ${user.isNotEmpty ? user.first.sex : ''}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        'Age -  ${user.isNotEmpty ? user.first.age : ''}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        'Blood group -  ${user.isNotEmpty ? user.first.bloodGroup : ''}',
                        style: const TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('edit-profile');
                    },
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
                            Navigator.of(context)
                                .pushNamed('emergency-contacts');
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
                            'assets/images/allergies_icon.png',
                            width: 30,
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
                            Navigator.of(context)
                                .pushNamed('medical-conditions');
                          },
                          leading: Image.asset(
                            'assets/images/med_history.png',
                            width: 25,
                            height: 25,
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
                            Navigator.of(context)
                                .pushNamed('current-medications');
                          },
                          leading: Image.asset(
                            'assets/images/medication.png',
                            width: 30,
                            height: 30,
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
        });
  }
}
