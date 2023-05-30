import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_settings_state.dart';

class AppSettingsCubit extends Cubit<AppSettingsState> {
  AppSettingsCubit() : super(AppSettingsInitial());

  void changeTheme({bool isDarkMode = false}) {
    emit(state.copyWith(isDarkMode: isDarkMode));
  }
  
}
