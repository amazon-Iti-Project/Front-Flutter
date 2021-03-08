enum Status { pending, arriving, delivered, archived, cancelled, cancelling }

extension StatusExt on Status {
  num get value {
    switch (this) {
      case Status.pending:
        return 1;
      case Status.arriving:
        return 2;
      case Status.delivered:
        return 3;
      case Status.archived:
        return 4;
      case Status.cancelled:
        return 5;
      case Status.cancelling:
        return 6;
      default:
        return null;
    }
  }

  String get name {
    switch (this) {
      case Status.pending:
        return "Pending";
      case Status.arriving:
        return "Arriving";
      case Status.delivered:
        return "Delivered";
      case Status.archived:
        return "Archived";
      case Status.cancelled:
        return "Cancelled";
      case Status.cancelling:
        return "Cancelling";
      default:
        return null;
    }
  }

  Status getStateType(num state) {
    switch (state) {
      case 1:
        return Status.pending;
      case 2:
        return Status.arriving;
      case 3:
        return Status.delivered;
      case 4:
        return Status.archived;
      case 5:
        return Status.cancelled;
      case 6:
        return Status.cancelling;
      default:
        return null;
    }
  }
}