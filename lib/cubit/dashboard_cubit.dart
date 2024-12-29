import 'package:class_assignment_second/bloc/area_of_circle_bloc.dart';
import 'package:class_assignment_second/bloc/simple_interest_bloc.dart';
import 'package:class_assignment_second/bloc/student_bloc.dart';
import 'package:class_assignment_second/view/area_of_circle_view.dart';
import 'package:class_assignment_second/view/simple_interest_view.dart';
import 'package:class_assignment_second/view/student_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<void> {
  DashboardCubit(
    this._simpleInterestBloc,
    this._areaOfCircleBloc,
    this._studentBloc,
  ) : super(null);

  final SimpleInterestBloc _simpleInterestBloc;
  final AreaOfCircleBloc _areaOfCircleBloc;
  final StudentBloc _studentBloc;

  void openSimpleInterestView(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _simpleInterestBloc,
            child: SimpleInterestView(),
          ),
        ));
  }

  void openAreaOfCircleView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _areaOfCircleBloc,
          child: AreaOfCircleView(),
        ),
      ),
    );
  }

  void openStudentListView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _studentBloc,
          child: StudentView(),
        ),
      ),
    );
  }
}
