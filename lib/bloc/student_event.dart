part of 'student_bloc.dart';

sealed class StudentEvent extends Equatable {
  const StudentEvent();

  @override
  List<Object> get props => [];
}

class AddStudent extends StudentEvent {
  final String firstName;
  final String lastName;
  final String address;
  final int age;

  const AddStudent({
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.age,
  });

  @override
  List<Object> get props => [firstName, lastName, address, age];
}
