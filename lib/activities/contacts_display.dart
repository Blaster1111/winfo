import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:winfo/activities/contacts_cards.dart';

class ContactDisplay extends StatefulWidget {
  const ContactDisplay({super.key});

  @override
  State<ContactDisplay> createState() => _ContactDisplayState();
}

class _ContactDisplayState extends State<ContactDisplay> {
  List<Contact>? contacts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContact();
  }

  void getContact() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Your Contacts",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 2,
        ),
        body: (contacts) == null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text('Please wait...'),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: contacts!.length,
                itemBuilder: (BuildContext context, int index) {
                  Uint8List? image = contacts![index].photo;
                  return ListTile(
                      leading: (contacts![index].photo == null)
                          ? const CircleAvatar(child: Icon(Icons.person))
                          : CircleAvatar(backgroundImage: MemoryImage(image!)),
                      title: Text(
                          "${contacts![index].name.first} ${contacts![index].name.last}"),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/contacts_cards",
                          arguments: ContactsCards(
                            name: contacts![index].displayName,
                            number: (contacts![index].phones.isNotEmpty)
                                ? (contacts![index].phones.first.number)
                                : "--",
                          ),
                        );
                      });
                },
              ));
  }
}
