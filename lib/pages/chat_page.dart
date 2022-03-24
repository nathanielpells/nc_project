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

//instances of db channel and doc
  final CollectionReference _channels =
      FirebaseFirestore.instance.collection('channels');
  final DocumentReference _user1User2Chat =
      FirebaseFirestore.instance.collection('channels').doc('User1_User2');

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
  ];

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Conversation with User2')),
      body: SafeArea(
        child: Column(children: [
          Flexible(
            child: SizedBox(
              child: StreamBuilder(
                  // below: points to specific doc in db
                  stream: FirebaseFirestore.instance
                      .collection('channels')
                      .doc('User1_User2')
                      .snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) return const Text('Loading...');
                    return ListView.builder(
                      // below: how many items to iterate over to be displayed
                      itemCount: snapshot.data['thread'].length,
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
                                  // line below is db route to be displayed as message
                                  snapshot.data['thread'][index]['content'],
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
              });
            },
          ),
        ),
        ElevatedButton(
          onPressed: () => {
            // if (no channel/chat between current user and 2nd user exists) { create channel and post message}
            // else { get and display existing messages and post new message to db }

            // .set on instance of doc(_user1User2Chat) overwrites current doc but SetOptions(merge:true) should make it be added it instead
            // _user1User2Chat
            //     .set({'key':'value'}, SetOptions(merge: true))
            //     .then((value) => print("Message Added"))
            //     .catchError(
            //         (error) => print("Failed to send message: $error"))
          },
          child: const Text('Send'),
        ),
      ],
    );
  }
}

//users are currently hardcoded
//this page should come from messages page with list of all users chats with other users or display tabs of other convos at top of page
//authentication

//display avatars
//onclick timestamp
//wrapping in messages
// title to use non hardcoded usernames and avatars
//auto scroll
