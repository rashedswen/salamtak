part of 'admin_dashboard_cubit.dart';

/// {@template admin_dashboard}
/// AdminDashboardState description
/// {@endtemplate}
class AdminDashboardState extends Equatable {
  /// {@macro admin_dashboard}
  const AdminDashboardState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current AdminDashboardState with property changes
  AdminDashboardState copyWith({
    String? customProperty,
  }) {
    return AdminDashboardState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template admin_dashboard_initial}
/// The initial state of AdminDashboardState
/// {@endtemplate}
class AdminDashboardInitial extends AdminDashboardState {
  /// {@macro admin_dashboard_initial}
  const AdminDashboardInitial() : super();
}
