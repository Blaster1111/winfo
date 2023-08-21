import 'package:flutter/material.dart';
import 'package:winfo/activities/login_details.dart';

class Profile extends StatefulWidget {
  final String name;
  final String age;
  final String phoneNumber;

  Profile({
    required this.name,
    required this.age,
    required this.phoneNumber,
  });

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.name;
    _ageController.text = widget.age;
    _phoneNumberController.text = widget.phoneNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Display/Edit')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Name: ${_nameController.text}'),
            Text('Age: ${_ageController.text}'),
            Text('Phone Number: ${_phoneNumberController.text}'),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginDetails(),
                  ),
                );
              },
              child: Text('Edit Profile'),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, "/home_page");
              },
              child: Icon(Icons.home),
            ),
          ],
        ),
      ),
    );
  }
}
