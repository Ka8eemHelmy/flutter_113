import 'package:flutter/material.dart';
import 'package:flutter_113/view/components/widgets/text_custom.dart';
import 'package:flutter_113/view/screens/auth/register_screen.dart';
import 'package:flutter_113/view/screens/instagram/instagram_screen.dart';
import 'package:flutter_113/view/screens/news/news_screen.dart';
import 'package:flutter_113/view/screens/tasks/task_screen.dart';
import 'package:flutter_113/view_model/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter_113/view_model/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)   => AuthCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: cubit.emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.purple,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.yellow,
                          ),
                        ),
                        hintText: 'Enter Your Email',
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.purple,
                        ),
                        prefixIcon: Icon(Icons.email, color: Colors.purple),
                      ),
                      validator: (value) {
                        if ((value ?? '').isEmpty) {
                          return 'Please, Enter Your Email';
                        } else if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value!)) {
                          return 'Please, Enter Valid Email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: cubit.passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.purple,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.yellow,
                          ),
                        ),
                        hintText: 'Enter Your Password',
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.purple,
                        ),
                        prefixIcon: Icon(Icons.password, color: Colors.purple),
                        suffixIcon: IconButton(
                          onPressed: () {
                            cubit.changeObscure();
                          },
                          icon: Icon(
                            cubit.obscure ? Icons.visibility : Icons.visibility_off_rounded,
                            color: cubit.obscure ? Colors.purple : Colors.grey,
                          ),
                        ),
                      ),
                      obscureText: cubit.obscure,
                      obscuringCharacter: '*',
                      onFieldSubmitted: (value) {
                        print(value);
                      },
                      onChanged: (value) {
                        print(value);
                      },
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if ((value ?? '').isEmpty) {
                          return 'Please, Enter Your Password';
                        }
                        // else if (!RegExp(r'[A-Z]').hasMatch(value!)) {
                        //   return 'Password Must Contain At Least One Capital Letter';
                        // } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                        //   return 'Password Must Contain At Least One Number';
                        // } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                        //   return 'Password Must Contain At Least One Special Character';
                        // } else if ((value.length) < 8) {
                        //   return "Password Can't Be Less Than 8 Characters";
                        // }
                        return null;
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      child: TextCustom(
                        text: 'Register',
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.pushAndRemoveUntil(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => InstagramScreen(),
                        //   ),
                        //       (route) => false,
                        // );
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.loginFireBase().then((value) {
                            Fluttertoast.showToast(
                              msg: "Login Successfully",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.purple,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TasksScreen(),
                              ),
                              // (route) => false,
                            );
                          });
                        }
                      },
                      child: Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
