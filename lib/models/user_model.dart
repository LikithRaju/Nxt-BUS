import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String name;
  final String phone;
  final String email;
  final int age;
  final String gender;
  final String state;
  final List<String> savedPassengers;
  final double walletBalance;
  final int totalTrips;
  final double totalKm;
  final double carbonSaved;
  final DateTime createdAt;

  UserModel({
    required this.uid,
    required this.name,
    required this.phone,
    required this.email,
    required this.age,
    required this.gender,
    required this.state,
    this.savedPassengers = const [],
    this.walletBalance = 0.0,
    this.totalTrips = 0,
    this.totalKm = 0.0,
    this.carbonSaved = 0.0,
    required this.createdAt,
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserModel(
      uid: doc.id,
      name: data['name'] ?? '',
      phone: data['phone'] ?? '',
      email: data['email'] ?? '',
      age: data['age'] ?? 0,
      gender: data['gender'] ?? '',
      state: data['state'] ?? '',
      savedPassengers: List<String>.from(data['savedPassengers'] ?? []),
      walletBalance: (data['walletBalance'] ?? 0.0).toDouble(),
      totalTrips: data['totalTrips'] ?? 0,
      totalKm: (data['totalKm'] ?? 0.0).toDouble(),
      carbonSaved: (data['carbonSaved'] ?? 0.0).toDouble(),
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'age': age,
      'gender': gender,
      'state': state,
      'savedPassengers': savedPassengers,
      'walletBalance': walletBalance,
      'totalTrips': totalTrips,
      'totalKm': totalKm,
      'carbonSaved': carbonSaved,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}
