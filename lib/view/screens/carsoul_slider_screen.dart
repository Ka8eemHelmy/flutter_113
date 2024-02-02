import 'dart:convert';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_113/view_model/cubit/theme_cubit/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/login_screen.dart';

class CarouselSliderScreen extends StatefulWidget {
  const CarouselSliderScreen({Key? key}) : super(key: key);

  @override
  State<CarouselSliderScreen> createState() => _CarouselSliderScreenState();
}

class _CarouselSliderScreenState extends State<CarouselSliderScreen> {
  @override
  void initState() {
    super.initState();
    getHttpRequest();
  }

  void getHttpRequest() async {
    final Dio dio = Dio();

    dio.options.headers = {};
    final Response response = await dio.get(
      'https://newsapi.org/v2/everything',
      queryParameters: {
        'q' : 'accidents',
        'apiKey' : 'dba90520a2b243ffaaa8296d5b973d47'
      },
      data: {},
    );
    log(jsonEncode(response.data));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.add,
            ),
          ),
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              var cubit = ThemeCubit.get(context);
              return IconButton(
                onPressed: () {
                  cubit.changeTheme();
                },
                icon: Icon(
                  cubit.isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 1.9,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
              ),
              items: List.generate(
                9,
                (index) => Image.network(
                  'https://picsum.photos/250?image=$index',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(),
          ],
        ),
      ),
    );
  }
}
