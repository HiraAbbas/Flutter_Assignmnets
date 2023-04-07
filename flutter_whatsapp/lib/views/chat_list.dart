import 'package:flutter/material.dart';
import 'package:flutter_whatsapp/views/chats.dart';

class ChatListTile extends StatelessWidget {
  final Chat chat;

  const ChatListTile(
      {Key? key, required this.chat, required int unreadMessagesCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      leading: chat.imageUrl != null
          ? CircleAvatar(
              backgroundImage: NetworkImage(chat.imageUrl!),
              radius: 30.0,
            )
          : CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: IconTheme(
                data: IconThemeData(color: Colors.white),
                child: Icon(Icons.person),
                
              ),
              radius: 30.0,
            ),
      title: Text(chat.title),
      subtitle: Text(chat.subtitle),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            chat.formattedDate,
            style: TextStyle(),
          ),
          SizedBox(height: 4),
          if (!chat.isRead)
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xff128C7E),
                borderRadius: BorderRadius.circular(12),
              ),
              constraints: BoxConstraints(
                minWidth: 20,
                minHeight: 20,
              ),
              child: Text(
                '1',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}
