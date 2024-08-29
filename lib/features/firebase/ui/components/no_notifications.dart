// import 'package:flutter/material.dart';
//
// import '../../../../core/ui/theme/colors.dart';
//
// class NoNotifications extends StatelessWidget {
//   const NoNotifications({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const CircleAvatar(
//             radius: 48,
//             backgroundColor: MoushrefColors.veryLightGrey,
//             child: Text(
//               "💤",
//               style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
//             ),
//           ),
//           const SizedBox(height: 30),
//           Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   getLang(context, "no_notification_now"),
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.w700,
//                     fontSize: 20,
//                     color: MoushrefColors.black,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 10),
//           SizedBox(
//             width: 250,
//             child: Text(
//               getLang(context, "no_notification"),
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//                 color: MoushrefColors.lightGrey_1,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
