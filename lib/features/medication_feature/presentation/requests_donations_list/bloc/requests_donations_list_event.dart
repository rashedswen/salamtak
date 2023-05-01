part of 'requests_donations_list_bloc.dart';

abstract class RequestsDonationsListEvent extends Equatable {
  const RequestsDonationsListEvent();

  @override
  List<Object> get props => [];

}

class GetListOfMedicationsRequestDonation extends RequestsDonationsListEvent {

}
