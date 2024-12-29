// simple_interest_event.dart

part of 'simple_interest_bloc.dart';

sealed class SimpleInterestEvent extends Equatable {
  const SimpleInterestEvent();

  @override
  List<Object> get props => [];
}

class CalculateSimpleInterest extends SimpleInterestEvent {
  final double principal;
  final double rate;
  final double time;

  const CalculateSimpleInterest({
    required this.principal,
    required this.rate,
    required this.time,
  });

  @override
  List<Object> get props => [principal, rate, time];
}
