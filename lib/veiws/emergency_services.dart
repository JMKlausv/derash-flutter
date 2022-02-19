import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class EmergencyServices extends StatelessWidget {
  const EmergencyServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Services'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Emergency Services',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'In case of emergency click one of the ambulance services below to dial and get help.',
              style: TextStyle(
                fontSize: 21,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                children: [
                  Card(
                    elevation: 2,
                    child: ListTile(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return SimpleDialog(
                                titlePadding: const EdgeInsets.only(
                                    top: 20, left: 15, right: 15, bottom: 0),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                title: const Text(
                                  "MEICIP for different locations",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                children: [
                                  const Text(
                                    'click on the locations to call',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Card(
                                    child: ListTile(
                                      onTap: () {
                                        UrlLauncher.launch('tel:7605');
                                      },
                                      leading:
                                          const Icon(Icons.dashboard_outlined),
                                      title: const Text(
                                        'Harar',
                                        style: TextStyle(
                                          fontSize: 23,
                                        ),
                                      ),
                                      subtitle: const Text(
                                        'Click to dail',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      trailing: const Icon(
                                        Icons.phone,
                                        color: Colors.green,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: ListTile(
                                      onTap: () {
                                        UrlLauncher.launch('tel:7844');
                                      },
                                      leading:
                                          const Icon(Icons.dashboard_outlined),
                                      title: const Text(
                                        'Bahirdar',
                                        style: TextStyle(
                                          fontSize: 23,
                                        ),
                                      ),
                                      subtitle: const Text(
                                        'Click to dail',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      trailing: const Icon(
                                        Icons.phone,
                                        color: Colors.green,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: ListTile(
                                      onTap: () {
                                        UrlLauncher.launch('tel:7337');
                                      },
                                      leading:
                                          const Icon(Icons.dashboard_outlined),
                                      title: const Text(
                                        'Hawassa',
                                        style: TextStyle(
                                          fontSize: 23,
                                        ),
                                      ),
                                      subtitle: const Text(
                                        'Click to dail',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      trailing: const Icon(
                                        Icons.phone,
                                        color: Colors.green,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: ListTile(
                                      onTap: () {
                                        UrlLauncher.launch('tel:6238');
                                      },
                                      leading:
                                          const Icon(Icons.dashboard_outlined),
                                      title: const Text(
                                        'Jimma',
                                        style: TextStyle(
                                          fontSize: 23,
                                        ),
                                      ),
                                      subtitle: const Text(
                                        'Click to dail',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      trailing: const Icon(
                                        Icons.phone,
                                        color: Colors.green,
                                        size: 40,
                                      ),
                                    ),
                                  )
                                ],
                              );
                            });
                      },
                      leading: Image.asset(
                        'assets/images/red_cross.png',
                        width: 40,
                      ),
                      title: const Text(
                        'MEICIP',
                        style: TextStyle(
                          fontSize: 23,
                        ),
                      ),
                      subtitle: const Text(
                        'Click to dail',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      trailing: const Icon(
                        Icons.phone,
                        color: Colors.green,
                        size: 40,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 2,
                    child: ListTile(
                      onTap: () {
                        UrlLauncher.launch('tel:907');
                      },
                      leading: Image.asset(
                        'assets/images/red_cross.png',
                        width: 40,
                      ),
                      title: const Text(
                        'EMS',
                        style: TextStyle(
                          fontSize: 23,
                        ),
                      ),
                      subtitle: const Text(
                        'Click to dail',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      trailing: const Icon(
                        Icons.phone,
                        color: Colors.green,
                        size: 40,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 2,
                    child: ListTile(
                      onTap: () {
                        UrlLauncher.launch('tel:939');
                      },
                      leading: Image.asset(
                        'assets/images/fire.png',
                        width: 45,
                      ),
                      title: const Text(
                        'Fire Department',
                        style: TextStyle(
                          fontSize: 23,
                        ),
                      ),
                      subtitle: const Text(
                        'Click to dail',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      trailing: const Icon(
                        Icons.phone,
                        color: Colors.green,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
