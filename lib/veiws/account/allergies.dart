import 'package:derash/helper_functions/boxes.dart';
import 'package:derash/models/user.dart';
import 'package:derash/widgets/add_dialogue_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Allergies extends StatelessWidget {
  const Allergies({Key? key}) : super(key: key);
  addAllergy(name) async {
    final box = Boxes.getUser();
    if (box.values.isNotEmpty) {
      final user = box.values.first;
      user.allergies.add(name);
      await user.save();
    } else {
      final newUser = User()
        ..userName = ''
        ..age = ''
        ..sex = ''
        ..bloodGroup = ''
        ..currentMedications = []
        ..medicalConditions = []
        ..allergies = [name]
        ..emergencyContacts = []
        ..profileImageUrl = '';
      await box.add(newUser);
    }
  }

  deleteAllergy(index) async {
    final box = Boxes.getUser();
    final user = box.values.first;
    user.allergies.removeAt(index);
    await user.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Allergies'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ValueListenableBuilder<Box<User>>(
          valueListenable: Boxes.getUser().listenable(),
          builder: (context, box, _) {
            final user = box.values.cast<User>();

            return user.isEmpty || user.first.allergies.isEmpty
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
                        const Text('Allergies',
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
                                itemCount: user.first.allergies.length,
                                itemBuilder: (context, index) {
                                  final allergy = user.first.allergies[index];
                                  return Card(
                                    elevation: 3,
                                    child: ListTile(
                                        title: Text(allergy),
                                        trailing: IconButton(
                                          onPressed: () async {
                                            await deleteAllergy(index);
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
                      add: addAllergy,
                      title: 'Add Allergies',
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
