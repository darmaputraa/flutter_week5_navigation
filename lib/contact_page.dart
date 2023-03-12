import 'package:flutter/material.dart';

import 'create_new_contact.dart';
import 'model/contact.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<Contact> contacts = [
    Contact(name: 'Bambang', phone: '0812727272'),
    Contact(name: 'Andi', phone: '08197286950'),
    Contact(name: 'Inda', phone: '085264732890'),
    Contact(name: 'Joko', phone: '081975647382'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          toolbarHeight: 70,
          centerTitle: true,
          title: const Text(
            'Contacts',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w900, color: Colors.black),
          ),
          backgroundColor: Colors.amber[600],
        ),
        body: Container(
            margin: const EdgeInsets.only(top: 12),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 1,
                    child: ListTile(
                        dense: true,
                        leading: CircleAvatar(
                          backgroundColor: Colors.amber[600],
                          radius: 24,
                          child: const Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 32,
                          ),
                        ),
                        title: Text(
                          contacts[index].name.toString(),
                          style: const TextStyle(
                              fontSize: 26, color: Colors.black),
                        ),
                        subtitle: Text(
                          contacts[index].phone.toString(),
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(223, 136, 126, 126)),
                        )));
              },
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            /// Navigator without name routes
            // Navigator.of(context)
            //     .push(MaterialPageRoute<List<Contact>>(
            //         builder: (_) => CreateNewContact(
            //               contactList: contacts,
            //             )))
            //     .then((updateContact) {
            //   setState(() {
            //     contacts = updateContact ?? [];
            //   });
            // });

            /// Navigator With name routes
            Navigator.push(
                    context,
                    MaterialPageRoute<List<Contact>>(
                        builder: (_) => CreateNewContact(contactList: contacts),
                        settings: const RouteSettings(name: '/create')))
                .then((updateContact) {
              setState(() {
                contacts = updateContact ?? [];
              });
            });
          },
          backgroundColor: Colors.amber[600],
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ));
  }
}
