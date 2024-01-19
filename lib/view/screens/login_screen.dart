import 'package:flutter/material.dart';
import 'package:flutter_113/view/screens/instagram/instagram_screen.dart';
import 'package:flutter_113/view_model/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter_113/view_model/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    print('Build Function Called');
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: emailController,
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
                      controller: passwordController,
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
                            setState(() {
                              obscure = !obscure;
                            });
                          },
                          icon: Icon(
                            obscure ? Icons.visibility : Icons.visibility_off_rounded,
                            color: obscure ? Colors.purple : Colors.grey,
                          ),
                        ),
                      ),
                      obscureText: obscure,
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
                        } else if (!RegExp(r'[A-Z]').hasMatch(value!)) {
                          return 'Password Must Contain At Least One Capital Letter';
                        } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                          return 'Password Must Contain At Least One Number';
                        } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                          return 'Password Must Contain At Least One Special Character';
                        } else if ((value.length) < 8) {
                          return "Password Can't Be Less Than 8 Characters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InstagramScreen(),
                          ),
                              (route) => false,
                        );
                        // if(formKey.currentState!.validate()){
                        //   print(emailController.text);
                        //   print(passwordController.text);
                        //   Fluttertoast.showToast(
                        //       msg: "Login Successfully",
                        //       toastLength: Toast.LENGTH_LONG,
                        //       gravity: ToastGravity.BOTTOM,
                        //       timeInSecForIosWeb: 2,
                        //       backgroundColor: Colors.purple,
                        //       textColor: Colors.white,
                        //       fontSize: 16.0,
                        //   );
                        // }
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
