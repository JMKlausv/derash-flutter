import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HospitalDetail extends StatelessWidget {
  const HospitalDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('zenbaba general hospital'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.blueGrey,
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'More info',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView(
                  children: [
                    Card(
                      elevation: 2,
                      child: ListTile(
                        onTap: () {},
                        leading: const Icon(
                          Icons.phone,
                          color: Colors.green,
                          size: 35,
                        ),
                        title: const Text(
                          '+2519384848',
                          style: TextStyle(fontSize: 22),
                        ),
                        subtitle: const Text(
                          'Click to dial',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: ListTile(
                        onTap: () {},
                        leading: Image.asset(
                          'assets/images/pin_hospital.png',
                          width: 30,
                        ),
                        title: const Text(
                          '2.14 km away',
                          style: TextStyle(fontSize: 22),
                        ),
                        subtitle: const Text(
                          'Click to open on google maps',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: ListTile(
                        onTap: () {},
                        leading: Image.asset(
                          'assets/images/facebook.png',
                          width: 30,
                        ),
                        title: const Text(
                          'Zenbaba',
                          style: TextStyle(fontSize: 22),
                        ),
                        subtitle: const Text(
                          'Click to open page',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: ListTile(
                        onTap: () {},
                        leading: Image.asset(
                          'assets/images/telegram.png',
                          width: 30,
                        ),
                        title: const Text(
                          '@zenbaba_hospital ',
                          style: TextStyle(fontSize: 22),
                        ),
                        subtitle: const Text(
                          'Click to open page',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
