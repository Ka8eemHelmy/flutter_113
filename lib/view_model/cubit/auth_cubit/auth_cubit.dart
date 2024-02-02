import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_113/view_model/data/local/shared_helper.dart';
import 'package:flutter_113/view_model/data/local/shared_keys.dart';
import 'package:flutter_113/view_model/data/network/dio_helper.dart';
import 'package:flutter_113/view_model/data/network/end_points.dart';
import 'package:flutter_113/view_model/utils/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool obscure = true;
  bool confirmObscure = true;

  void changeObscure() {
    obscure = !obscure;
    emit(ChangeObscureState());
  }

  void changeConfirmObscure() {
    confirmObscure = !confirmObscure;
    emit(ChangeObscureState());
  }

  Future<void> login() async {
    emit(LoginLoadingState());
    await DioHelper.post(
      endPoint: EndPoints.login,
      body: {
        'email': emailController.text,
        'password': passwordController.text,
      },
    ).then((value) async {
      await SharedHelper.set(key: SharedKeys.token, value: value.data['data']['token']);
      await SharedHelper.set(key: SharedKeys.userId, value: value.data['data']['user']['id']);
      await SharedHelper.set(key: SharedKeys.userName, value: value.data['data']['user']['name']);
      await SharedHelper.set(key: SharedKeys.userEmail, value: value.data['data']['user']['email']);
      emit(LoginSuccessState());
    }).catchError((error) {
      print(error.response?.data.toString());
      if(error is DioException){
        showToast(error.response?.data['message'].toString() ?? 'Error on Login', color: Colors.red,);
      }
      emit(LoginErrorState());
      throw error;
    });
  }

  Future<void> register() async {
    emit(RegisterLoadingState());
    await DioHelper.post(
      endPoint: EndPoints.register,
      body: {
        'name' : nameController.text,
        'email' : emailController.text,
        'password' : passwordController.text,
        'password_confirmation' : confirmPasswordController.text,
      },
    ).then((value) {
      print(value.data);
      emit(RegisterSuccessState());
    }).catchError((error){
      print(error);
      emit(RegisterErrorState());
      throw error;
    });
  }
}
