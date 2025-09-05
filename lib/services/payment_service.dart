// lib/services/payment_service.dart
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentService {
  final _razorpay = Razorpay();
  void openPayment(double amountINR) {
    var options = {
      'key': 'YOUR_RAZORPAY_KEY',
      'amount': (amountINR * 100).toInt(), // Amount in paise
      'currency': 'INR',
      'name': 'NxT BUS Booking',
      'description': 'Bus ticket',
    };
    _razorpay.open(options);
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handleSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handleError);
  }
  void _handleSuccess(event) {/*...*/}
  void _handleError(event) {/*...*/}
  void dispose() {_razorpay.clear();}
}
// Replace 'YOUR_RAZORPAY_KEY' with your actual Razorpay key