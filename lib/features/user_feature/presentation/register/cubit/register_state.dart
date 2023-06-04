part of 'register_cubit.dart';

class RegisterState extends Equatable with FormzMixin {
  RegisterState({
    this.name = const Name.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.address = const Address.pure(),
    this.phoneNumber = const PhoneNumber.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage,
    this.location,
  });

  final Name name;
  final Email email;
  final Password password;
  final Address address;
  final PhoneNumber phoneNumber;
  final LocationSudan? location;
  final FormzSubmissionStatus status;
  final String? errorMessage;

  @override
  List<Object?> get props => [
        email,
        password,
        status,
        errorMessage,
        address,
        location,
        name,
        phoneNumber
      ];

  RegisterState copyWith({
    Name? name,
    Email? email,
    Password? password,
    Address? address,
    PhoneNumber? phoneNumber,
    FormzSubmissionStatus? status,
    String? errorMessage,
    LocationSudan? location,
  }) {
    return RegisterState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      location: location ?? this.location,
    );
  }

  @override
  List<FormzInput> get inputs => [
        name,
        email,
        password,
        // address,
        phoneNumber,
      ];
}

class RegisterInitial extends RegisterState {
  RegisterInitial({required LocationSudan location})
      : super(location: location);
}
