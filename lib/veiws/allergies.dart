import 'package:derash/widgets/add_dialogue_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Allergies extends StatelessWidget {
  const Allergies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Allergies'),
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
