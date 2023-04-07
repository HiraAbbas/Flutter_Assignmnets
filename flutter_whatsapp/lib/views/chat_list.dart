import 'package:flutter/material.dart';
import 'package:flutter_whatsapp/views/chats.dart';

class ChatListTile extends StatelessWidget {
  final Chat chat;

  const ChatListTile({Key? key, required this.chat, required int unreadMessagesCount}) : super(key: key);

  @override
   Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      leading: CircleAvatar(
        backgroundImage: chat.imageUrl != null ? NetworkImage(chat.imageUrl!) : null,
        radius: 30.0,
        child: chat.groupIcon != null
            ? Icon(
                chat.groupIcon,
                
                size: 30.0,
              )
            : null,
      ),
      title: Text(chat.title),
      subtitle: Text(chat.subtitle),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            chat.formattedDate,
            style: const TextStyle(),
          ),
          const SizedBox(height: 4),
          if (!chat.isRead)
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xff128C7E),
                borderRadius: BorderRadius.circular(12),
              ),
              constraints: const BoxConstraints(
                minWidth: 20,
                minHeight: 20,
              ),
              child: const Text(
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
