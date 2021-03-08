import 'package:project/enums/payment-state-enum.dart';
import 'package:project/enums/payment-type-enum.dart';

class Payment {
  num id;
  PAYMENT_TYPE type;
  PAYMENT_STATE state;
  String date;
  num payment;
  Payment({this.id, this.type, this.state, this.date, this.payment});

  factory Payment.fromJson(Map<String, dynamic> json) {
    PAYMENT_TYPE t;
    PAYMENT_STATE s;

    return Payment(
      id: json['id'],
      type: t.getPaymentType(json['type']),
      state: s.getStateType(json['state']),
      payment: json['payment'],
    );
  }
}