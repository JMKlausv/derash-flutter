import 'package:derash/veiws/emergency_page.dart';
import 'package:derash/veiws/home.dart';
import 'package:derash/veiws/hospitals.dart';
import 'package:derash/veiws/account/profile.dart';
import 'package:derash/widgets/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;
  final titles = ['Home', 'Emergency', 'Hospitals', 'Account'];
  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [Home(), EmergencyPage(), Hospitals(), Profile()];
    return Scaffold(
      drawer: const SideBar(),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(titles[currentIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 40,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedLabelStyle: const TextStyle(fontSize: 17, color: Colors.red),
        unselectedLabelStyle: const TextStyle(fontSize: 16),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.local_hospital_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Emergency',
            icon: Icon(
              Icons.warning_amber,
              size: 36,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Hospitals',
            icon: Icon(
              Icons.h_mobiledata_rounded,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(Icons.person),
          )
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: currentIndex,
        children: tabs,
      ),
    );
  }
}
