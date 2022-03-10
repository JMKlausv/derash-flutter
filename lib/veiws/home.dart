import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/blue_health_logo.png',

                    // color: Colors.blue,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.medica_link_name,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            AppLocalizations.of(context)!
                                .medica_link_vision_subtitle,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ]),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            Divider(
              color: Colors.redAccent.shade700,
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
                        Navigator.of(context).pushNamed('emergency-services');
                      },
                      leading: Image.asset(
                        'assets/images/emergency_contact.png',
                        width: 35,
                        height: 35,
                      ),
                      title: Text(
                        AppLocalizations.of(context)!.emergency_services,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 1,
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).pushNamed('donate-to-cc');
                      },
                      leading: Image.asset(
                        'assets/images/CCE.png',
                        width: 50,
                      ),
                      title: Text(
                        AppLocalizations.of(context)!.chfe,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 1,
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).pushNamed('donate-blood');
                      },
                      leading: Image.asset(
                        'assets/images/red_cross.png',
                        width: 30,
                        height: 30,
                      ),
                      title: Text(
                        AppLocalizations.of(context)!.donate_blood,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 1,
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, 'about-first-aid');
                      },
                      leading: Image.asset(
                        'assets/images/med_kit.png',
                        width: 30,
                        height: 30,
                      ),
                      title: Text(
                        AppLocalizations.of(context)!.about_first_aid,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
