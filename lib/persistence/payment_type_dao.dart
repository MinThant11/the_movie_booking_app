import 'package:hive_flutter/adapters.dart';
import 'package:the_movie_booking_app/data/vos/payment_type_vo.dart';
import 'package:the_movie_booking_app/persistence/hive_constants.dart';

class PaymentTypeDao {
  static final PaymentTypeDao _singleton = PaymentTypeDao._internal();

  factory PaymentTypeDao() {
    return _singleton;
  }

  PaymentTypeDao._internal();

  Stream<void> watchPaymentType() {
    return getPaymentTypeBox().watch();
  }

  /// Save Payment Type
  void savePaymentType(List<PaymentTypeVO> paymentTypes) async {
    Map<int, PaymentTypeVO> paymentTypeMap = { for (var paymentType in paymentTypes) (paymentType.id ?? 0) : paymentType};
    return getPaymentTypeBox().putAll(paymentTypeMap);
  }

  /// Get Payment Type
  List<PaymentTypeVO> getPaymentType() {
    return getPaymentTypeBox().values.toList();
  }

  /// Payment Type Box
  Box<PaymentTypeVO> getPaymentTypeBox() {
    return Hive.box<PaymentTypeVO>(kBoxNamePaymentTypeVO);
  }

}