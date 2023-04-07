import 'package:flutter/material.dart';
import 'package:flutter_whatsapp/views/chat_list.dart';
import 'package:flutter_whatsapp/views/chats.dart';

class ChatsTab extends StatefulWidget {
  const ChatsTab({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChatsTabState createState() => _ChatsTabState();
}

class _ChatsTabState extends State<ChatsTab> {
  final int _unreadMessagesCount = 2;

  final List<Chat> chats = [
    Chat(
      title: 'Hira',
      subtitle: 'Assignment done',
      imageUrl:
          'https://funylife.in/wp-content/uploads/2022/12/23_Whatsapp-Dp-images-FunyLife.in_-1024x1024.jpg',
      timeStamp: DateTime.now(),
    ),
    Chat(
      title: 'Aliya',
      subtitle: 'How are you?',
      isRead: true,
      imageUrl:
          'https://funkylife.in/wp-content/uploads/2023/03/whatsapp-dp-575-1-1024x1024.jpg',
      timeStamp: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Chat(
      title: 'Sana',
      subtitle: 'Did you finish the task?',
      groupIcon: Icons.person,
      timeStamp: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Chat(
      title: 'no name',
      subtitle: 'Assignment done',
      imageUrl:
          'https://funylife.in/wp-content/uploads/2022/12/23_Whatsapp-Dp-images-FunyLife.in_-1024x1024.jpg',
      timeStamp: DateTime.now(),
    ),
    Chat(
      title: 'Uni',
      subtitle: 'How are you?',
      isRead: true,
      imageUrl:
          'https://funkylife.in/wp-content/uploads/2023/03/whatsapp-dp-575-1-1024x1024.jpg',
      timeStamp: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Chat(
      title: '+923002336593',
      subtitle: 'Did you finish the task?',
      groupIcon: Icons.person,
      timeStamp: DateTime.now().subtract(const Duration(days: 4)),
    ),
    Chat(
      title: 'zainab',
      subtitle: 'Assignment done',
      imageUrl:
          'https://funylife.in/wp-content/uploads/2022/12/23_Whatsapp-Dp-images-FunyLife.in_-1024x1024.jpg',
      timeStamp: DateTime.now(),
    ),
    Chat(
      title: 'mother',
      subtitle: 'Hi MOM!',
      imageUrl:
          'https://funkylife.in/wp-content/uploads/2023/03/whatsapp-dp-574-2-1024x1024.jpg',
      timeStamp: DateTime.now().subtract(const Duration(days: 6)),
    ),
    Chat(
      title: 'coaching',
      subtitle: 'How are you?',
      isRead: true,
      imageUrl:
          'https://funkylife.in/wp-content/uploads/2023/03/whatsapp-dp-575-1-1024x1024.jpg',
      timeStamp: DateTime.now().subtract(const Duration(days: 5)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) {
            final chat = chats[index];
            return ChatListTile(
              chat: chat,
              unreadMessagesCount: _unreadMessagesCount,
            );
          },
        ),
      ),
    );
  }
}
