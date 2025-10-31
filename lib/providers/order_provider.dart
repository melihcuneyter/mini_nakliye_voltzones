import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/order_model.dart' as models;
import '../services/firebase_service.dart';

// Firebase servisi için provider
final firebaseServiceProvider = Provider<FirebaseService>((ref) {
  return FirebaseService();
});

// Siparişleri dinleyen stream provider
final ordersStreamProvider = StreamProvider<List<models.Order>>((ref) {
  final firebaseService = ref.watch(firebaseServiceProvider);
  return firebaseService.getOrders();
});

// Sipariş ekleme fonksiyonu için provider
final orderActionsProvider = Provider<OrderActions>((ref) {
  return OrderActions(ref);
});

// Sipariş işlemleri (ekle, sil)
class OrderActions {
  final Ref ref;
  
  OrderActions(this.ref);

  Future<void> addOrder(models.Order order) async {
    final firebaseService = ref.read(firebaseServiceProvider);
    await firebaseService.addOrder(order);
  }

  Future<void> deleteOrder(String orderId) async {
    final firebaseService = ref.read(firebaseServiceProvider);
    await firebaseService.deleteOrder(orderId);
  }
}