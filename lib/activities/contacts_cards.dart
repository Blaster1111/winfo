import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsCards extends StatefulWidget {
  final String name;
  final String number;

  const ContactsCards({
    super.key,
    required this.name,
    required this.number,
  });

  @override
  State<ContactsCards> createState() => _ContactsCardsState();
}

class _ContactsCardsState extends State<ContactsCards> {
  @override
  Widget build(BuildContext context) {
    final ContactsCards args =
        ModalRoute.of(context)!.settings.arguments as ContactsCards;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contact Details",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 2,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SafeArea(
                child: Icon(
                  Icons.person,
                  size: 200,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: 2.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(8.0), // Border radius
                ),
                padding: EdgeInsets.all(16),
                child: Text(
                  'Name: ${args.name}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10), // Add spacing between fields
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: 2, // Border width
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                  // Border radius
                ),
                padding: EdgeInsets.all(16),
                child: Text(
                  'Number: ${args.number}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      launch('tel: ${args.number}');
                    },
                    child: Text(
                      'Call',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    onPressed: () {
                      launch("https://wa.me/${args.number}");
                    },
                    child: Icon(Icons.message_outlined),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
