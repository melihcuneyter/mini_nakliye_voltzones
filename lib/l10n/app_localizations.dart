import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In tr, this message translates to:
  /// **'Mini Nakliye - VoltZones'**
  String get appTitle;

  /// No description provided for @createOrder.
  ///
  /// In tr, this message translates to:
  /// **'Sipariş Oluştur'**
  String get createOrder;

  /// No description provided for @orders.
  ///
  /// In tr, this message translates to:
  /// **'Siparişler'**
  String get orders;

  /// No description provided for @settings.
  ///
  /// In tr, this message translates to:
  /// **'Ayarlar'**
  String get settings;

  /// No description provided for @startLocation.
  ///
  /// In tr, this message translates to:
  /// **'Başlangıç Konumu'**
  String get startLocation;

  /// No description provided for @endLocation.
  ///
  /// In tr, this message translates to:
  /// **'Bitiş Konumu'**
  String get endLocation;

  /// No description provided for @vehicleType.
  ///
  /// In tr, this message translates to:
  /// **'Araç Tipi'**
  String get vehicleType;

  /// No description provided for @loadWeight.
  ///
  /// In tr, this message translates to:
  /// **'Yük Ağırlığı (kg)'**
  String get loadWeight;

  /// No description provided for @minivan.
  ///
  /// In tr, this message translates to:
  /// **'Minivan'**
  String get minivan;

  /// No description provided for @panelvan.
  ///
  /// In tr, this message translates to:
  /// **'Panelvan'**
  String get panelvan;

  /// No description provided for @van.
  ///
  /// In tr, this message translates to:
  /// **'Kamyonet'**
  String get van;

  /// No description provided for @truck.
  ///
  /// In tr, this message translates to:
  /// **'Tır'**
  String get truck;

  /// No description provided for @orderCreated.
  ///
  /// In tr, this message translates to:
  /// **'Sipariş başarıyla oluşturuldu!'**
  String get orderCreated;

  /// No description provided for @noOrders.
  ///
  /// In tr, this message translates to:
  /// **'Henüz sipariş yok'**
  String get noOrders;

  /// No description provided for @deleteOrder.
  ///
  /// In tr, this message translates to:
  /// **'Sipariş Sil'**
  String get deleteOrder;

  /// No description provided for @deleteConfirm.
  ///
  /// In tr, this message translates to:
  /// **'Bu siparişi silmek istediğinize emin misiniz?'**
  String get deleteConfirm;

  /// No description provided for @cancel.
  ///
  /// In tr, this message translates to:
  /// **'İptal'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In tr, this message translates to:
  /// **'Sil'**
  String get delete;

  /// No description provided for @orderDeleted.
  ///
  /// In tr, this message translates to:
  /// **'Sipariş silindi'**
  String get orderDeleted;

  /// No description provided for @darkMode.
  ///
  /// In tr, this message translates to:
  /// **'Karanlık Mod'**
  String get darkMode;

  /// No description provided for @language.
  ///
  /// In tr, this message translates to:
  /// **'Dil'**
  String get language;

  /// No description provided for @turkish.
  ///
  /// In tr, this message translates to:
  /// **'Türkçe'**
  String get turkish;

  /// No description provided for @english.
  ///
  /// In tr, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @on.
  ///
  /// In tr, this message translates to:
  /// **'Açık'**
  String get on;

  /// No description provided for @off.
  ///
  /// In tr, this message translates to:
  /// **'Kapalı'**
  String get off;

  /// No description provided for @startLocationHint.
  ///
  /// In tr, this message translates to:
  /// **'Örn: İstanbul, Kadıköy'**
  String get startLocationHint;

  /// No description provided for @endLocationHint.
  ///
  /// In tr, this message translates to:
  /// **'Örn: Ankara, Çankaya'**
  String get endLocationHint;

  /// No description provided for @loadWeightHint.
  ///
  /// In tr, this message translates to:
  /// **'Örn: 500'**
  String get loadWeightHint;

  /// No description provided for @pleaseEnterStartLocation.
  ///
  /// In tr, this message translates to:
  /// **'Lütfen başlangıç konumu girin'**
  String get pleaseEnterStartLocation;

  /// No description provided for @pleaseEnterEndLocation.
  ///
  /// In tr, this message translates to:
  /// **'Lütfen bitiş konumu girin'**
  String get pleaseEnterEndLocation;

  /// No description provided for @pleaseEnterLoadWeight.
  ///
  /// In tr, this message translates to:
  /// **'Lütfen yük ağırlığı girin'**
  String get pleaseEnterLoadWeight;

  /// No description provided for @pleaseEnterValidNumber.
  ///
  /// In tr, this message translates to:
  /// **'Lütfen geçerli bir sayı girin'**
  String get pleaseEnterValidNumber;

  /// No description provided for @estimatedPrice.
  ///
  /// In tr, this message translates to:
  /// **'Tahmini Fiyat'**
  String get estimatedPrice;

  /// No description provided for @vehicle.
  ///
  /// In tr, this message translates to:
  /// **'Araç'**
  String get vehicle;

  /// No description provided for @load.
  ///
  /// In tr, this message translates to:
  /// **'Yük'**
  String get load;

  /// No description provided for @kg.
  ///
  /// In tr, this message translates to:
  /// **'kg'**
  String get kg;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
