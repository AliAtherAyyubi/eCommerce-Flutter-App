// import 'package:ecommerce_code/Utils/Colors.dart';
// import 'package:ecommerce_code/Utils/typo.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class CustomNavBar extends StatefulWidget {
//   final List<Widget> screens;
//   final List<BottomNavigationBarItem> items;
//   final int initialIndex;

//   CustomNavBar({
//     required this.screens,
//     required this.items,
//     this.initialIndex = 0,
//   });

//   @override
//   _CustomNavBarState createState() => _CustomNavBarState();
// }

// class _CustomNavBarState extends State<CustomNavBar> {
//   int _currentIndex = 0;
//   bool _fabTapped = false;

//   @override
//   void initState() {
//     super.initState();
//     _currentIndex = widget.initialIndex;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: widget.screens[_currentIndex],
//       floatingActionButton: FloatingActionButton(
//         shape: CircleBorder(),
//         backgroundColor: _fabTapped ? AppColor.white : Colors.grey,
//         child: Icon(
//           CupertinoIcons.cart,
//           color: Colors.black,
//         ),
//         onPressed: () {
//           setState(() {
//             _fabTapped = !_fabTapped; // Change the button color on tap
//           });
//         },
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: BottomAppBar(
//         // elevation: 0,
//         shape: CircularNotchedRectangle(),
//         // notchMargin: 8,
//         color: Colors.white,
//         height: 60,
//         padding: EdgeInsets.all(0),
//         child: BottomNavigationBar(
//           currentIndex: _currentIndex,
//           onTap: (index) {
//             setState(() {
//               _currentIndex = index;
//             });
//           },
//           backgroundColor: Colors.white,
//           elevation: 0,
//           items: widget.items,
//           selectedItemColor: AppColor.dprimary,
//           unselectedItemColor: Colors.black,
//           showUnselectedLabels: true,
//         ),
//       ),
//     );
//   }
// }

// BottomNavigationBarItem myNavBarItem({
//   required IconData iconData,
//   required String title,
// }) {
//   return BottomNavigationBarItem(
//     icon: Icon(
//       iconData,
//     ),
//     label: title,
//     // backgroundColor: Colors.white,
//   );
// }
