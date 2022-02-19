import 'package:derash/helper_functions/boxes.dart';
import 'package:derash/models/emergency.dart';
import 'package:derash/veiws/emergency_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class EmergencyPage extends StatefulWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  State<EmergencyPage> createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  final List gridItems = [
    {
      'name': 'Allergy',
      'icon': 'assets/images/allergy.png',
    }
  ];

  @override
  void dispose() {
    Hive.box<Emergency>('emergencies').close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Emergency',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<Box<Emergency>>(
                valueListenable: Boxes.getEmergencies().listenable(),
                builder: (context, box, _) {
                  final emergencies = box.values.toList().cast<Emergency>();
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: emergencies.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (ctx) {
                              return EmergencyDetail(
                                  emergency: emergencies[index]);
                            }));
                          },
                          child: Card(
                            elevation: 2,
                            child: GridTile(
                              footer: Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 7, top: 10),
                                child: Text(
                                  emergencies[index].name,
                                  style: const TextStyle(fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 55),
                                child: Image.asset(
                                  emergencies[index].iconUrl,
                                  fit: BoxFit.scaleDown,

                                  width: 20,

                                  //  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}
