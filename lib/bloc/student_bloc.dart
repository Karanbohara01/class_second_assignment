import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  List<Student> students = [];

  StudentBloc() : super(StudentInitial()) {
    on<AddStudent>((event, emit) {
      final student = Student(
        firstName: event.firstName,
        lastName: event.lastName,
        address: event.address,
        age: event.age,
      );

      students.add(student);

      emit(StudentsLoaded(students: List.from(students)));
    });
  }
}
