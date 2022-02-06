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
            child: Column(mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.medical_services,
                        color: Colors.red,
                      )),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Your Name',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
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
                    onPressed: () {},
                    child: const Text('Change Language',
                        style: TextStyle(
                          fontSize: 18,
                        ))),
                TextButton(
                    onPressed: () {},
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
