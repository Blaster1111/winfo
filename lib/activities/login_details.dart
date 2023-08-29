import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winfo/activities/Profile.dart';

import 'package:winfo/home.dart';
import 'package:get/get.dart';
import 'package:winfo/main.dart';

class LoginDetails extends StatefulWidget {
  const LoginDetails({super.key});

  @override
  State<LoginDetails> createState() => _LoginDetailsState();
}

class _LoginDetailsState extends State<LoginDetails> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      SharedPreferences Prefs = await SharedPreferences.getInstance();
      Prefs.setString('name', _nameController.text);
      Prefs.setString('age', _ageController.text);
      Prefs.setString('phone', _phoneNumberController.text);
      Navigator.pushReplacementNamed(context, "/home_page",
          arguments: Profile());
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Personal Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  } else if (value.length != 2) {
                    return 'Invalid Age!';
                  } else if (value == int.tryParse(value) is int) {
                    return 'Age should be a valid number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  // You can add more validation for phone numbers
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  var SharedPref = await SharedPreferences.getInstance();
                  SharedPref.setBool(SplashScreenState.KEYLOGIN, true);
                  _submitForm();
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
