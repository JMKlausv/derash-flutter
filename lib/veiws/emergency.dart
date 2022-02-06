import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';

class Emergency extends StatelessWidget {
  Emergency({Key? key}) : super(key: key);
  final List gridItems = [
    {
      'name': 'Allergy',
      'icon': 'assets/images/allergy.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Emergency',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 10,
                ),
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    child: GridTile(
                      footer: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'Bleeding',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      child: Image.asset(
                        'assets/images/bleeding.png',
                        color: Colors.red,
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
