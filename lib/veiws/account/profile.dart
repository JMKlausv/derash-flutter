import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:derash/helper_functions/boxes.dart';
import 'package:derash/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final box = Boxes.getUser();
  late XFile imageFile;
  late String userGender = '';

  handleTakePhoto() async {
    Navigator.pop(context);
    XFile? file = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 675,
      maxWidth: 960,
    );
    await saveImage(file!);
  }

  handleChooseFromGallery() async {
    Navigator.pop(context);
    final XFile? file =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    await saveImage(file!);
  }

  saveImage(XFile imageFile) async {
    // getting a directory path for saving
    final directory = await getApplicationDocumentsDirectory();
    final String path = '${directory.path}/${imageFile.name}';

// copy the file to a new path
    await imageFile.saveTo(path);
    // final File newImage = await imageFile.copy('$path/images/profileImage.png');
    // save the path to image in db
    if (box.values.isNotEmpty) {
      final user = box.values.first;

      if (user.profileImageUrl != '') {
        final oldFile = File(user.profileImageUrl);
        await oldFile.delete();
      }

      user.profileImageUrl = path;
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
        ..emergencyContacts = []
        ..profileImageUrl = path;
      await box.add(newUser);
    }
    setState(() {
      this.imageFile = imageFile;
    });
  }

  selectImage(context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return SimpleDialog(
            title: Text(
              AppLocalizations.of(context)!.edit_profile,
              textAlign: TextAlign.center,
            ),
            children: <Widget>[
              SimpleDialogOption(
                  child: Text(
                    AppLocalizations.of(context)!.camera_picker,
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () async {
                    await handleTakePhoto();
                  }),
              SimpleDialogOption(
                  child: Text(
                    AppLocalizations.of(context)!.gallery_picker,
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () async {
                    await handleChooseFromGallery();
                  }),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final gender = [
      AppLocalizations.of(context)!.sex_female,
      AppLocalizations.of(context)!.sex_male,
    ];
    return ValueListenableBuilder<Box<User>>(
        valueListenable: Boxes.getUser().listenable(),
        builder: (context, box, _) {
          final user = box.values.cast<User>();
          if (user.isNotEmpty && user.first.profileImageUrl != '') {
            imageFile = XFile(user.first.profileImageUrl);
          }
          if (user.isNotEmpty && user.first.sex != -1) {
            userGender = gender[user.first.sex];
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        selectImage(context);
                      },
                      child: user.isEmpty || user.first.profileImageUrl == ''
                          ? Container(
                              padding: const EdgeInsets.all(5),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.red, width: 2)),
                              child: Image.asset(
                                'assets/images/med_kit.png',
                                fit: BoxFit.scaleDown,
                              ))
                          : CircleAvatar(
                              radius: 40,
                              backgroundImage: FileImage(
                                File(imageFile.path),
                              ),
                            ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        user.isEmpty || user.first.userName == ''
                            ? Text(
                                AppLocalizations.of(context)!.name_hint,
                                style: const TextStyle(fontSize: 25),
                              )
                            : Text(
                                user.first.userName,
                                style: const TextStyle(fontSize: 25),
                              ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${AppLocalizations.of(context)!.sex_empty_hint} ${user.isNotEmpty ? userGender : ''}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          '${AppLocalizations.of(context)!.age_empty_hint}  ${user.isNotEmpty ? user.first.age : ''}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          '${AppLocalizations.of(context)!.blood_group_empty_hint}  ${user.isNotEmpty ? user.first.bloodGroup : ''}',
                          style: const TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('edit-profile');
                    },
                    child: Text(
                      AppLocalizations.of(context)!.edit_profile,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    )),
                Divider(
                  color: Colors.red.shade700,
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
                            Navigator.of(context)
                                .pushNamed('emergency-contacts');
                          },
                          leading: const Icon(
                            Icons.people_alt,
                            size: 30,
                            color: Colors.red,
                          ),
                          title: Text(
                            AppLocalizations.of(context)!
                                .emergency_contact_title,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 1,
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).pushNamed('allergies');
                          },
                          leading: Image.asset(
                            'assets/images/allergies_icon.png',
                            width: 30,
                          ),
                          title: Text(
                            AppLocalizations.of(context)!.allergies_title,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 1,
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('medical-conditions');
                          },
                          leading: Image.asset(
                            'assets/images/med_history.png',
                            width: 25,
                            height: 25,
                          ),
                          title: Text(
                            AppLocalizations.of(context)!.conditions_title,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 1,
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('current-medications');
                          },
                          leading: Image.asset(
                            'assets/images/medication.png',
                            width: 30,
                            height: 30,
                          ),
                          title: Text(
                            AppLocalizations.of(context)!.medication_title,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
