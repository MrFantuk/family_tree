import 'package:family_tree/service/auth_service.dart';
import 'package:family_tree/utils/validations.dart';
import 'package:family_tree/widget/animation/bloc_animation.dart';
import 'package:family_tree/widget/text_fields/rounded_text_field.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = AuthService();
  final GlobalKey<FormState> _formLoginKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formRegKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();
  bool isLoginForm = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.blue.withOpacity(0.8),
          Colors.blue.withOpacity(0.5),
          Colors.blue
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    "Ancestors",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Создайте свое фимильное древо",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: AnimationSwitch(
                          child:
                              isLoginForm ? loginForm() : registrationForm())),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget loginForm() {
    return Form(
      key: _formLoginKey,
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 60,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                RoundedTextField(
                    // validateFunction: Validations.validateEmail,
                    textEditingController: usernameController,
                    icon: Icons.person,
                    hintText: "username",
                    isPassword: false,
                    isEmail: true),
                const SizedBox(
                  height: 20,
                ),
                RoundedTextField(
                    validateFunction: Validations.validatePassword,
                    textEditingController: passwordController,
                    icon: Icons.lock,
                    hintText: "Пароль",
                    isPassword: true,
                    isEmail: false),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "Забыли пароль?",
                textAlign: TextAlign.end,
              )),
          const SizedBox(
            height: 35,
          ),
          Row(
            children: [
              Expanded(
                child: button('Войти', onTap: () {
                  if (_formLoginKey.currentState!.validate()) {
                    _auth.login(context, usernameController.text.trim(),
                        passwordController.text.trim(), null);
                  }
                }),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  isLoginForm = !isLoginForm;
                });
              },
              child: const Text("Нет аккаунта? Зарегистрируйтесь."))
        ],
      ),
    );
  }

  Widget registrationForm() {
    return Form(
      key: _formRegKey,
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                RoundedTextField(
                    validateFunction: Validations.validateName,
                    textEditingController: usernameController,
                    icon: Icons.person,
                    hintText: "Имя пользователя",
                    isPassword: false,
                    isEmail: false),
                const SizedBox(
                  height: 20,
                ),
                RoundedTextField(
                    validateFunction: Validations.validateEmail,
                    textEditingController: emailController,
                    icon: Icons.email,
                    hintText: "email",
                    isPassword: false,
                    isEmail: true),
                const SizedBox(
                  height: 20,
                ),
                RoundedTextField(
                    validateFunction: Validations.validatePassword,
                    textEditingController: passwordController,
                    icon: Icons.lock,
                    hintText: "Пароль",
                    isPassword: true,
                    isEmail: false),
                const SizedBox(
                  height: 20,
                ),
                RoundedTextField(
                    validateFunction: validatePassword2,
                    textEditingController: password2Controller,
                    icon: Icons.lock,
                    hintText: "Подвтердите пароль",
                    isPassword: true,
                    isEmail: false),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                  child: button('Регистрация', onTap: () async {
                
                if (_formRegKey.currentState!.validate()) {
                  _auth.signUp(context,
                      username: usernameController.text.trim(),
                      password: passwordController.text.trim(),
                      email: emailController.text.trim());
                }
              })),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  isLoginForm = !isLoginForm;
                });
              },
              child: const Text("Уже есть аккаунт? Авторизируйтесь."))
        ],
      ),
    );
  }

  Widget button(String string, {Function? onTap}) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onTap as void Function()?,
        child: Container(
          height: size.width / 8,
          width: size.width / 3,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            string,
            style: TextStyle(color: Colors.white.withOpacity(.8)),
          ),
        ),
      ),
    );
  }

  String? validatePassword2(String? value) {
    if (value!.isEmpty || value != passwordController.text) {
      return 'Пароли не совпадают.';
    }
    return null;
  }
}
