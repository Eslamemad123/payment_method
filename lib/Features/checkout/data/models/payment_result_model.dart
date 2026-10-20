enum PaymentStatusType {
  success,
  failure,
  cancelled,
  pending,
}

class PaymentResultModel {
  final PaymentStatusType status;
  final String? transactionId;
  final String? message;
  final Map<String, dynamic>? data;

  const PaymentResultModel({
    required this.status,
    this.transactionId,
    this.message,
    this.data,
  });

  bool get isSuccess => status == PaymentStatusType.success;
  bool get isCancelled => status == PaymentStatusType.cancelled;
  bool get isPending => status == PaymentStatusType.pending;
  bool get isFailure => status == PaymentStatusType.failure;

  factory PaymentResultModel.success({
    String? transactionId,
    String? message,
    Map<String, dynamic>? data,
  }) {
    return PaymentResultModel(
      status: PaymentStatusType.success,
      transactionId: transactionId,
      message: message ?? 'Payment successful',
      data: data,
    );
  }

  factory PaymentResultModel.cancelled({String? message}) {
    return PaymentResultModel(
      status: PaymentStatusType.cancelled,
      message: message ?? 'Payment cancelled by user',
    );
  }

  factory PaymentResultModel.pending({
    String? transactionId,
    String? message,
    Map<String, dynamic>? data,
  }) {
    return PaymentResultModel(
      status: PaymentStatusType.pending,
      transactionId: transactionId,
      message: message ?? 'Payment is pending confirmation',
      data: data,
    );
  }

  factory PaymentResultModel.failure({
    String? message,
    Map<String, dynamic>? data,
  }) {
    return PaymentResultModel(
      status: PaymentStatusType.failure,
      message: message ?? 'Payment failed',
      data: data,
    );
  }

  @override
  String toString() {
    return 'PaymentResultModel(status: $status, transactionId: $transactionId, message: $message)';
  }
}
