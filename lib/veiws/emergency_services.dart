import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
                      leading: Image.asset(
                        'assets/images/red_cross.png',
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
                      leading: Image.asset(
                        'assets/images/red_cross.png',
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
                      leading: Image.asset(
                        'assets/images/burn.png',
                        color: Colors.red,
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
