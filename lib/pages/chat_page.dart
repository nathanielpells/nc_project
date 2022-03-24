import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";


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
  List extendedChat = [];

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
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('channels')
                      .snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) return const Text('Loading...');
                    return ListView.builder(
                      itemCount: snapshot.data.docs.User1_User2.thread.length,
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
                                  snapshot.data.docs[index].User1_User2
                                      .thread[index].content,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          messageInput(),
        ]),
      ),
    );
  }

  Widget messageInput() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            autocorrect: true,
            decoration: const InputDecoration(
              hintText: 'type your message',
            ),
            validator: (_value) => _value!.isNotEmpty ? null : '',
            onChanged: (_value) {
              setState(() {
                _message = _value;
                print(_value);
              });
            },
          ),
        ),
        ElevatedButton(
          onPressed: () => {
            print(extendedChat.length),
            setState(() {
              extendedChat = [
                ..._chat,
                Chat(
                  'https://i.pravatar.cc/50?img=50',
                  'User1',
                  '$_message',
                  '12:45',
                )
              ];
            }),
            _chat.add(
              Chat(
                'https://i.pravatar.cc/50?img=50',
                'User1',
                '$_message',
                '12:45',
              ),
            ),
            print(extendedChat.length)
          },
          child: const Text('Send'),
        ),
      ],
    );
  }
}

//difference between class and creating widget in register page.dart?
//set state or invoke db patch?

  //validation correct/needed/alternative needed?
  //setstate error


  //opens chat page from allmesages or send message from other users profile page
  // call to db is made to check if chat already exists for 2 users
  //if so their document? is retreived and messages data populates screen
  //if not new collection? is made for both users
  //current user field added/ variable state set?

  //design and create firebase messages collection
  //link from  screenshot/video
  //authentication?
  //patch to db function
  //apply to ios and web

  //display avatars
  //onclick timestamp
  //add message input box and button ------- first
  //remove card lines and improve styling
  //wrapping in messages
  //implement isuser true/false for alignment
  // data from db format changed to have isuser key?
  //refacter: extract some widgets to be outside of tree?
  //validation excludes empty messages
  // title uses non hardcoded udernames and avatars?
  // drawer for other chats? 
  //auto scroll

