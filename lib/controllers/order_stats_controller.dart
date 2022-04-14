import 'package:flutter_ecommerce_backend/models/models.dart';
import 'package:flutter_ecommerce_backend/services/database_service.dart';
import 'package:get/get.dart';

class OrderStatsController extends GetxController {
  final DatabaseService database = DatabaseService();

  var stats = Future.value(<OrderStats>[]).obs;

  @override
  void onInit() {
    stats.value = database.getOrderStats();
    super.onInit();
  }
}
