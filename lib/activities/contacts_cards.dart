import 'package:flutter/material.dart';

class ContactsCards extends StatefulWidget {
  const ContactsCards({super.key});

  @override
  State<ContactsCards> createState() => _ContactsCardsState();
}

class _ContactsCardsState extends State<ContactsCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('ContactCard'),
      ),
    );
  }
}
