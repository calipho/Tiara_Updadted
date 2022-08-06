import 'dart:io';
import 'package:bank_project/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/auth_providers.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

File? _image;

class _ProfilePageState extends State<ProfilePage> {
  // @override

  final _picker = ImagePicker();
  // bool _rememberMe = false;
  var username = TextEditingController();

  void initState() {
    super.initState();
    // add post frame callback to update the image
    WidgetsBinding.instance.addPostFrameCallback((_) {
      username.text = context.read<AuthProviders>().user?.username ?? "";
    });
  }

  final password = TextEditingController();

  Widget _buildEmailTF() {
    return Consumer<AuthProviders>(builder: (context, auth, child) {
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
    });
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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          context.read<AuthProviders>().update(User(
                username: username.text,
                password: password.text,
              ));
          Navigator.popUntil(context, (route) {
            return route.isFirst;
          });
        },
        // padding: EdgeInsets.all(15.0),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(30.0),
        // ),
        // style: ElevatedButton.styleFrom(
        //     shape: const StadiumBorder(), primary: Colors.white),
        child: const Text(
          'Save',
          style: TextStyle(
            color: Colors.black,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  // Widget _buildSignInWithText() {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProviders>(builder: (context, auth, child) {
      return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: [
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              context.go("/home");
                            },
                            icon: const Icon(Icons.arrow_back)),
                        Center(
                          child: Column(
                            children: [
                              const Text(
                                'Edit Your Profile',
                                style: TextStyle(
                                  color: Colors.black,
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
                                  setState(() {
                                    _image = File(pickedFile!.path);
                                  });
                                },
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  margin: const EdgeInsets.only(top: 20),
                                  decoration:
                                      BoxDecoration(color: Colors.blue[200]),
                                  child:
                                      auth.user?.image != null && _image == null
                                          ? Image.network(
                                              auth.user!.image!,
                                              width: 200.0,
                                              height: 200.0,
                                              fit: BoxFit.fitHeight,
                                            )
                                          : _image != null
                                              ? Image.file(
                                                  _image!,
                                                  width: 200.0,
                                                  height: 200.0,
                                                  fit: BoxFit.fitHeight,
                                                )
                                              : Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.blue[200]),
                                                  width: 200,
                                                  height: 200,
                                                  child: Icon(
                                                    Icons.camera_alt,
                                                    color: Colors.grey[800],
                                                  ),
                                                ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Please upload a profile picture",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'OpenSans',
                                  fontSize: 18.0,
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
