import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                    color: Colors.blue.shade200,
                    child: Image.asset(
                      'assets/images/logo.png',

                      // color: Colors.blue,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Blue Health Ethiopia',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Our vision is to be an influential healthcare leader in creating a skilled community through easily accessible knowledge in preventive medicine.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ]),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            Divider(
              color: Colors.redAccent.shade700,
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
                        Navigator.of(context).pushNamed('emergency-services');
                      },
                      leading: const Icon(
                        Icons.people_alt,
                        size: 30,
                        color: Colors.red,
                      ),
                      title: const Text(
                        'Emergency services',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 1,
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).pushNamed('donate-to-cc');
                      },
                      leading: Image.asset(
                        'assets/images/CCE.png',
                        width: 40,
                      ),
                      title: const Text(
                        'Donate to Cardiac Center Ethiopia',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 1,
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).pushNamed('donate-blood');
                      },
                      leading: const Icon(
                        Icons.bloodtype,
                        color: Colors.red,
                        size: 30,
                      ),
                      title: const Text(
                        'Donate Blood',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 1,
                    child: ListTile(
                      onTap: () {},
                      leading: const Icon(
                        Icons.medical_services,
                        color: Colors.red,
                        size: 30,
                      ),
                      title: const Text(
                        'About First Aid',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
