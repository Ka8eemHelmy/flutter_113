import 'package:flutter/material.dart';
import 'package:flutter_113/view/screens/instagram/instagram_screen.dart';
import 'package:flutter_113/view/screens/auth/login_screen.dart';
import 'package:flutter_113/view/screens/news/news_screen.dart';
import 'package:flutter_113/view/screens/store/store_screen.dart';
import 'package:flutter_113/view/screens/tasks/all_tasks.dart';
import 'package:flutter_113/view_model/cubit/theme_cubit/theme_cubit.dart';
import 'package:flutter_113/view_model/cubit/theme_cubit/theme_cubit.dart';
import 'package:flutter_113/view_model/data/local/shared_keys.dart';
import 'package:flutter_113/view_model/data/network/dio_helper.dart';
import 'package:flutter_113/view_model/theme/dark_theme.dart';
import 'package:flutter_113/view_model/theme/light_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'view/screens/carsoul_slider_screen.dart';
import 'view/screens/tasks/task_screen.dart';
import 'view/screens/video/video_screen.dart';
import 'view_model/cubit/news_cubit/news_cubit.dart';
import 'view_model/cubit/observer.dart';
import 'view_model/cubit/store_cubit/store_cubit.dart';
import 'view_model/cubit/tasks_cubit/tasks_cubit.dart';
import 'view_model/data/local/shared_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await SharedHelper.init();
  DioHelper.init();
  String? token = await SharedHelper.get(key: SharedKeys.token);
  print(token);
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
        BlocProvider(create: (context) => NewsCubit(),),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          var themeCubit = ThemeCubit.get(context);
          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeCubit.isDark ? ThemeMode.dark : ThemeMode.light,
            // home: VideoScreen(), 
            home: token == null ? LoginScreen() : TasksScreen(),
          );
        },
      ),
    ),
  );
}
