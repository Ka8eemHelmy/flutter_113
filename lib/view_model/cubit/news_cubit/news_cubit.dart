import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_113/model/new.dart';
import 'package:flutter_113/view_model/data/network/dio_helper.dart';
import 'package:flutter_113/view_model/data/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of<NewsCubit>(context);

  TextEditingController searchController = TextEditingController();

  List<New> news = [];

  void callApiRequest() async {
    news.clear();
    emit(GetNewsLoadingState());
    await DioHelper.get(
      endPoint: EndPoints.everything,
      queryParameters: {
        'q': searchController.text,
        'apiKey': 'dba90520a2b243ffaaa8296d5b973d47',
        'language': 'ar',
      },
    ).then((value) {
      for (var i in value.data['articles']) {
        news.add(New.fromJson(i));
      }
      emit(GetNewsSuccessState());
    }).catchError((error){
      print(error);
      emit(GetNewsErrorState());
    });
  }
}
