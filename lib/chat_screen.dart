import 'package:flutter/material.dart';
import 'dart:math';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with AutomaticKeepAliveClientMixin<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];

  @override
  bool get wantKeepAlive => true;

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _messages.add(
        ChatMessage(
          text: text,
          isUserMessage: true,
        ),
      );
      _messages.add(
        ChatMessage(
          text: generateRandomReply(),
          isUserMessage: false,
        ),
      );
    });
  }

  String generateRandomReply() {
    final List<String> replies = [
      'Hello!',
      'How are you?',
      'Nice to meet you!',
      'What can I help you with?',
      'I am an AI chatbot.',
    ];
    final random = Random();
    return replies[random.nextInt(replies.length)];
  }

  Widget _buildMessageList() {
    return ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        return _messages[index];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          AppBar(
            title: Text('チャット'),
            backgroundColor: Colors.green,
            elevation: 0,
          ),
          Expanded(
            child: _buildMessageList(),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildMessageComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: '会話する',
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUserMessage;

  const ChatMessage({
    required this.text,
    required this.isUserMessage,
  });

  @override
  Widget build(BuildContext context) {
    final isUser = isUserMessage;
    final alignment =
    isUser ? MainAxisAlignment.end : MainAxisAlignment.start;
    final bgColor = isUser ? Colors.lightBlueAccent : Colors.grey[300];
    final textColor = isUser ? Colors.black : Colors.black;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: alignment,
        children: [
          Container(
            margin: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: bgColor,
              child: Icon(isUser ? Icons.person : Icons.chat_bubble),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: isUser
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  isUser ? 'You' : 'Chatbot',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text(
                    text,
                    style: TextStyle(color: textColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
