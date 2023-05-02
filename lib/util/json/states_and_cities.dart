import 'package:equatable/equatable.dart';

final states = [
  {
    'city': 'Khartoum',
    'state': 'Khartoum',
    'city_arabic': 'الخرطوم',
    'state_arabic': 'الخرطوم',
  },
  {
    'city': 'Omdurman',
    'state': 'Khartoum',
    'city_arabic': 'أم درمان',
    'state_arabic': 'الخرطوم',
  },
  {
    'city': 'Khartoum North',
    'state': 'Khartoum',
    'city_arabic': 'الخرطوم بحري',
    'state_arabic': 'الخرطوم',
  },
  {
    'city': 'Kassala',
    'state': 'Kassala',
    'city_arabic': 'كسلا',
    'state_arabic': 'كسلا',
  },
  {
    'city': 'Port Sudan',
    'state': 'Red Sea',
    'city_arabic': 'بورتسودان',
    'state_arabic': 'البحر الأحمر',
  },
  {
    'city': 'El Obeid',
    'state': 'North Kordofan',
    'city_arabic': 'الأبيض',
    'state_arabic': 'شمال كردفان',
  },
  {
    'city': 'Gedaref',
    'state': 'Al Gedaref',
    'city_arabic': 'القضارف',
    'state_arabic': 'القضارف',
  },
  {
    'city': 'Kūstī',
    'state': 'White Nile',
    'city_arabic': 'كوستي',
    'state_arabic': 'النيل الأبيض',
  },
  {
    'city': 'Wad Medani',
    'state': 'Al Gazira',
    'city_arabic': 'ود مدني',
    'state_arabic': 'الجزيرة',
  },
  {
    'city': 'El Fasher',
    'state': 'North Darfur',
    'city_arabic': 'الفاشر',
    'state_arabic': 'شمال دارفور',
  },
  {
    'city': 'Kurmuk',
    'state': 'Blue Nile',
    'city_arabic': 'كرمك',
    'state_arabic': 'النيل الأزرق',
  },
  {
    'city': 'Nyala',
    'state': 'South Darfur',
    'city_arabic': 'نيالا',
    'state_arabic': 'جنوب دارفور',
  },
  {
    'city': 'Shendi',
    'state': 'River Nile',
    'city_arabic': 'شندي',
    'state_arabic': 'نهر النيل',
  },
  {
    'city': 'Ed Damazin',
    'state': 'Blue Nile',
    'city_arabic': 'دمازين',
    'state_arabic': 'النيل الأزرق',
  },
  {
    'city': 'Kadugli',
    'state': 'South Kordofan',
    'city_arabic': 'كادقلي',
    'state_arabic': 'جنوب كردفان',
  },
  {
    'city': 'El Geneina',
    'state': 'West Darfur',
    'city_arabic': 'الجنينة',
    'state_arabic': 'غرب دارفور',
  },
  {
    'city': 'Al Manāqil',
    'state': 'Al Gazira',
    'city_arabic': 'المناقل',
    'state_arabic': 'الجزيرة',
  },
  {
    'city': 'Atbara',
    'state': 'River Nile',
    'city_arabic': 'عطبرة',
    'state_arabic': 'نهر النيل',
  },
  {
    'city': 'Sannār',
    'state': 'Sennar',
    'city_arabic': 'سنار',
    'state_arabic': 'سنار',
  },
  {
    'city': 'An Nuhūd',
    'state': 'Western Kordofan',
    'city_arabic': 'النهود',
    'state_arabic': 'غرب كردفان',
  },
  {
    'city': 'EdDamer',
    'state': 'River Nile',
    'city_arabic': 'الدامر',
    'state_arabic': 'نهر النيل',
  },
  {
    'city': 'Ad Diwem',
    'state': 'White Nile',
    'city_arabic': 'الدويم',
    'state_arabic': 'النيل الأبيض',
  },
  {
    'city': 'Tokār',
    'state': 'Red Sea',
    'city_arabic': 'طوكر',
    'state_arabic': 'البحر الأحمر',
  },
  {
    'city': 'Umm Ruwaba',
    'state': 'North Kordofan',
    'city_arabic': 'أم روابة',
    'state_arabic': 'شمال كردفان',
  },
  {
    'city': 'Abū Ḩamad',
    'state': 'River Nile',
    'city_arabic': 'أبو حمد',
    'state_arabic': 'نهر النيل',
  },
  {
    'city': 'Berber',
    'state': 'River Nile',
    'city_arabic': 'بربر',
    'state_arabic': 'نهر النيل',
  },
  {
    'city': 'Sawākin',
    'state': 'Red Sea',
    'city_arabic': 'سواكن',
    'state_arabic': 'البحر الأحمر',
  },
  {
    'city': 'Dongola',
    'state': 'Northern',
    'city_arabic': 'دنقلا',
    'state_arabic': 'الشمالية',
  },
  {
    'city': 'Rabak',
    'state': 'White Nile',
    'city_arabic': 'ربك',
    'state_arabic': 'النيل الأبيض',
  },
  {
    'city': 'Singa',
    'state': 'Sennar',
    'city_arabic': 'سنجة',
    'state_arabic': 'سنار',
  },
  {
    'city': 'Ed Daein',
    'state': 'East Darfur',
    'city_arabic': 'الضعين',
    'state_arabic': 'شرق دارفور',
  },
  {
    'city': 'Zalingei',
    'state': 'Central Darfur',
    'city_arabic': 'زالنجي',
    'state_arabic': 'وسط دارفور',
  },
  {
    'city': 'El Fula',
    'state': 'Western Kordofan',
    'city_arabic': 'الفولة',
    'state_arabic': 'غرب كردفان',
  }
];

class LocationSudan extends Equatable {
  const LocationSudan({
    required this.city,
    required this.state,
    required this.cityArabic,
    required this.stateArabic,
    this.address,
  });
  // from json
  factory LocationSudan.fromJson(Map<String, dynamic> json) => LocationSudan(
        city: json['city'] as String,
        state: json['state'] as String,
        cityArabic: json['city_arabic'] as String,
        stateArabic: json['state_arabic'] as String,
        address: json['address'] as String?,
      );
  final String city;
  final String state;
  final String cityArabic;
  final String stateArabic;
  final String? address;

  LocationSudan copyWith({
    String? address,
  }) {
    return LocationSudan(
      city: city,
      cityArabic: cityArabic,
      state: state,
      stateArabic: state,
      address: address ?? this.address
    );
  }

  static List<LocationSudan> getSudanCities() {
    return states
        .map(
          (e) => LocationSudan(
            city: e['city'] as String,
            state: e['state'] as String,
            cityArabic: e['city_arabic'] as String,
            stateArabic: e['state_arabic'] as String,
          ),
        )
        .toList();
  }

  static List<String> getSudanStates() {
    return states.map((e) => e['state'] as String).toList();
  }

  static List<String> getSudanCitiesByState(String state) {
    return states
        .where((element) => element['state'] == state)
        .map((e) => e['city'] as String)
        .toList();
  }

  // to json
  Map<String, dynamic> toJson() => {
        'city': city,
        'state': state,
        'city_arabic': cityArabic,
        'state_arabic': stateArabic,
        'address': address
      };

  @override
  List<Object?> get props => [city, state, cityArabic, stateArabic, address];
}
