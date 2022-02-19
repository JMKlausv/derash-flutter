import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      color: Colors.red,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: Image.asset(
                  'assets/images/med_kit.png',
                  width: 30,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Your Name',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ]),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 20, top: 10),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return SimpleDialog(
                              titlePadding: const EdgeInsets.only(
                                  top: 20, left: 15, right: 15, bottom: 0),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 10),
                              title: const Text(
                                'Choose a Language',
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 5),
                                  child: TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        elevation: MaterialStateProperty.all(5),
                                        padding: MaterialStateProperty.all(
                                            const EdgeInsets.symmetric(
                                                horizontal: 45, vertical: 15))),
                                    onPressed: () {},
                                    child: const Text(
                                      'አማርኛ',
                                      style: TextStyle(
                                        fontSize: 23,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 5),
                                  child: TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        elevation: MaterialStateProperty.all(5),
                                        padding: MaterialStateProperty.all(
                                            const EdgeInsets.symmetric(
                                                horizontal: 45, vertical: 15))),
                                    onPressed: () {},
                                    child: const Text(
                                      'English',
                                      style: TextStyle(
                                        fontSize: 23,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 5),
                                  child: TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        elevation: MaterialStateProperty.all(5),
                                        padding: MaterialStateProperty.all(
                                            const EdgeInsets.symmetric(
                                                horizontal: 45, vertical: 15))),
                                    onPressed: () {},
                                    child: const Text(
                                      'Oromiffaa',
                                      style: TextStyle(
                                        fontSize: 23,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    child: const Text('Change Language',
                        style: TextStyle(
                          fontSize: 18,
                        ))),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('about-us');
                    },
                    child: const Text('About Us',
                        style: TextStyle(
                          fontSize: 18,
                        ))),
                TextButton(
                    onPressed: () {},
                    child: const Text('Derash App v-1.0',
                        style: TextStyle(
                          fontSize: 18,
                        )))
              ],
            ),
          )
        ],
      ),
    );
  }
}
