import 'package:derash/helper_functions/boxes.dart';
import 'package:derash/models/user.dart';
import 'package:derash/widgets/add_dialogue_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmergencyContacts extends StatelessWidget {
  const EmergencyContacts({Key? key}) : super(key: key);
  // final TextEditingController nameController = TextEditingController();
  addContact(name, phone) async {
    final box = Boxes.getUser();
    if (box.values.isNotEmpty) {
      final user = box.values.first;
      user.emergencyContacts.add({'name': name, 'phone': phone});
      await user.save();
    } else {
      final newUser = User()
        ..userName = ''
        ..age = ''
        ..sex = -1
        ..bloodGroup = ''
        ..currentMedications = []
        ..medicalConditions = []
        ..allergies = []
        ..emergencyContacts = [
          {'name': name, 'phone': phone}
        ]
        ..profileImageUrl = '';
      await box.add(newUser);
    }
  }

  deleteContact(index) async {
    final box = Boxes.getUser();
    final user = box.values.first;
    user.emergencyContacts.removeAt(index);
    await user.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.emergency_contact_title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ValueListenableBuilder<Box<User>>(
          valueListenable: Boxes.getUser().listenable(),
          builder: (context, box, _) {
            final user = box.values.cast<User>();

            return user.isEmpty || user.first.emergencyContacts.isEmpty
                ? Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/doctors.webp'))),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                            AppLocalizations.of(context)!
                                .emergency_contact_title,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .emergency_contact_subtitle,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                            child: ListView.builder(
                                itemCount: user.first.emergencyContacts.length,
                                itemBuilder: (context, index) {
                                  final emergencyContact =
                                      user.first.emergencyContacts[index];
                                  return Card(
                                    elevation: 3,
                                    child: ListTile(
                                        onTap: () async {
                                          await launch(
                                              'tel:${emergencyContact['phone']}');
                                        },
                                        title: Text(emergencyContact['name']),
                                        subtitle:
                                            Text(emergencyContact['phone']),
                                        trailing: IconButton(
                                          onPressed: () async {
                                            await deleteContact(index);
                                          },
                                          icon: const Icon(Icons.delete),
                                        )),
                                  );
                                }))
                      ],
                    ),
                  );
          }),
      floatingActionButton: Container(
        width: 60,
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          highlightColor: Colors.red,
          onPressed: () {
            showDialog(
                context: context,
                builder: (ctx) {
                  return AddDialogueBox(
                      add: addContact,
                      title: AppLocalizations.of(context)!.add_contact,
                      hintText1: AppLocalizations.of(context)!.name_hint,
                      hintText2: AppLocalizations.of(context)!.phone_hint,
                      isContact: true);
                });
          },
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
