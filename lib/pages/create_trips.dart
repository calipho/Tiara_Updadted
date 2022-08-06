import 'dart:io';

import 'package:bank_project/services/trans_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bank_project/models/trips.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'transactions_page.dart';
import 'package:flutter/material.dart';
import 'package:bank_project/widgets/imageplane.dart';

class CreateTripsPage extends StatefulWidget {
  @override
  _CreateTripsPageState createState() => _CreateTripsPageState();
}

File? _image;

class _CreateTripsPageState extends State<CreateTripsPage> {
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Trips'),
        backgroundColor: Color.fromARGB(207, 243, 233, 226),
      ),
      body: Builder(builder: (context) {
        return Column(
          children: [
            Image.asset("plane.png"),
            Center(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Trip Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Trip Description',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Trip Date',
                          border: OutlineInputBorder(),
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
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () async {},
                        child: Text('Create'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
