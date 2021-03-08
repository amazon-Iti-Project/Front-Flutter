enum PAYMENT_STATE { paid, pending}
extension StatusExt on PAYMENT_STATE {
  num get value {
    switch (this) {
      case PAYMENT_STATE.paid:
        return 0;
      case PAYMENT_STATE.pending:
        return 1;
      default:
        return null;
    }
  }

  String get name {
    switch (this) {
      case PAYMENT_STATE.paid:
        return "Paid";
      case PAYMENT_STATE.pending:
        return "Pending";
      default:
        return null;
    }
  }

  PAYMENT_STATE getStateType(num state) {
    switch (state) {
      case 0:
        return PAYMENT_STATE.paid;
      case 1:
        return PAYMENT_STATE.pending;
      default:
        return null;
    }
  }
}

