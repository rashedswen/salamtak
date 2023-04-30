part of 'dashboard_cubit.dart';

/// {@template dashboard}
/// DashboardState description
/// {@endtemplate}
class DashboardState extends Equatable {
  /// {@macro dashboard}
  const DashboardState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current DashboardState with property changes
  DashboardState copyWith({
    String? customProperty,
  }) {
    return DashboardState(
      customProperty: customProperty ?? this.customProperty,
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
