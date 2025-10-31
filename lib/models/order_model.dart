class Order {
  final String id;
  final String baslangic;
  final String bitis;
  final String aracTipi;
  final String yukAgirligi;
  final DateTime tarih;

  Order({
    required this.id,
    required this.baslangic,
    required this.bitis,
    required this.aracTipi,
    required this.yukAgirligi,
    required this.tarih,
  });

  // Firebase'e göndermek için Map'e çevir
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'baslangic': baslangic,
      'bitis': bitis,
      'aracTipi': aracTipi,
      'yukAgirligi': yukAgirligi,
      'tarih': tarih.toIso8601String(),
    };
  }

  // Firebase'den gelen Map'i Order'a çevir
  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] ?? '',
      baslangic: map['baslangic'] ?? '',
      bitis: map['bitis'] ?? '',
      aracTipi: map['aracTipi'] ?? '',
      yukAgirligi: map['yukAgirligi'] ?? '',
      tarih: DateTime.parse(map['tarih']),
    );
  }
}