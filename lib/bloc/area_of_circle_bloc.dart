import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'area_of_circle_event.dart';
part 'area_of_circle_state.dart';

class AreaOfCircleBloc extends Bloc<AreaOfCircleEvent, AreaOfCircleState> {
  AreaOfCircleBloc() : super(AreaOfCircleInitial()) {
    on<CalculateArea>((event, emit) async {
      emit(AreaOfCircleLoading());

      try {
        await Future.delayed(Duration(seconds: 1));

        if (event.radius <= 0) {
          emit(AreaOfCircleError("Radius must be greater than zero."));
        } else {
          final area = 3.14159 * event.radius * event.radius;
          emit(AreaOfCircleResult(area));
        }
      } catch (e) {
        emit(AreaOfCircleError("An error occurred: $e"));
      }
    });
  }
}
