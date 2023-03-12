import 'package:flutter/material.dart';

import 'contact_page.dart';
import 'create_new_contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const ContactPage(),
        '/create': (_) => const CreateNewContact(
              contactList: [],
            )
      },
      // home: const ContactPage()
    );
  }
}
