import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_name => 'Salamtak';

  @override
  String get medication_name => 'Medication Name';

  @override
  String get medication_quantity => 'Medication Quantity';

  @override
  String get medication_expiry_date => 'Medication Expiry Date';

  @override
  String get extra_description => 'Extra Description';

  @override
  String get medication_image => 'Medication Image (Optional)';

  @override
  String get upload_image => 'Upload Image';

  @override
  String get city => 'City';

  @override
  String get address => 'Address';

  @override
  String get add_donation => 'Add Donation';

  @override
  String get donation => 'Donation';

  @override
  String get your_donation_has_been_added_successfully => 'Your Donation has been added successfully';

  @override
  String get add_request => 'Add Request';

  @override
  String get request => 'Request';

  @override
  String get your_request_has_been_added_successfully => 'Your Request has been added successfully';

  @override
  String get prescription_image => 'Prescription Image (Optional)';
}
