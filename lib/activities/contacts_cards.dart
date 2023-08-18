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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(234, 101, 110, 238),
              Color.fromARGB(234, 114, 175, 232),
              Color.fromARGB(234, 131, 204, 244),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SafeArea(
                child: Icon(
                  Icons.person,
                  size: 200,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Name: ${args.name}',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Number: ${args.number}',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
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
