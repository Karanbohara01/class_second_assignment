// simple_interest_state.dart

part of 'simple_interest_bloc.dart';

sealed class SimpleInterestState extends Equatable {
  const SimpleInterestState();

  @override
  List<Object> get props => [];
}

class SimpleInterestInitial extends SimpleInterestState {}

class SimpleInterestLoading extends SimpleInterestState {}

class SimpleInterestResult extends SimpleInterestState {
  final double interest;

  const SimpleInterestResult(this.interest);

  @override
  List<Object> get props => [interest];
}

class SimpleInterestError extends SimpleInterestState {
  final String error;

  const SimpleInterestError(this.error);

  @override
  List<Object> get props => [error];
}
