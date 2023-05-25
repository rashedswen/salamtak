import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @app_name.
  ///
  /// In en, this message translates to:
  /// **'Salamtak'**
  String get app_name;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy_policy;

  /// No description provided for @medication_name.
  ///
  /// In en, this message translates to:
  /// **'Medication Name'**
  String get medication_name;

  /// No description provided for @medication_quantity.
  ///
  /// In en, this message translates to:
  /// **'Medication Quantity'**
  String get medication_quantity;

  /// No description provided for @medication_expiry_date.
  ///
  /// In en, this message translates to:
  /// **'Medication Expiry Date'**
  String get medication_expiry_date;

  /// No description provided for @extra_description.
  ///
  /// In en, this message translates to:
  /// **'Extra Description'**
  String get extra_description;

  /// No description provided for @medication_image.
  ///
  /// In en, this message translates to:
  /// **'Medication Image (Optional)'**
  String get medication_image;

  /// No description provided for @upload_image.
  ///
  /// In en, this message translates to:
  /// **'Upload Image'**
  String get upload_image;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @add_donation.
  ///
  /// In en, this message translates to:
  /// **'Add Donation'**
  String get add_donation;

  /// No description provided for @donation.
  ///
  /// In en, this message translates to:
  /// **'Donation'**
  String get donation;

  /// No description provided for @your_donation_has_been_added_successfully.
  ///
  /// In en, this message translates to:
  /// **'Your Donation has been added successfully'**
  String get your_donation_has_been_added_successfully;

  /// No description provided for @add_request.
  ///
  /// In en, this message translates to:
  /// **'Add Request'**
  String get add_request;

  /// No description provided for @request.
  ///
  /// In en, this message translates to:
  /// **'Request'**
  String get request;

  /// No description provided for @your_request_has_been_added_successfully.
  ///
  /// In en, this message translates to:
  /// **'Your Request has been added successfully'**
  String get your_request_has_been_added_successfully;

  /// No description provided for @prescription_image.
  ///
  /// In en, this message translates to:
  /// **'Prescription Image (Optional)'**
  String get prescription_image;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Signup'**
  String get signup;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgot_password;

  /// No description provided for @dont_have_an_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dont_have_an_account;

  /// No description provided for @have_an_account.
  ///
  /// In en, this message translates to:
  /// **'Have an account?'**
  String get have_an_account;

  /// No description provided for @login_as_guest.
  ///
  /// In en, this message translates to:
  /// **'Login as Guest'**
  String get login_as_guest;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @reject.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get reject;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @medication_details.
  ///
  /// In en, this message translates to:
  /// **'Medication Details'**
  String get medication_details;

  /// No description provided for @request_type.
  ///
  /// In en, this message translates to:
  /// **'Request Type'**
  String get request_type;

  /// No description provided for @created_date.
  ///
  /// In en, this message translates to:
  /// **'Created Date'**
  String get created_date;

  /// No description provided for @updated_date.
  ///
  /// In en, this message translates to:
  /// **'Updated Date'**
  String get updated_date;

  /// No description provided for @image.
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get image;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @i_can_help.
  ///
  /// In en, this message translates to:
  /// **'I can help'**
  String get i_can_help;

  /// No description provided for @i_need_it.
  ///
  /// In en, this message translates to:
  /// **'I need it'**
  String get i_need_it;

  /// No description provided for @report.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get report;

  /// No description provided for @request_sent_successfully.
  ///
  /// In en, this message translates to:
  /// **'Request sent successfully'**
  String get request_sent_successfully;

  /// No description provided for @recent_requests_and_donations.
  ///
  /// In en, this message translates to:
  /// **'Recent Requests and Donations'**
  String get recent_requests_and_donations;

  /// No description provided for @view_all.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get view_all;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @adminPanel.
  ///
  /// In en, this message translates to:
  /// **'Admin Panel'**
  String get adminPanel;

  /// No description provided for @continue_with_twitter.
  ///
  /// In en, this message translates to:
  /// **'Continue with Twitter'**
  String get continue_with_twitter;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @changes_will_be_saved_soon.
  ///
  /// In en, this message translates to:
  /// **'Changes will be saved soon'**
  String get changes_will_be_saved_soon;

  /// No description provided for @medications.
  ///
  /// In en, this message translates to:
  /// **'Medications'**
  String get medications;

  /// No description provided for @donaters.
  ///
  /// In en, this message translates to:
  /// **'Donaters'**
  String get donaters;

  /// No description provided for @needers.
  ///
  /// In en, this message translates to:
  /// **'Needers'**
  String get needers;

  /// No description provided for @helpers.
  ///
  /// In en, this message translates to:
  /// **'Helpers'**
  String get helpers;

  /// No description provided for @link_with_email.
  ///
  /// In en, this message translates to:
  /// **'Link with Email'**
  String get link_with_email;

  /// No description provided for @linked_successfully.
  ///
  /// In en, this message translates to:
  /// **'Linked successfully'**
  String get linked_successfully;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @the_request_was_not_accepted_by_any_user.
  ///
  /// In en, this message translates to:
  /// **'The request was not accepted by any user'**
  String get the_request_was_not_accepted_by_any_user;

  /// No description provided for @link_with_twitter.
  ///
  /// In en, this message translates to:
  /// **'Link with Twitter'**
  String get link_with_twitter;

  /// No description provided for @delete_account.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get delete_account;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @delete_account_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account?'**
  String get delete_account_confirmation;

  /// No description provided for @login_to_continue.
  ///
  /// In en, this message translates to:
  /// **'Login to continue'**
  String get login_to_continue;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @welcome_to_salamtak.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Salamtak'**
  String get welcome_to_salamtak;

  /// No description provided for @welcome_to_salamtak_description.
  ///
  /// In en, this message translates to:
  /// **'Salamtak is a platform that connects people who need medications with people who can help them'**
  String get welcome_to_salamtak_description;

  /// No description provided for @continue_with_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Continue with Phone Number'**
  String get continue_with_phone_number;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @type_medication_name.
  ///
  /// In en, this message translates to:
  /// **'Type medication name ...'**
  String get type_medication_name;

  /// No description provided for @more_info.
  ///
  /// In en, this message translates to:
  /// **'More Info'**
  String get more_info;

  /// No description provided for @no_description.
  ///
  /// In en, this message translates to:
  /// **'No Description'**
  String get no_description;

  /// No description provided for @level_of_need.
  ///
  /// In en, this message translates to:
  /// **'Level of Need'**
  String get level_of_need;

  /// No description provided for @medication_type.
  ///
  /// In en, this message translates to:
  /// **'Medication Type'**
  String get medication_type;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @not_set.
  ///
  /// In en, this message translates to:
  /// **'Not Set'**
  String get not_set;

  /// No description provided for @requests_status.
  ///
  /// In en, this message translates to:
  /// **'Requests Status'**
  String get requests_status;

  /// No description provided for @signup_with_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Signup with Phone Number'**
  String get signup_with_phone_number;

  /// No description provided for @sent_otp.
  ///
  /// In en, this message translates to:
  /// **'Sent OTP'**
  String get sent_otp;

  /// No description provided for @no_requests_found.
  ///
  /// In en, this message translates to:
  /// **'No Requests Found'**
  String get no_requests_found;

  /// No description provided for @medication_not_found.
  ///
  /// In en, this message translates to:
  /// **'Medication Not Found'**
  String get medication_not_found;

  /// No description provided for @please_login_to_continue.
  ///
  /// In en, this message translates to:
  /// **'Please login to continue'**
  String get please_login_to_continue;

  /// No description provided for @contact_us.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contact_us;

  /// No description provided for @continue_with_apple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get continue_with_apple;

  /// No description provided for @exchange.
  ///
  /// In en, this message translates to:
  /// **'Exchange'**
  String get exchange;

  /// No description provided for @medication_wanted_in_exchange.
  ///
  /// In en, this message translates to:
  /// **'Medication Wanted in Exchange'**
  String get medication_wanted_in_exchange;

  /// No description provided for @medication_offered_in_exchange.
  ///
  /// In en, this message translates to:
  /// **'Medication Offered in Exchange'**
  String get medication_offered_in_exchange;

  /// No description provided for @exhange_wanted_medication_image.
  ///
  /// In en, this message translates to:
  /// **'Exchange Wanted Medication Image (Optional)'**
  String get exhange_wanted_medication_image;

  /// No description provided for @exhange_offered_medication_image.
  ///
  /// In en, this message translates to:
  /// **'Exchange Offered Medication Image (Optional)'**
  String get exhange_offered_medication_image;

  /// No description provided for @wanted_exchange_medication_type.
  ///
  /// In en, this message translates to:
  /// **'Wanted Exchange Medication Type'**
  String get wanted_exchange_medication_type;

  /// No description provided for @offered_exchange_medication_type.
  ///
  /// In en, this message translates to:
  /// **'Offered Exchange Medication Type'**
  String get offered_exchange_medication_type;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
