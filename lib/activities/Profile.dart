import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winfo/activities/login_details.dart';
import 'package:winfo/main.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late String name = '';
  late String age = '';
  late String phone = '';

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      this.name = prefs.getString('name') ?? '';
      this.age = prefs.getString('age') ?? '';
      this.phone = prefs.getString('phone') ?? '';
    });

    print(name);
  }

  @override
  void initState() {
    super.initState();
    getData();
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
            Text('Name: ${name}'),
            Text('Age:  ${age}'),
            Text('Phone Number: ${phone}'),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences Sp = await SharedPreferences.getInstance();
                Sp.setBool(SplashScreenState.KEYLOGIN, false);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: ((context) => LoginDetails())));
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
