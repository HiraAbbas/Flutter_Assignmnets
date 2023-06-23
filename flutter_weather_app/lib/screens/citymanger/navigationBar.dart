import 'package:flutter/material.dart';

class CityManagerBottomNavigationBar extends StatelessWidget {
  const CityManagerBottomNavigationBar({
    Key? key,
    required this.onEditPressed,
    required this.onAddPressed,
  }) : super(key: key);

  final VoidCallback onEditPressed;
  final VoidCallback onAddPressed;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.grey[300],

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: onEditPressed,
                  icon: Icon(Icons.edit,color: Colors.grey[700],),
                ),
                Text(
                  "Edit",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: onAddPressed,
                  icon: Icon(Icons.add,color: Colors.grey[700]),
                ),
                Text(
                  "Add",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
