import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DonateToCc extends StatelessWidget {
  const DonateToCc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donate To Cardiac Center'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Donate through SMS',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 2,
                child: ListTile(
                  leading: Image.asset(
                    'assets/images/CCE.png',
                  ),
                  title: const Text(
                    'Donate 1 Birr',
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                  subtitle: const Text(
                    'Click to donate',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
              Card(
                elevation: 2,
                child: ListTile(
                  leading: Image.asset(
                    'assets/images/CCE.png',
                  ),
                  title: const Text(
                    'Donate 10 Birr',
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                  subtitle: const Text(
                    'Click to donate',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
              Card(
                elevation: 2,
                child: ListTile(
                  leading: Image.asset(
                    'assets/images/CCE.png',
                  ),
                  title: const Text(
                    'Donate 50 Birr',
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                  subtitle: const Text(
                    'Click to donate',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
              Card(
                elevation: 2,
                child: ListTile(
                  leading: Image.asset(
                    'assets/images/CCE.png',
                  ),
                  title: const Text(
                    'Donate 100 Birr',
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                  subtitle: const Text(
                    'Click to donate',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Donate through Bank',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 2,
                child: ListTile(
                  leading: Image.asset(
                    'assets/images/CCE.png',
                  ),
                  title: const Text(
                    'Get Bank Information',
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                  subtitle: const Text(
                    'Click here to get bank account information',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
              Card(
                elevation: 2,
                child: ListTile(
                  leading: Image.asset(
                    'assets/images/CCE.png',
                  ),
                  title: const Text(
                    'Get Forein Currency Account',
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                  subtitle: const Text(
                    'Click here to get bank account information',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
