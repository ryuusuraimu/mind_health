import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(BottomNavigationBarExampleApp());

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Text(
      'AIミュージック',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Text(
      'マインドフルネスを学ぶ',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mind Health'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          ChatScreen(),
          _widgetOptions[1],
          _widgetOptions[2],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
              height: 56.0,
              width: 56.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _selectedIndex == 0 ? Colors.amber[800] : Colors.transparent,
              ),
              child: Icon(
                Icons.home_outlined,
                color: Colors.black,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 56.0,
              width: 56.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _selectedIndex == 1 ? Colors.amber[800] : Colors.transparent,
              ),
              child: Icon(
                Icons.music_note_outlined,
                color: Colors.black,
              ),
            ),
            label: 'AIミュージック',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 56.0,
              width: 56.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _selectedIndex == 2 ? Colors.amber[800] : Colors.transparent,
              ),
              child: Icon(
                Icons.school_outlined,
                color: Colors.black,
              ),
            ),
            label: 'マインドフルネスを学ぶ',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

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
      appBar: AppBar(
        title: Text('HOME'),
      ),
      body: Column(
        children: [
          Flexible(
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
