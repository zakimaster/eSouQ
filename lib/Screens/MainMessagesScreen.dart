import 'package:esouq/Models/AppData.dart';
import 'package:esouq/Models/ChatMessagesModel.dart';
import 'package:esouq/Models/MessageModel.dart';
import 'package:esouq/Screens/MainChatConversation.dart';
import 'package:esouq/themes/colors.dart';
import 'package:esouq/widgets/GeneraleWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class MainChatScreen extends StatefulWidget {

  static String tag = '/MainChatScreen';

  @override
  MainChatScreenState createState() => MainChatScreenState();
}

class MainChatScreenState extends State<MainChatScreen> {

  ScrollController scrollController = ScrollController();
  TextEditingController msgController = TextEditingController();
  FocusNode msgFocusNode = FocusNode();

  var msgListing = AppData().getChatMsgData();
  List<ChatMessageModel> chats = AppData().getChatData();
  String? personName = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  sendClick() async {
    DateFormat formatter = DateFormat('hh:mm a');

    if (msgController.text.trim().isNotEmpty) {
      var msgModel = MessageModel();
      msgModel.msg = msgController.text.toString();
      msgModel.time = formatter.format(DateTime.now());
      msgModel.Sender_id = sender_id;
      hideKeyboard(context);
      msgListing.insert(0, msgModel);

      var msgModel1 = MessageModel();
      msgModel1.msg = msgController.text.toString();
      msgModel1.time = formatter.format(DateTime.now());
      msgModel1.Sender_id = receiver_id;

      msgController.text = '';

      if (mounted) scrollController.animToTop();
      FocusScope.of(context).requestFocus(msgFocusNode);
      setState(() {});

      await Future.delayed(Duration(seconds: 1));

      msgListing.insert(0, msgModel1);

      if (mounted) scrollController.animToTop();
    } else {
      FocusScope.of(context).requestFocus(msgFocusNode);
    }

    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {

    Widget msgList() {
      return ListView.separated(
        separatorBuilder: (_, i) => Divider(),
        padding: EdgeInsets.all(8),
        itemCount: chats.length,
        itemBuilder: (_, index) {

          ChatMessageModel data = chats[index];

          return GestureDetector(
            onTap: () {
              print(context.width());
              if (context.width() > 540 && !isMobile) {

                personName = data.senderName;

                setState(() {});
              } else {
                MainChatConversationScreen().launch(context);
              }
            },
            child: Container(
              padding: EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInImage(
                    placeholder: Image.asset('assets/grey.jpg', fit: BoxFit.cover).image,
                    image: Image.asset(data.image!).image,
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ).cornerRadiusWithClipRRect(30),
                  10.width,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.senderName!, style: primaryTextStyle(color: appStore.textPrimaryColor)).expand(),
                            Text(data.time!, style: secondaryTextStyle(size: 12, color: appStore.textSecondaryColor)),
                          ],
                        ),
                        Row(
                          children: [
                            Text(data.msg!, style: secondaryTextStyle(size: 12), maxLines: 1).expand(),
                            2.width,
                            Row(
                              children: [
                                Icon(Icons.done_all, color: appColorPrimary, size: 14).withHeight(14),
                                2.width,
                                Container(
                                  decoration: BoxDecoration(color: appColorPrimary, shape: BoxShape.circle),
                                  child: Text(
                                    data.unreadCount.toString(),
                                    style: secondaryTextStyle(color: white, size: 10),
                                    maxLines: 1,
                                  ).paddingAll(6),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    Widget mobileWidget() {
      return msgList();
      //return Center(child: Text('Hello'),);
    }

    Widget webWidget() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: msgList()),
          VerticalDivider(width: 5),
          Expanded(
            flex: 6,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                  decoration: BoxDecoration(color: appStore.appBarColor, boxShadow: defaultBoxShadow()),
                  child: ListView.separated(
                    separatorBuilder: (_, i) => Divider(color: Colors.transparent),
                    shrinkWrap: true,
                    reverse: true,
                    controller: scrollController,
                    itemCount: msgListing.length,
                    padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 70),
                    itemBuilder: (_, index) {
                      MessageModel data = msgListing[index];
                      var isMe = data.Sender_id == sender_id;

                      return ChatMessageWidget(isMe: isMe, data: data);
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                    decoration: BoxDecoration(color: appStore.appBarColor, boxShadow: defaultBoxShadow()),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextField(
                          controller: msgController,
                          focusNode: msgFocusNode,
                          autofocus: true,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration.collapsed(hintText: personName!.isNotEmpty ? 'Write to $personName' : 'Type a message', hintStyle: primaryTextStyle()),
                          style: primaryTextStyle(),
                          onSubmitted: (s) {
                            sendClick();
                          },
                        ).expand(),
                        IconButton(
                          icon: Icon(Icons.send, size: 25, color: appStore.iconColor),
                          onPressed: () async {
                            sendClick();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      );
    }

    return ContainerX(
        mobile: mobileWidget(),
        web: webWidget(),
        useFullWidth: true,
    );
  }
}