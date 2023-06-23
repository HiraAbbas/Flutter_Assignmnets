import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
          subtitle: Text('Subtitle $index'),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: 10,
    );
  }
}

class ListEditView extends StatefulWidget {
  const ListEditView({Key? key}) : super(key: key);

  @override
  _ListEditViewState createState() => _ListEditViewState();
}

class _ListEditViewState extends State<ListEditView> {
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
