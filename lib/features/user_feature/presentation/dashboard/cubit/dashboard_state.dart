part of 'dashboard_cubit.dart';

/// {@template dashboard}
/// DashboardState description
/// {@endtemplate}
class DashboardState extends Equatable {
  /// {@macro dashboard}
  const DashboardState({
    this.medicationItems,
    this.errorMessage = 'Default Value',
  });

  final List<MedicationItem>? medicationItems;
  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage, medicationItems];

  /// Creates a copy of the current DashboardState with property changes
  DashboardState copyWith({
    List<MedicationItem>? medicationItems,
    String? errorMessage,
  }) {
    return DashboardState(
      medicationItems: medicationItems ?? this.medicationItems,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

/// {@template dashboard_initial}
/// The initial state of DashboardState
/// {@endtemplate}
class DashboardInitial extends DashboardState {
  /// {@macro dashboard_initial}
  const DashboardInitial() : super();
}

class DashboardLoading extends DashboardState {
  const DashboardLoading() : super();
}

class DashboardLoaded extends DashboardState {
  const DashboardLoaded({
    required List<MedicationItem> medicationItems,
  }) : super(medicationItems: medicationItems);
}

class DashboardError extends DashboardState {
  const DashboardError({
    required super.errorMessage,
  });
}


