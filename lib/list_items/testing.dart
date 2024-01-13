// import 'package:flutter/material.dart';
//
// class FooMatic extends StatefulWidget {
//   const FooMatic({Key? key}) : super(key: key);
//
//   @override
//   State<FooMatic> createState() => _FooMaticState();
// }
//
// class _FooMaticState extends State<FooMatic> with TickerProviderStateMixin {
//   TransformationController ctrl = TransformationController();
//   late Size size;
//   late AnimationController animationCtrl = AnimationController(
//     vsync: this,
//     duration: const Duration(milliseconds: 800),
//   );
//
//   get ui => null;
//
//   @override
//   void initState() {
//     super.initState();
//     animationCtrl.addListener(_animationTick);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             ElevatedButton(onPressed: animationCtrl.forward, child: const Text('zoom in')),
//             ElevatedButton(onPressed: animationCtrl.reverse, child: const Text('zoom out')),
//           ],
//         ),
//         Expanded(
//           child: LayoutBuilder(
//               builder: (context, constraints) {
//                 size = constraints.biggest;
//                 return Stack(
//                   children: [
//                     InteractiveViewer(
//                       transformationController: ctrl,
//                       constrained: false,
//                       child: const FlutterLogo(size: 1000),
//                     ),
//                     Center(
//                       child: Container(
//                         width: 32,
//                         height: 32,
//                         decoration: BoxDecoration(
//                             border: Border.all(width: 2),
//                             shape: BoxShape.circle
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               }
//           ),
//         ),
//       ],
//     );
//   }
//
//   void _animationTick() {
//     final center = size.center(Offset.zero);
//     final anchor = ctrl.toScene(center);
//     ctrl.value = composeMatrixFromOffsets(
//       scale: ui.lerpDouble(1, 2, animationCtrl.value)!,
//       anchor: anchor,
//       translate: center,
//     );
//   }
//
//   Matrix4 composeMatrixFromOffsets({required scale, required Offset anchor, required Offset translate}) {}
// }
// // if (seatList[index].type == "text") {
// // return Text(
// // seatList[index].text,
// // style: const TextStyle(
// // color: kLoginPageDividerColor,
// // fontSize: 12,
// // fontFamily: 'Inter',
// // fontWeight: FontWeight.w500,
// // ),
// // );
// // } else if (seatList[index].type == "taken" ||
// // seatList[index].type == "available") {
// // return Image.asset(
// // kSeatIcon,
// // width: 30,
// // height: 30,
// // );
// // } else if (seatList[index].type == "taken") {
// // return const SizedBox(
// // width: 30,
// // height: 30,
// // );
// // }
//
// ///
// // Stack(
// // children: [
// // Align(
// // alignment: Alignment.centerLeft,
// // child: Image.asset(
// // kBookingButtonEnd,
// // ),
// // ),
// // Align(
// // alignment: Alignment.center,
// // child: Container(
// // width: MediaQuery.of(context).size.width * 0.5,
// // height: kBookingButtonHeight,
// // decoration: const BoxDecoration(
// // color: kPrimaryColor,
// // ),
// // child: const Center(
// // child: Text(
// // kBookingLabel,
// // style: TextStyle(
// // color: Colors.black,
// // fontWeight: FontWeight.w700,
// // fontSize: kTextRegular2x,
// // ),
// // ),
// // ),
// // ),
// // ),
// // Align(
// // alignment: Alignment.centerRight,
// // child: Image.asset(
// // kBookingButtonEnd,
// // ),
// // ),
// // ],
// // ),