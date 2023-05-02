import 'package:formz/formz.dart';

enum PhoneNumberValidationError { isNotValid }

class PhoneNumber extends FormzInput<String, PhoneNumberValidationError> {
  const PhoneNumber.pure() : super.pure('');
  const PhoneNumber.dirty([super.value = '']) : super.dirty();

  @override
  PhoneNumberValidationError? validator(String? value) {
    if (value!.isEmpty) return null;
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return PhoneNumberValidationError.isNotValid;
    }
    return null;
  }
}
