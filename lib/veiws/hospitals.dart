import 'package:derash/helper_functions/boxes.dart';
import 'package:derash/models/hospital.dart';
import 'package:derash/veiws/hospital_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Hospitals extends StatelessWidget {
  const Hospitals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              AppLocalizations.of(context)!.hospital_near_by,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          ValueListenableBuilder<Box<Hospital>>(
              valueListenable: Boxes.getHospitals().listenable(),
              builder: (context, box, _) {
                final hospitals = box.values.cast<Hospital>().toList();
                return Expanded(
                    child: ListView.builder(
                        itemCount: hospitals.length,
                        itemBuilder: (context, index) {
                          return Card(
                              elevation: 2,
                              child: ListTile(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (ctx) {
                                    return HospitalDetail(
                                        hospital: hospitals[index]);
                                  }));
                                },
                                title: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 7),
                                  child: Text(
                                    hospitals[index].name,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                trailing: const Icon(
                                  Icons.call,
                                  color: Colors.green,
                                ),
                                subtitle: const Text('2.14 km away'),
                              ));
                        }));
              })
        ],
      ),
    );
  }
}
