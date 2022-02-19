import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade100,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            children: [
              Image.asset(
                'assets/images/blue_health_logo.png',
                width: MediaQuery.of(context).size.width,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Blue Health Ethiopia'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Blue Health Ethiopia'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
