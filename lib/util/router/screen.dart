enum Screens {
  login,
  register,
  dashboard,
  profile,
  settings,
  about,
  requests,
  donations,
  addRequest,
  addDonation,
  medication,
  listOfRequestsDonations,
  adminMedicationRequestsDonations,
  doctors,
}

extension Routes on Screens {
  String get route {
    switch (this) {
      case Screens.login:
        return '/login';
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
      case Screens.medication:
        return '/medication';
      case Screens.doctors:
        return '/doctors';
      case Screens.listOfRequestsDonations:
        return '/list-of-requests-donations';
      case Screens.adminMedicationRequestsDonations:
        return '/admin-medication-requests-donations';
    }
  }

  String get name {
    switch (this) {
      case Screens.login:
        return 'Login';
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
      case Screens.medication:
        return 'Medication';
      case Screens.doctors:
        return 'Doctors';
      case Screens.listOfRequestsDonations:
        return 'List of Requests Donations';
      case Screens.adminMedicationRequestsDonations:
        return 'Admin Medication Requests Donations';
    }
  }
}
