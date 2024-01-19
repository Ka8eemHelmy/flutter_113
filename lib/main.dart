import 'package:flutter/material.dart';
import 'package:flutter_113/view/screens/login_screen.dart';
import 'package:flutter_113/view/screens/store/store_screen.dart';
import 'package:flutter_113/view_model/cubit/theme_cubit/theme_cubit.dart';
import 'package:flutter_113/view_model/cubit/theme_cubit/theme_cubit.dart';
import 'package:flutter_113/view_model/theme/dark_theme.dart';
import 'package:flutter_113/view_model/theme/light_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'view/screens/carsoul_slider_screen.dart';
import 'view/screens/tasks/task_screen.dart';
import 'view_model/cubit/observer.dart';
import 'view_model/cubit/store_cubit/store_cubit.dart';
import 'view_model/cubit/tasks_cubit/tasks_cubit.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StoreCubit(),
        ),
        BlocProvider(
          create: (context) => TasksCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          var themeCubit = ThemeCubit.get(context);
          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeCubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: CarouselSliderScreen(),
          );
        },
      ),
    ),
  );
}
