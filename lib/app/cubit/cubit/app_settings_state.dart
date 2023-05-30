part of 'app_settings_cubit.dart';

class AppSettingsState extends Equatable {
  const AppSettingsState({
    this.isDarkMode = false,
  });

  final bool isDarkMode;

  AppSettingsState copyWith({
    bool? isDarkMode,
  }) {
    return AppSettingsState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }

  @override
  List<Object> get props => [isDarkMode];
}

class AppSettingsInitial extends AppSettingsState {}
