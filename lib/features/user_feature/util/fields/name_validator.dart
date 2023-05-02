import 'package:formz/formz.dart';

enum NameValidationError { isEmpty, shouldContainOnlyLetters }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('');
  const Name.dirty([super.value = '']) : super.dirty();

  @override
  NameValidationError? validator(String? value) {
    if (value!.isEmpty) return NameValidationError.isEmpty;
    // arabic and english letters
    if (!RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$').hasMatch(value)) {
      return NameValidationError.shouldContainOnlyLetters;
    }
    return null;
  }
}
