import 'package:crm/utility/utility.dart';
import 'package:crm/view/profile/profile.dart';
import 'package:crm/view/setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home/home.dart';

// class AppBottomNavigationBar extends StatefulWidget {
//   final int? pageIndex;
//   const AppBottomNavigationBar({Key? key, this.pageIndex = 0}) : super(key: key);

//   @override
//   State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
// }

// class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
//   int _currentPage = 0;
//   List<Widget> pages = [
//     const Home(),
//     const Setting(),
//     const Profile(),
//   ];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _currentPage = widget.pageIndex!;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: SafeArea(
//         child: Scaffold(
//           body: pages[_currentPage],
//           bottomNavigationBar: ,
//         ),
//       ),
//     );
//   }
// }

class AppBottomNavigation extends StatefulWidget {
  final int? pageIndex;
  const AppBottomNavigation({super.key, this.pageIndex = 0});

  @override
  State<AppBottomNavigation> createState() => _AppBottomNavigationState();
}

class _AppBottomNavigationState extends State<AppBottomNavigation> {
  late int _currentPage;
  @override
  void initState() {
    super.initState();
    _currentPage = widget.pageIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.home_filled),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.settings),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.supervised_user_circle),
        ),
      ],
      currentIndex: _currentPage,
      selectedItemColor: AppColor.mainColor,
      unselectedItemColor: Colors.black,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Get.to(() => const Home());
        break;
      case 1:
        Get.to(() => const Setting());
        break;
      case 2:
        Get.to(() => const Profile());
        break;
      default:
        Get.to(() => const Home());
        break;
    }

    setState(() {
      _currentPage = index;
    });
  }
}
