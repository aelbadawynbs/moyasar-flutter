import 'package:moyasar/moyasar.dart';
import 'package:moyasar/src/models/payment_type.dart';

/// Moyasar API response for processing a payment.
class PaymentResponse {
  late String id;
  late PaymentStatus status;
  late int amount;
  late int fee;
  late String currency;
  late int refunded;
  String? refundedAt;
  late int captured;
  String? capturedAt;
  String? voidedAt;
  String? description;
  late String amountFormat;
  late String feeFormat;
  late String refundedFormat;
  late String capturedFormat;
  String? invoiceId;
  String? ip;
  String? callbackUrl;
  late String createdAt;
  late String updatedAt;
  Map<String, dynamic>? metadata;
  late dynamic source;

  PaymentResponse.fromJson(Map<String, dynamic> json, PaymentType paymentType) {
    id = json['id'];
    status = PaymentStatus.values.byName(json['status']);
    amount = json['amount'];
    fee = json['fee'];
    currency = json['currency'];
    refunded = json['refunded'];
    refundedAt = json['refunded_at'];
    captured = json['captured'];
    capturedAt = json['captured_at'];
    voidedAt = json['voided_at'];
    description = json['description'];
    amountFormat = json['amount_format'];
    feeFormat = json['fee_format'];
    refundedFormat = json['refunded_format'];
    capturedFormat = json['captured_format'];
    invoiceId = json['invoice_id'];
    ip = json['ip'];
    callbackUrl = json['callback_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

    if (json['metadata'] != null) {
      metadata = Map<String, dynamic>.from(json['metadata']);
    }

    if (paymentType == PaymentType.creditcard) {
      source = CardPaymentResponseSource.fromJson(json['source']);
    } else if (paymentType == PaymentType.applepay) {
      source = ApplePayPaymentResponseSource.fromJson(json['source']);
    } else {
      source = json['source'];
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['status'] = status.name;
    _data['amount'] = amount;
    _data['fee'] = fee;
    _data['currency'] = currency;
    _data['refunded'] = refunded;
    _data['refunded_at'] = refundedAt;
    _data['captured'] = captured;
    _data['captured_at'] = capturedAt;
    _data['voided_at'] = voidedAt;
    _data['description'] = description;
    _data['amount_format'] = amountFormat;
    _data['fee_format'] = feeFormat;
    _data['refunded_format'] = refundedFormat;
    _data['captured_format'] = capturedFormat;
    _data['invoice_id'] = invoiceId;
    _data['ip'] = ip;
    _data['callback_url'] = callbackUrl;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['metadata'] = metadata;
    _data['source'] = (source as CardPaymentResponseSource).toJson();
    return _data;
  }
}

enum PaymentStatus { initiated, paid, failed, authorized, captured }
