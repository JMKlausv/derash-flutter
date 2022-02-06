import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AddDialogueBox extends StatelessWidget {
  final String title;
  final String hintText1;
  final String hintText2;
  final bool isContact;
  AddDialogueBox({
    Key? key,
    required this.title,
    required this.hintText1,
    required this.hintText2,
    required this.isContact,
  }) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      titlePadding: const EdgeInsets.all(30),
      contentPadding: const EdgeInsets.all(30),
      title: Text(
        title,
        style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      children: [
        TextField(
            controller: nameController,
            textAlign: TextAlign.center,
            decoration:
                InputDecoration(hintText: hintText1, focusColor: Colors.red)),
        const SizedBox(
          height: 20,
        ),
        if (isContact)
          TextField(
              controller: phoneController,
              textAlign: TextAlign.center,
              decoration:
                  InputDecoration(hintText: hintText2, focusColor: Colors.red)),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(onPressed: () {}, child: const Text('ADD'))
      ],
    );
    ;
  }
}
