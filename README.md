# mini_nakliye_voltzones
Mini Nakliye - VoltZones | Flutter Nakliye Sipariş Uygulaması

## Özellikler
Temel Özellikler
- Sipariş Oluşturma: Başlangıç/bitiş konumu, araç tipi ve yük ağırlığı ile sipariş oluşturma
- Sipariş Listeleme: Tüm siparişleri tarih sırasına göre listeleme
- Sipariş Silme: Onay dialogu ile sipariş silme
- Form Validasyonu: Tüm alanlarda kapsamlı form kontrolü
- Tahmini Fiyat: Araç tipine göre otomatik fiyat hesaplama

Kullanıcı Deneyimi
- Karanlık/Aydınlık Mod: Sistem teması desteği
- Çoklu Dil Desteği: Türkçe ve İngilizce
- Modern UI: Sade, kullanışlı ve şık arayüz
- Splash Screen: Özel uygulama ikonu ile açılış ekranı
- Custom App Icon: Özel uygulama ikonu

Firebase Entegrasyonu
- Cloud Firestore: Gerçek zamanlı veri senkronizasyonu
- Offline Desteği: Firebase'in otomatik cache mekanizması

Teknik Özellikler
- Riverpod: Modern state management
- Localization: Flutter'ın native dil desteği
- Clean Architecture: Feature-first yapı
- Reactive Programming: Stream-based veri yönetimi

## Kullanılan Teknolojiler

| Teknoloji | Versiyon | Kullanım Amacı |
|-----------|----------|----------------|
| Flutter | 3.35.7 | UI Framework |
| Dart | 3.9.2 | Programlama Dili |
| Riverpod | 3.0.3 | State Management |
| Firebase Core | 4.2.0 | Firebase Bağlantısı |
| Cloud Firestore | 6.0.3 | Veritabanı |
| intl | 0.20.2 | Tarih/Saat Formatlama |
| SharedPreferences | 2.3.3 | Yerel Veri Saklama |

##  Kurulum ve Çalıştırma

### Gereksinimler

- Flutter SDK 3.35.7 veya üzeri
- Dart 3.9.2 veya üzeri
- Android Studio veya VS Code
- Android SDK (Android geliştirme için)
- Firebase projesi

### Projeyi Klonlayın
```bash
git clone https://github.com/melihcuneyter/mini-nakliye-voltzones.git
cd mini-nakliye-voltzones
```

### Bağımlılıkları Yükleyin
```bash
flutter pub get
```

### Localization Dosyalarını Generate Edin
```bash
flutter gen-l10n
```

### Uygulamayı Çalıştırın
```bash
flutter run
```
