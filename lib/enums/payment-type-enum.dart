enum PAYMENT_TYPE { cash, credit}

extension StatusExt on PAYMENT_TYPE {
  num get value {
    switch (this) {
      case PAYMENT_TYPE.cash:
        return 0;
      case PAYMENT_TYPE.credit:
        return 1;
      default:
        return null;
    }
  }

  String get name {
    switch (this) {
      case PAYMENT_TYPE.cash:
        return "Cash";
      case PAYMENT_TYPE.credit:
        return "Credit";
      default:
        return null;
    }
  }

  PAYMENT_TYPE getPaymentType(num payment) {
    switch (payment) {
      case 0:
        return PAYMENT_TYPE.cash;
      case 1:
        return PAYMENT_TYPE.credit;
      default:
        return null;
    }
  }
}



