import 'package:derash/helper_functions/boxes.dart';
import 'package:derash/models/user.dart';
import 'package:derash/widgets/add_dialogue_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MedicalConditions extends StatelessWidget {
  const MedicalConditions({Key? key}) : super(key: key);
  addMedicalCondition(name) async {
    final box = Boxes.getUser();
    if (box.values.isNotEmpty) {
      final user = box.values.first;
      user.medicalConditions.add(name);
      await user.save();
    } else {
      final newUser = User()
        ..userName = ''
        ..age = ''
        ..sex = ''
        ..bloodGroup = ''
        ..currentMedications = []
        ..medicalConditions = [name]
        ..allergies = []
        ..emergencyContacts = []
        ..profileImageUrl = '';
      await box.add(newUser);
    }
  }

  deleteMedicalCondition(index) async {
    final box = Boxes.getUser();
    final user = box.values.first;
    user.medicalConditions.removeAt(index);
    await user.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Conditions'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ValueListenableBuilder<Box<User>>(
          valueListenable: Boxes.getUser().listenable(),
          builder: (context, box, _) {
            final user = box.values.cast<User>();

            return user.isEmpty || user.first.medicalConditions.isEmpty
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
                        const Text('Medical Conditions',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          'Hi there, you can add or edit your profile here. this information will be handy for your doctor',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                            child: ListView.builder(
                                itemCount: user.first.medicalConditions.length,
                                itemBuilder: (context, index) {
                                  final medicalCondition =
                                      user.first.medicalConditions[index];
                                  return Card(
                                    elevation: 3,
                                    child: ListTile(
                                        title: Text(medicalCondition),
                                        trailing: IconButton(
                                          onPressed: () async {
                                            await deleteMedicalCondition(index);
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
                      add: addMedicalCondition,
                      title: 'Add Medical Condition',
                      hintText1: ' Name',
                      hintText2: " ",
                      isContact: false);
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
