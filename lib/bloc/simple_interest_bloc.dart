import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'simple_interest_event.dart';
part 'simple_interest_state.dart';

class SimpleInterestBloc
    extends Bloc<SimpleInterestEvent, SimpleInterestState> {
  SimpleInterestBloc() : super(SimpleInterestInitial()) {
    on<CalculateSimpleInterest>((event, emit) async {
      emit(SimpleInterestLoading());

      try {
        await Future.delayed(Duration(seconds: 1));

        if (event.principal <= 0 || event.rate <= 0 || event.time <= 0) {
          emit(SimpleInterestError(
              "Principal, rate, and time must be greater than zero."));
        } else {
          final interest = (event.principal * event.rate * event.time) / 100;
          emit(SimpleInterestResult(interest));
        }
      } catch (e) {
        emit(SimpleInterestError("An error occurred: $e"));
      }
    });
  }
}
