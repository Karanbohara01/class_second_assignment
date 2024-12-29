part of 'area_of_circle_bloc.dart';

sealed class AreaOfCircleState extends Equatable {
  const AreaOfCircleState();

  @override
  List<Object> get props => [];
}

class AreaOfCircleInitial extends AreaOfCircleState {}

class AreaOfCircleLoading extends AreaOfCircleState {}

class AreaOfCircleResult extends AreaOfCircleState {
  final double area;

  const AreaOfCircleResult(this.area);

  @override
  List<Object> get props => [area];
}

class AreaOfCircleError extends AreaOfCircleState {
  final String error;

  const AreaOfCircleError(this.error);

  @override
  List<Object> get props => [error];
}
