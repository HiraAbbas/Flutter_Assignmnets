import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:contacts_service/contacts_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CRUD Contact App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    // Get all contacts from the device.
    ContactsService.getContacts().then((contacts) {
      setState(() {
        this.contacts = contacts;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter CRUD Contact App'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          Contact contact = contacts[index];
          return ListTile(
            title: Text(contact.displayName),
            subtitle: Text(contact.phones.first.value),
            onTap: () {
              // Show the contact details.
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(contact.displayName),
                    content: Text(contact.phones.first.value),
                    actions: [
                      FlatButton(
                        child: Text('Call'),
                        onPressed: () {
                          // Call the contact.
                          launch('tel:${contact.phones.first.value}');
                        },
                      ),
                      FlatButton(
                        child: Text('SMS'),
                        onPressed: () {
                          // Send an SMS to the contact.
                          launch('sms:${contact.phones.first.value}');
                        },
                      ),
                    ],
                  );
                },
              );
            },
            onLongPress: () {
              // Delete the contact.
              setState(() {
                contacts.removeAt(index);
              });
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.all),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.missed_call),
            label: 'Missed Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Add a new contact.
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add Contact'),
                content: TextField(
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                actions: [
                  FlatButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text('Add'),
                    onPressed: () {
                      // Add the contact to the list.
                      Contact newContact = Contact(
                        displayName: TextField.of(context).text,
                      );
                      contacts.add(newContact);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}