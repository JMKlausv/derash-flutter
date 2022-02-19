import 'package:derash/helper_functions/boxes.dart';
import 'package:derash/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String selectedGender = 'Female';
  String selectedBloodGroup = 'A+';

  var bloodGroup = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

  var gender = [
    'Female',
    'Male',
  ];
  final box = Boxes.getUser();

  saveUserData() async {
    if (formKey.currentState!.validate()) {
      if (box.values.isNotEmpty) {
        final user = box.values.first;
        user.userName = nameController.text;
        user.age = ageController.text;
        user.sex = selectedGender;
        user.bloodGroup = selectedBloodGroup;
        await user.save();
      } else {
        final newUser = User()
          ..userName = nameController.text
          ..age = ageController.text
          ..sex = selectedGender
          ..bloodGroup = selectedBloodGroup
          ..currentMedications = []
          ..medicalConditions = []
          ..allergies = []
          ..emergencyContacts = []
          ..profileImageUrl = '';
        await box.add(newUser);
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Profile',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Hi there, you can add or edit your profile here. this information will be handy for your doctor.',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 15,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        // initialValue:
                        //     box.isNotEmpty ? box.values.first.userName : '',
                        textAlign: TextAlign.start,
                        validator: (val) {
                          return val!.isEmpty
                              ? "please insert your name first "
                              : null;
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 20,
                          ),
                          label: Text('Name'),
                          labelStyle: TextStyle(color: Colors.red),
                          focusColor: Colors.red,
                        ),
                      ),
                      TextFormField(
                        controller: ageController,
                        // initialValue:
                        //     box.isNotEmpty ? box.values.first.age : '',
                        textAlign: TextAlign.start,
                        validator: (val) {
                          return val!.isEmpty
                              ? "please insert your age first "
                              : null;
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 20,
                          ),
                          label: Text('Age'),
                          labelStyle: TextStyle(color: Colors.red),
                          focusColor: Colors.red,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13),
                        child: DropdownButton(
                          isExpanded: true,
                          iconDisabledColor: Colors.red,
                          iconEnabledColor: Colors.red,
                          style: const TextStyle(color: Colors.red),
                          value: selectedGender,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: gender.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedGender = newValue!;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13),
                        child: DropdownButton(
                          isExpanded: true,
                          iconDisabledColor: Colors.red,
                          iconEnabledColor: Colors.red,
                          style: const TextStyle(color: Colors.red),
                          value: selectedBloodGroup,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: bloodGroup.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedBloodGroup = newValue!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await saveUserData();
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 17),
                          child: Text('SAVE'),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
