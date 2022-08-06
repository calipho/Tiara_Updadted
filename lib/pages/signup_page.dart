import 'dart:io';
import 'package:bank_project/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/auth_providers.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

File? _image;

class _SignupPageState extends State<SignupPage> {
  // @override

  final _picker = ImagePicker();
  // bool _rememberMe = false;
  final username = TextEditingController();

  final password = TextEditingController();

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: username,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: 'Username',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: password,
            obscureText: true,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  // Widget _buildForgotPasswordBtn() {
  Widget _buildSignupBtn() {
    return Consumer<AuthProviders>(builder: (context, auth, child) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () async {
            await context.read<AuthProviders>().signUp(User(
                  username: username.text,
                  password: password.text,
                ));

            context.go("/home");
          },
          // padding: EdgeInsets.all(15.0),
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(30.0),
          // ),
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(), primary: Colors.white),
          child: const Text(
            'Sign up',
            style: TextStyle(
              color: Color(0xFF527DAA),
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      );
    });
  }

  // Widget _buildSignInWithText() {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 187, 190, 194),
                      Color.fromARGB(255, 190, 175, 146),
                      Color.fromARGB(255, 229, 214, 179),
                      Color.fromARGB(255, 248, 228, 192),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final pickedFile = await _picker.pickImage(
                            source: ImageSource.gallery,
                          );
                          // if (pickedFile != null) {
                          setState(() {
                            _image = File(pickedFile!.path);
                          });
                          // }
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 221, 232, 241),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: _image != null
                              ? Image.file(
                                  _image!,
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.fitHeight,
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          Color.fromARGB(255, 188, 185, 175)),
                                  width: 200,
                                  height: 200,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[800],
                                  ),
                                ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Please Assign your Profile Picture",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 30.0),
                      _buildEmailTF(),
                      const SizedBox(
                        height: 10.0,
                      ),
                      _buildPasswordTF(),
                      // _buildForgotPasswordBtn(),
                      // _buildRememberMeCheckbox(),
                      _buildSignupBtn(),
                      // _buildSignInWithText(),
                      GestureDetector(
                        onTap: () => context.go("/home"),
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Do you have an Account? ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
