part of 'area_of_circle_bloc.dart';

sealed class AreaOfCircleEvent extends Equatable {
  const AreaOfCircleEvent();

  @override
  List<Object> get props => [];
}

class CalculateArea extends AreaOfCircleEvent {
  final double radius;

  const CalculateArea(this.radius);

  @override
  List<Object> get props => [radius];
}
