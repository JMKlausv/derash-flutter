import 'package:derash/widgets/add_dialogue_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';

class EmergencyContacts extends StatelessWidget {
  EmergencyContacts({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency contacts'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/doctors.webp'))),
      ),
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
                      title: 'Add Emergency Contacts',
                      hintText1: ' Name',
                      hintText2: " Phone",
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
