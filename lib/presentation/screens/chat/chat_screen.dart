import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://th.bing.com/th/id/R.f870909a02602817891c8dd498eeed53?rik=fyiF0BjMkfY1eg&riu=http%3a%2f%2f4.bp.blogspot.com%2f_9i7OMVeSrYc%2fTLMvppOoaFI%2fAAAAAAAAAAs%2fApLkASEzx30%2fs1600%2fpaulachaves.jpg&ehk=hD%2br9UjZ7XEsrIEQ9lPTn5iAdtVT76rK2TH4354Z%2f%2bk%3d&risl=&pid=ImgRaw&r=0'),
          ),
        ),
        title: const Text('Delfi'),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];

                return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble(message: message)
                    : MyMessageBubble(message: message);
              },
            )),

            // Caja de texto de mensajes
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
              // onValue: (value) => chatProvider.sendMessage(value),
            ),
          ],
        ),
      ),
    );
  }
}
