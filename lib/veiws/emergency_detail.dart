import 'package:derash/models/emergency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class EmergencyDetail extends StatefulWidget {
  final Emergency emergency;

  const EmergencyDetail({Key? key, required this.emergency}) : super(key: key);

  @override
  State<EmergencyDetail> createState() => _EmergencyDetailState();
}

class _EmergencyDetailState extends State<EmergencyDetail> {
  bool learnMore = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(widget.emergency.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: widget.emergency.description.length,
                  itemBuilder: (ctx, index) {
                    return learnMore ||
                            widget.emergency.description[index]['isMain']
                        ? Container(
                            margin: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.03),
                            child: Card(
                              elevation: 3,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 5),
                                    child: Text(
                                      widget.emergency.description[index]
                                          ['title'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  if (widget.emergency.description[index]
                                              ['imageUrl'] !=
                                          '' &&
                                      widget.emergency.description[index]
                                              ['imageUrl'] !=
                                          null)
                                    Image.asset(widget.emergency
                                        .description[index]['imageUrl']),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    child: Text(
                                      widget.emergency.description[index]
                                          ['content'],
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Container();
                  })),
          TextButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10))),
            onPressed: () {
              setState(() {
                learnMore = true;
              });
            },
            child: const Text(
              'Learn More',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20))),
                onPressed: () {},
                child: const Text(
                  'CALL AN AMBULANCE',
                  style: TextStyle(fontSize: 20),
                )),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
