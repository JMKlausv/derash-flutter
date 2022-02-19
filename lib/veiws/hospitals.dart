import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Hospitals extends StatelessWidget {
  const Hospitals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              'Hospitals nearby',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).pushNamed('hospital-detial');
                          },
                          title: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 7),
                            child: Text(
                              'Zenbaba General Hospital',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          trailing: const Icon(
                            Icons.call,
                            color: Colors.green,
                          ),
                          subtitle: const Text('2.14 km away'),
                        ));
                  }))
        ],
      ),
    );
  }
}
