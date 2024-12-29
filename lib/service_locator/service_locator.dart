import 'package:class_assignment_second/bloc/area_of_circle_bloc.dart';
import 'package:class_assignment_second/bloc/simple_interest_bloc.dart';
import 'package:class_assignment_second/bloc/student_bloc.dart';
import 'package:class_assignment_second/cubit/dashboard_cubit.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initBloc();
  _initCubit();
}

void _initBloc() {
  serviceLocator
      .registerFactory<SimpleInterestBloc>(() => SimpleInterestBloc());
  serviceLocator.registerFactory<AreaOfCircleBloc>(() => AreaOfCircleBloc());
  serviceLocator.registerFactory<StudentBloc>(() => StudentBloc());
}

_initCubit() {
  serviceLocator.registerLazySingleton<DashboardCubit>(
    () => DashboardCubit(
      serviceLocator<SimpleInterestBloc>(),
      serviceLocator<AreaOfCircleBloc>(),
      serviceLocator<StudentBloc>(),
    ),
  );
}
