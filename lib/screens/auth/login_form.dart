import 'package:desain/bloc/login_bloc/login_bloc.dart';
import 'package:desain/repositories/repositories.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:desain/style/theme.dart' as Style;

class LoginForm extends StatefulWidget {
  final UserRepository userRepository;

  const LoginForm({Key? key, required this.userRepository}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState(userRepository);
}

class _LoginFormState extends State<LoginForm> {
  final UserRepository userRepository;

  _LoginFormState(this.userRepository);

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          email: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Login failed."),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 80.0),
            child: Form(
              child: Column(
                children: [
                  Container(
                      height: 200.0,
                      padding: EdgeInsets.only(bottom: 20.0, top: 40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "AUTH WITH REST",
                            style: TextStyle(
                                color: Style.Colors.mainColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "Login app using BLOC pattern and REST API",
                            style: TextStyle(
                                fontSize: 10.0, color: Colors.black38),
                          )
                        ],
                      )),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Style.Colors.titleColor,
                        fontWeight: FontWeight.bold),
                    controller: _usernameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon:
                          Icon(EvaIcons.emailOutline, color: Colors.black26),
                      enabledBorder: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(30.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              new BorderSide(color: Style.Colors.mainColor),
                          borderRadius: BorderRadius.circular(30.0)),
                      contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                      labelText: "E-Mail",
                      hintStyle: TextStyle(
                          fontSize: 12.0,
                          color: Style.Colors.grey,
                          fontWeight: FontWeight.w500),
                      labelStyle: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    autocorrect: false,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Style.Colors.titleColor,
                        fontWeight: FontWeight.bold),
                    controller: _passwordController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        EvaIcons.lockOutline,
                        color: Colors.black26,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(30.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              new BorderSide(color: Style.Colors.mainColor),
                          borderRadius: BorderRadius.circular(30.0)),
                      contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                      labelText: "Password",
                      hintStyle: TextStyle(
                          fontSize: 12.0,
                          color: Style.Colors.grey,
                          fontWeight: FontWeight.w500),
                      labelStyle: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    autocorrect: false,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: new InkWell(
                        child: new Text(
                          "Forget password?",
                          style:
                              TextStyle(color: Colors.black45, fontSize: 12.0),
                        ),
                        onTap: () {}),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                            height: 45,
                            child: state is LoginLoading
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Center(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 25.0,
                                            width: 25.0,
                                            child: CupertinoActivityIndicator(),
                                          )
                                        ],
                                      ))
                                    ],
                                  )
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Style.Colors.mainColor,
                                      disabledBackgroundColor:
                                          Style.Colors.mainColor,
                                      disabledForegroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                    onPressed: _onLoginButtonPressed,
                                    child: Text("LOG IN",
                                        style: new TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)))),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Or connect using",
                        style: TextStyle(color: Colors.black26, fontSize: 12.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        // height: 40.0,
                        // width: 180.0,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF385c8e),
                              disabledBackgroundColor: Style.Colors.mainColor,
                              disabledForegroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            onPressed: _onLoginButtonPressed,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  EvaIcons.facebook,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text("Facebook",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ],
                            )),
                      ),
                      SizedBox(width: 30,),
                      Flexible(
                        // width: 180.0,
                        // height: 40.0,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFf14436),
                              disabledBackgroundColor: Style.Colors.mainColor,
                              disabledForegroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  EvaIcons.google,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text("Google",
                                    style: new TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ],
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          padding: EdgeInsets.only(bottom: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Don't have an account?",
                                style: TextStyle(color: Style.Colors.grey),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 5.0),
                              ),
                              GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "Register",
                                    style: TextStyle(
                                        color: Style.Colors.mainColor,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
