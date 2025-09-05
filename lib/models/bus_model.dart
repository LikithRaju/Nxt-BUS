import 'package:cloud_firestore/cloud_firestore.dart';

class BusModel {
  final String busId;
  final String operatorId;
  final String busNumber;
  final String busName;
  final BusType type;
  final int totalSeats;
  final List<String> amenities;
  final List<SeatLayout> seatLayout;
  final double basePrice;
  final Map<String, double> routePrices;
  final bool isActive;

  BusModel({
    required this.busId,
    required this.operatorId,
    required this.busNumber,
    required this.busName,
    required this.type,
    required this.totalSeats,
    required this.amenities,
    required this.seatLayout,
    required this.basePrice,
    required this.routePrices,
    this.isActive = true,
  });

  factory BusModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return BusModel(
      busId: doc.id,
      operatorId: data['operatorId'],
      busNumber: data['busNumber'],
      busName: data['busName'],
      type: BusType.values.firstWhere((e) => e.toString() == data['type']),
      totalSeats: data['totalSeats'],
      amenities: List<String>.from(data['amenities'] ?? []),
      seatLayout: (data['seatLayout'] as List)
          .map((e) => SeatLayout.fromMap(e))
          .toList(),
      basePrice: data['basePrice'].toDouble(),
      routePrices: Map<String, double>.from(
          data['routePrices']?.map((k, v) => MapEntry(k, v.toDouble())) ?? {}),
      isActive: data['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'operatorId': operatorId,
      'busNumber': busNumber,
      'busName': busName,
      'type': type.toString(),
      'totalSeats': totalSeats,
      'amenities': amenities,
      'seatLayout': seatLayout.map((e) => e.toMap()).toList(),
      'basePrice': basePrice,
      'routePrices': routePrices,
      'isActive': isActive,
    };
  }
}

class SeatLayout {
  final String seatNumber;
  final SeatType seatType;
  final bool isAvailable;
  final double price;

  SeatLayout({
    required this.seatNumber,
    required this.seatType,
    this.isAvailable = true,
    required this.price,
  });

  factory SeatLayout.fromMap(Map<String, dynamic> map) {
    return SeatLayout(
      seatNumber: map['seatNumber'],
      seatType: SeatType.values.firstWhere((e) => e.toString() == map['seatType']),
      isAvailable: map['isAvailable'] ?? true,
      price: map['price'].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'seatNumber': seatNumber,
      'seatType': seatType.toString(),
      'isAvailable': isAvailable,
      'price': price,
    };
  }
}

enum BusType { sleeper, semiSleeper, seater, acSleeper, acSeater, hybrid }
enum SeatType { lower, upper, single, pushback }
enum Amenity { wifi, ac, chargingPort, tv, restroom, snacks }  
// Example amenities; can be expanded as needed
