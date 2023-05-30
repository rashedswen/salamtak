enum Screens {
  login,
  loginWithPhoneNumber,
  register,
  dashboard,
  profile,
  settings,
  about,
  requests,
  donations,
  addRequest,
  addDonation,
  addExchange,
  medicationDetails,
  requestsAndDonationslist,
  approveMedicationsRequests,
  adminMedicationRequestsDonations,
  doctors,
  userHistory,
  privacyPolicy,
  deleteAccount,
}

extension Routes on Screens {
  String get route {
    switch (this) {
      case Screens.login:
        return '/login';
      case Screens.loginWithPhoneNumber:
        return '/login-with-phone-number';
      case Screens.register:
        return '/register';
      case Screens.dashboard:
        return '/dashboard';
      case Screens.profile:
        return '/profile';
      case Screens.settings:
        return '/settings';
      case Screens.about:
        return '/about';
      case Screens.requests:
        return '/requests';
      case Screens.donations:
        return '/donations';
      case Screens.addRequest:
        return '/add-request';
      case Screens.addDonation:
        return '/add-donation';
      case Screens.addExchange:
        return '/add-exchange';
      case Screens.requestsAndDonationslist:
        return '/requests-donations-list';
      case Screens.doctors:
        return '/doctors';
      case Screens.approveMedicationsRequests:
        return '/approve-medication-requests';
      case Screens.adminMedicationRequestsDonations:
        return '/admin-medication-requests-donations';
      case Screens.medicationDetails:
        return '/medication-details';
      case Screens.userHistory:
        return '/user-history';
      case Screens.privacyPolicy:
        return '/privacy-policy';
      case Screens.deleteAccount:
        return '/delete-account';
    }
  }

  String get name {
    switch (this) {
      case Screens.login:
        return 'Login';
      case Screens.loginWithPhoneNumber:
        return 'Login With Phone Number';
      case Screens.register:
        return 'Register';
      case Screens.dashboard:
        return 'Dashboard';
      case Screens.profile:
        return 'Profile';
      case Screens.settings:
        return 'Settings';
      case Screens.about:
        return 'About';
      case Screens.requests:
        return 'Requests';
      case Screens.donations:
        return 'Donations';
      case Screens.addRequest:
        return 'Add Request';
      case Screens.addDonation:
        return 'Add Donation';
      case Screens.addExchange:
        return 'Add Exchange';
      case Screens.requestsAndDonationslist:
        return 'Requests Donations List';
      case Screens.doctors:
        return 'Doctors';
      case Screens.approveMedicationsRequests:
        return 'Approve Medications Requests';
      case Screens.adminMedicationRequestsDonations:
        return 'Admin Medication Requests Donations';
      case Screens.medicationDetails:
        return 'Medication Details';
      case Screens.userHistory:
        return 'User History';
      case Screens.privacyPolicy:
        return 'Privacy Policy';
      case Screens.deleteAccount:
        return 'Delete Account';
    }
  }
}
