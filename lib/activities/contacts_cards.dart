import 'package:flutter/material.dart';

class ContactsCards extends StatefulWidget {
  final String name;
  final String number;

  const ContactsCards({super.key, required this.name, required this.number});

  @override
  State<ContactsCards> createState() => _ContactsCardsState();
}

class _ContactsCardsState extends State<ContactsCards> {
  @override
  Widget build(BuildContext context) {
    final ContactsCards args =
        ModalRoute.of(context)!.settings.arguments as ContactsCards;
    return Scaffold(
      appBar: AppBar(title: Text('Contact Details')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text('Name: ${args.name}'),
          Text('Number: ${args.number}'),
        ],
      ),
    );
  }
}
