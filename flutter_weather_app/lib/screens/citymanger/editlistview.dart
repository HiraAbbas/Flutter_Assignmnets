import 'package:flutter/material.dart';

class ListEditview extends StatefulWidget {
  const ListEditview  ({Key? key}) : super(key: key);

  @override
  _ListEditviewState createState() => _ListEditviewState();
}

class _ListEditviewState extends State<ListEditview > {
  List<String> items = List.generate(10, (index) => 'Item $index');

  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: IconButton(
              icon: Icon(
                Icons.remove_circle,
                color: Colors.red,
              ),
              onPressed: () => deleteItem(index),
            ),
            title: Text(items[index]),
            subtitle: Text('Subtitle $index'),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: items.length,
      ),
    );
  }
}
