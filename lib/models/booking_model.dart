import 'package:cloud_firestore/cloud_firestore.dart';

class BookingModel {
  final String bookingId;
  final String userId;
  final String busId;
  final String routeId;
  final String origin;
  final String destination;
  final DateTime journeyDate;
  final DateTime returnDate;
  final List<String> seatNumbers;
  final List<PassengerInfo> passengers;
  final double totalAmount;
  final String paymentStatus;
  final BookingStatus status;
  final bool isWomenOnly;
  final DateTime bookingTime;
  final String boardingPoint;
  final String droppingPoint;

  BookingModel({
    required this.bookingId,
    required this.userId,
    required this.busId,
    required this.routeId,
    required this.origin,
    required this.destination,
    required this.journeyDate,
    required this.returnDate,
    required this.seatNumbers,
    required this.passengers,
    required this.totalAmount,
    required this.paymentStatus,
    required this.status,
    this.isWomenOnly = false,
    required this.bookingTime,
    required this.boardingPoint,
    required this.droppingPoint,
  });

  factory BookingModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return BookingModel(
      bookingId: doc.id,
      userId: data['userId'],
      busId: data['busId'],
      routeId: data['routeId'],
      origin: data['origin'],
      destination: data['destination'],
      journeyDate: (data['journeyDate'] as Timestamp).toDate(),
      returnDate: (data['returnDate'] as Timestamp).toDate(),
      seatNumbers: List<String>.from(data['seatNumbers']),
      passengers: (data['passengers'] as List)
          .map((e) => PassengerInfo.fromMap(e))
          .toList(),
      totalAmount: data['totalAmount'].toDouble(),
      paymentStatus: data['paymentStatus'],
      status: BookingStatus.values
          .firstWhere((e) => e.toString() == data['status']),
      isWomenOnly: data['isWomenOnly'] ?? false,
      bookingTime: (data['bookingTime'] as Timestamp).toDate(),
      boardingPoint: data['boardingPoint'],
      droppingPoint: data['droppingPoint'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'busId': busId,
      'routeId': routeId,
      'origin': origin,
      'destination': destination,
      'journeyDate': Timestamp.fromDate(journeyDate),
      'returnDate': Timestamp.fromDate(returnDate),
      'seatNumbers': seatNumbers,
      'passengers': passengers.map((e) => e.toMap()).toList(),
      'totalAmount': totalAmount,
      'paymentStatus': paymentStatus,
      'status': status.toString(),
      'isWomenOnly': isWomenOnly,
      'bookingTime': Timestamp.fromDate(bookingTime),
      'boardingPoint': boardingPoint,
      'droppingPoint': droppingPoint,
    };
  }
}

class PassengerInfo {
  final String name;
  final int age;
  final String gender;

  PassengerInfo({required this.name, required this.age, required this.gender});

  factory PassengerInfo.fromMap(Map<String, dynamic> map) {
    return PassengerInfo(
      name: map['name'],
      age: map['age'],
      gender: map['gender'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'age': age, 'gender': gender};
  }
}

enum BookingStatus { confirmed, cancelled, completed, refunded }
