import 'package:derash/helper_functions/boxes.dart';
import 'package:derash/l10n/l10n.dart';
import 'package:derash/models/emergency.dart';
import 'package:derash/providers/locale_provider.dart';
import 'package:derash/veiws/emergency_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class EmergencyPage extends StatefulWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  State<EmergencyPage> createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  // final List gridItems = [
  //   {
  //     'name': 'Allergy',
  //     'icon': 'assets/images/allergy.png',
  //   }
  // ];

  @override
  void dispose() {
    Hive.box<Emergency>('emergencies').close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Locale locale = Provider.of<LocalProvider>(context).locale;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              AppLocalizations.of(context)!.emergency,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<Box<Emergency>>(
                valueListenable: Boxes.getEmergencies().listenable(),
                builder: (context, box, _) {
                  List<Emergency> emergencies = [];

                  if (locale == L10n.all[0]) {
                    emergencies = box.values
                        .toList()
                        .cast<Emergency>()
                        .where((element) => element.language == 'en')
                        .toList();
                  } else if (locale == L10n.all[1]) {
                    emergencies = box.values
                        .toList()
                        .cast<Emergency>()
                        .where((element) => element.language == 'am')
                        .toList();
                  } else if (locale == L10n.all[2]) {
                    emergencies = box.values
                        .toList()
                        .cast<Emergency>()
                        .where((element) => element.language == 'om')
                        .toList();
                  } else {
                    emergencies = box.values
                        .toList()
                        .cast<Emergency>()
                        .where((element) => element.language == 'en')
                        .toList();
                  }

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
