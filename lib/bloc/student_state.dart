part of 'student_bloc.dart';

sealed class StudentState extends Equatable {
  const StudentState();

  @override
  List<Object> get props => [];
}

class StudentInitial extends StudentState {}

class StudentsLoaded extends StudentState {
  final List<Student> students;

  const StudentsLoaded({required this.students});

  @override
  List<Object> get props => [students];
}

class Student {
  final String firstName;
  final String lastName;
  final String address;
  final int age;

  Student({
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.age,
  });
}
