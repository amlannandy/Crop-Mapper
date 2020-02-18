import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

import '../providers/facts.dart';

class ChatBotScreen extends StatefulWidget {

  static const routeName = 'chat_bot_screen';

  ChatBotScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChatBotScreenState createState() => new _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {

  final List<Facts> messageList = <Facts>[];
  final TextEditingController _textController = new TextEditingController();

  bool isEnglish = true;

  Widget _queryInputWidget(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.only(left:8.0, right: 8),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _submitQuery,
                decoration: InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: Icon(
                    Icons.send, color: Theme.of(context).primaryColor
                  ),
                  onPressed: () => _submitQuery(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  void agentResponse(query) async {

    _textController.clear();
    AuthGoogle authGoogle = await AuthGoogle(fileJson: "assets/chatbot.json").build();
    Dialogflow dialogFlow = Dialogflow(authGoogle: authGoogle, language: isEnglish ? Language.english : Language.hindi);
    AIResponse response = await dialogFlow.detectIntent(query);
    Facts message = Facts(
      text: response.getMessage() ??
          CardDialogflow(response.getListMessage()[0]).title,
      name: "Flutter",
      type: false,
    );
    setState(() {
      messageList.insert(0, message);
    });
  }

  void _submitQuery(String text) {
    _textController.clear();
    Facts message = new Facts(
      text: text,
      name: "User",
      type: true,
    );
    setState(() {
      messageList.insert(0, message);
    });
    agentResponse(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ramu", 
          style: Theme.of(context).textTheme.title,
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              isEnglish ? "English" : "हिंदी",
              style: Theme.of(context).textTheme.display2,
            ),
            color: Colors.transparent,
            onPressed: () {
              setState(() {
                isEnglish = !isEnglish;
              });
            },
          )
        ],
      ),
      body: Column(children: <Widget>[
        Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true, //To keep the latest messages at the bottom
              itemBuilder: (_, int index) => messageList[index],
              itemCount: messageList.length,
            )),
        _queryInputWidget(context),
      ]),
    );
  }
}