// if (seatList[index].type == "text") {
// return Text(
// seatList[index].text,
// style: const TextStyle(
// color: kLoginPageDividerColor,
// fontSize: 12,
// fontFamily: 'Inter',
// fontWeight: FontWeight.w500,
// ),
// );
// } else if (seatList[index].type == "taken" ||
// seatList[index].type == "available") {
// return Image.asset(
// kSeatIcon,
// width: 30,
// height: 30,
// );
// } else if (seatList[index].type == "taken") {
// return const SizedBox(
// width: 30,
// height: 30,
// );
// }

///
// Stack(
// children: [
// Align(
// alignment: Alignment.centerLeft,
// child: Image.asset(
// kBookingButtonEnd,
// ),
// ),
// Align(
// alignment: Alignment.center,
// child: Container(
// width: MediaQuery.of(context).size.width * 0.5,
// height: kBookingButtonHeight,
// decoration: const BoxDecoration(
// color: kPrimaryColor,
// ),
// child: const Center(
// child: Text(
// kBookingLabel,
// style: TextStyle(
// color: Colors.black,
// fontWeight: FontWeight.w700,
// fontSize: kTextRegular2x,
// ),
// ),
// ),
// ),
// ),
// Align(
// alignment: Alignment.centerRight,
// child: Image.asset(
// kBookingButtonEnd,
// ),
// ),
// ],
// ),