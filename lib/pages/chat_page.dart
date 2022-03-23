import "package:flutter/material.dart";

class ChatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChatPageState();
  }
}

class Chat {
  String avatar, username, message, timestamp;
  Chat(this.avatar, this.username, this.message, this.timestamp);
}

class _ChatPageState extends State<ChatPage> {
  String? _message;
  // double? _deviceHeight;
  // double? _deviceWidth;

  //avatar not needed for every message, make separate call for avater?
  // duplicate list, delete username and add isuser : true/false pair? or just include as additional pair?
  final List<Chat> _chat = [
    Chat(
      'https://i.pravatar.cc/50?img=50',
      'User1',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pellentesque ut quam id interdum. Integer quis massa sit amet mi ultrices vehicula eu volutpat magna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed maximus vehicula nibh at ornare. Donec consectetur metus vel hendrerit vulputate. ',
      '12:45',
    ),
    Chat(
      'https://i.pravatar.cc/50?img=40',
      'User2',
      'hi',
      '12:45',
    ),
    Chat(
      'https://i.pravatar.cc/50?img=50',
      'User1',
      'Hey',
      '12:45',
    ),
    Chat(
      'https://i.pravatar.cc/50?img=50',
      'User1',
      'hello',
      '12:45',
    ),
    Chat(
      'https://i.pravatar.cc/50?img=40',
      'User2',
      'Hola',
      '12:45',
    ),
    Chat(
      'https://i.pravatar.cc/50?img=50',
      'User1',
      'Nihao',
      '12:45',
    ),
    Chat(
      'https://i.pravatar.cc/50?img=50',
      'User1',
      'hello',
      '12:45',
    ),
    Chat(
      'https://i.pravatar.cc/50?img=40',
      'User2',
      'hi',
      '12:45',
    ),
    Chat(
      'https://i.pravatar.cc/50?img=50',
      'User1',
      'Hey',
      '12:45',
    ),
    Chat(
      'https://i.pravatar.cc/50?img=50',
      'User1',
      'hello',
      '12:45',
    ),
    Chat(
      'https://i.pravatar.cc/50?img=50',
      'User1',
      'hello',
      '12:45',
    ),
    Chat(
      'https://i.pravatar.cc/50?img=40',
      'User2',
      'hi',
      '12:45',
    ),
    Chat(
      'https://i.pravatar.cc/50?img=50',
      'User1',
      'Hey',
      '12:45',
    ),
    Chat(
      'https://i.pravatar.cc/50?img=50',
      'User1',
      'hello',
      '12:45',
    ),
    Chat(
      'https://i.pravatar.cc/50?img=40',
      'User2',
      'Hola',
      '12:45',
    ),
    Chat(
      'https://i.pravatar.cc/50?img=50',
      'User1',
      'Nihao',
      '12:45',
    ),
    Chat(
      'https://i.pravatar.cc/50?img=50',
      'User1',
      'hello',
      '12:45',
    ),
    Chat(
      'https://i.pravatar.cc/50?img=40',
      'User2',
      'hi',
      '12:45',
    ),
    Chat(
      'https://i.pravatar.cc/50?img=50',
      'User1',
      'Hey',
      '12:45',
    ),
    Chat(
      'https://i.pravatar.cc/50?img=50',
      'User1',
      'hello',
      '12:45',
    ),
  ];

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // _deviceHeight = MediaQuery.of(context).size.height;
    // _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text('Conversation with User2')),
      body: SafeArea(
        child: Column(children: [
          Flexible(
            child: SizedBox(
              child: ListView.builder(
                itemCount: _chat.length,
                itemBuilder: (context, int index) => Card(
                  child: ListTile(
                    title: Align(
                      alignment: _chat[index].username == 'User1'
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: _chat[index].username == 'User1'
                              ? Colors.blue
                              : Colors.red,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            _chat[index].message,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const MessageInput(),
        ]),
      ),
    );
  }
}

//set state or invoke db patch?
class MessageInput extends StatelessWidget {
  const MessageInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            autocorrect: true,
            decoration: const InputDecoration(
              hintText: 'type your message',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => print('message sent'),
          child: const Text('Send'),
        ),
      ],
    );
  }
}

  //display avatars
  //onclick timestamp
  //add message input box and button ------- first
  //wrapping in messages
  //implement isuser true/false for alignment
  // data from db format changed to have isuser key?
  //refacter: extract some widgets to be outside of tree?
  //validation excludes empty messages
  // title uses non hardcoded udernames and avatars?
  //scrolling functionality fully working?
  // drawer for other chats? 

  // Widget _conversation(message) => Card(
  //         child: Column(children: [
  //       Text(message.username),
  //       // Image(Image.network(message.avatar)),
  //       // Text(message.message),
  //       // Text(message.timestamp)
  //     ]));

