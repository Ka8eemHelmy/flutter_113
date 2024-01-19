import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_113/view_model/cubit/theme_cubit/theme_cubit.dart';
import 'package:flutter_113/view_model/cubit/theme_cubit/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_screen.dart';

class CarouselSliderScreen extends StatelessWidget {
  const CarouselSliderScreen({Key? key}) : super(key: key);

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
