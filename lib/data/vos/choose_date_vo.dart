import 'package:intl/intl.dart';

class ChooseDateVO {
  DateTime date;
  bool isSelected;

  ChooseDateVO(this.date, this.isSelected);
}

List<ChooseDateVO> generateDateVOs() {
  List<ChooseDateVO> dateVOs = [];
  DateTime today = DateTime.now();
  for (int i = 0; i < 14; i++) {
    DateTime futureDate = today.add(Duration(days: i));
    dateVOs.add(ChooseDateVO(futureDate, false));
  }
  return dateVOs;
}

// List<ChooseDateVO> chooseDate() {
//   List<ChooseDateVO> dates = [];
//   final now = DateTime.now();
//   for (int i = 0; i < 14; i++) {
//     var getDate = DateTime(now.year, now.month, now.day + i);
//     var date = DateFormat('yyyy-MM-dd').format(getDate);
//     dates.add(ChooseDateVO(date: date, isSelected: false));
//   }
//   return dates;
// }

// List<String> dates(String state) {
//   List<String> dates = [];
//   final now = DateTime.now();
//   for (int i = 0; i < 14; i++) {
//     var getDate = DateTime(now.year, now.month, now.day + i);
//     if (state == "networkCall") {
//       dates.add(DateFormat('yyyy-MM-dd').format(getDate));
//     } else if (state == "ticketView") {
//       if (i == 0) {
//         dates.add("Today${DateFormat('\nMMM\nd').format(getDate)}");
//       } else if (i == 1) {
//         dates.add("Tomorrow${DateFormat('\nMMM\nd').format(getDate)}");
//       } else {
//         dates.add(DateFormat('E\nMMM\nd').format(getDate));
//       }
//     }
//   }
//   return dates;
// }
