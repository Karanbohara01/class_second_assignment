import 'package:class_assignment_second/bloc/student_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentView extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  StudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Student")),
      body: BlocProvider(
        create: (context) => StudentBloc(),
        child: BlocBuilder<StudentBloc, StudentState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: firstNameController,
                    decoration: InputDecoration(labelText: 'First Name'),
                  ),
                  TextField(
                    controller: lastNameController,
                    decoration: InputDecoration(labelText: 'Last Name'),
                  ),
                  TextField(
                    controller: addressController,
                    decoration: InputDecoration(labelText: 'Address'),
                  ),
                  TextField(
                    controller: ageController,
                    decoration: InputDecoration(labelText: 'Age'),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final firstName = firstNameController.text;
                      final lastName = lastNameController.text;
                      final address = addressController.text;
                      final age = int.tryParse(ageController.text) ?? 0;

                      if (firstName.isNotEmpty &&
                          lastName.isNotEmpty &&
                          address.isNotEmpty &&
                          age > 0) {
                        context.read<StudentBloc>().add(AddStudent(
                              firstName: firstName,
                              lastName: lastName,
                              address: address,
                              age: age,
                            ));
                      }
                    },
                    child: Text("Submit"),
                  ),
                  SizedBox(height: 20),
                  state is StudentsLoaded
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: state.students.length,
                            itemBuilder: (context, index) {
                              final student = state.students[index];
                              return ListTile(
                                title: Text(
                                    '${student.firstName} ${student.lastName}'),
                                subtitle: Text(
                                    'Age: ${student.age}, Address: ${student.address}'),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      ),
                                      onPressed: () {
                                        firstNameController.text =
                                            student.firstName;
                                        lastNameController.text =
                                            student.lastName;
                                        addressController.text =
                                            student.address;
                                        ageController.text =
                                            student.age.toString();
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      : Container(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
