import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/order_model.dart' as models;

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collection = 'orders';

  // Sipariş ekle
  Future<void> addOrder(models.Order order) async {
    try {
      await _firestore.collection(collection).doc(order.id).set(order.toMap());
    } catch (e) {
      debugPrint('Sipariş eklenirken hata: $e');
      rethrow;
    }
  }

  // Tüm siparişleri getir
  Stream<List<models.Order>> getOrders() {
    return _firestore
        .collection(collection)
        .orderBy('tarih', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return models.Order.fromMap(doc.data());
      }).toList();
    });
  }

  // Sipariş sil
  Future<void> deleteOrder(String orderId) async {
    try {
      await _firestore.collection(collection).doc(orderId).delete();
    } catch (e) {
      debugPrint('Sipariş silinirken hata: $e');
      rethrow;
    }
  }
}