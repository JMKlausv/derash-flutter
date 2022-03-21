import 'package:derash/veiws/emergency_page.dart';
import 'package:derash/veiws/home.dart';
import 'package:derash/veiws/hospitals.dart';
import 'package:derash/veiws/account/profile.dart';
import 'package:derash/widgets/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [Home(), EmergencyPage(), Hospitals(), Profile()];
    final titles = [
      AppLocalizations.of(context)!.home,
      AppLocalizations.of(context)!.emergency,
      AppLocalizations.of(context)!.hospitals,
      AppLocalizations.of(context)!.account
    ];
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
        showUnselectedLabels: true,
        showSelectedLabels: true,
        backgroundColor: Colors.white,
        selectedLabelStyle:
            const TextStyle(fontSize: 18, color: Colors.redAccent),
        unselectedLabelStyle: const TextStyle(fontSize: 16),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            label: titles[0],
            icon: const ImageIcon(
              AssetImage('assets/images/red_cross.png'),
              color: Colors.black,
              size: 36,
            ),
          ),
          BottomNavigationBarItem(
            label: titles[1],
            icon: const ImageIcon(
              AssetImage('assets/images/emergency_icon.png'),
              color: Colors.black87,
              size: 36,
            ),
          ),
          BottomNavigationBarItem(
            label: titles[2],
            icon: const ImageIcon(
              AssetImage('assets/images/hospitals_icon.png'),
              color: Colors.black87,
              size: 36,
            ),
          ),
          BottomNavigationBarItem(
            label: titles[3],
            icon: const ImageIcon(
              AssetImage('assets/images/account.png'),
              color: Colors.black,
              size: 36,
            ),
          ),
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
