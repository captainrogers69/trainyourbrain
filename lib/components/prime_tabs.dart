// import 'package:flutter/material.dart';

// class TabPrime extends StatelessWidget {
//   final TabController controller;
//   // final Function(int)? onTap;
//   final String? tab1, tab2, tab3, tab4, tab5;
//   const TabPrime({
//     super.key,
//     // this.onTap,
//     required this.controller,
//     required this.tab1,
//     required this.tab2,
//     required this.tab3,
//     this.tab4,
//     this.tab5,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: whiteColor,
//       height: 52,
//       width: MediaQuery.of(context).size.width,
//       child: TabBar(
//         // onTap: onTap ?? (v) {},
//         isScrollable: true,
//         controller: controller,
//         labelColor: primaryColor,
//         labelStyle: kSmallTextStyle.copyWith(
//             fontWeight: FontWeight.w700, fontFamily: 'BalooChettan2'),
//         unselectedLabelStyle: kSmallTextStyle.copyWith(
//             fontWeight: FontWeight.w700, fontFamily: 'BalooChettan2'),
//         indicatorColor: primaryColor,
//         indicatorWeight: 3,
//         indicatorSize: TabBarIndicatorSize.label,
//         tabs: [
//           Tab(text: tab1),
//           Tab(text: tab2),
//           Tab(text: tab3),
//           Tab(text: tab4),
//           Tab(text: tab5),
//         ],
//       ),
//     );
//   }
// }
