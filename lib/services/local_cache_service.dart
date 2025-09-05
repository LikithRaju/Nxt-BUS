// lib/services/local_cache_service.dart
import 'package:shared_preferences/shared_preferences.dart';

class LocalCacheService {
  Future<void> saveBookings(List<String> bookings) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('offline_bookings', bookings);
  }
  Future<List<String>> getBookings() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('offline_bookings') ?? [];
  }
}
