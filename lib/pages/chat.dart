import 'package:flutter/material.dart';
import 'package:chatapp/auth/auth.dart';
import 'package:chatapp/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chatapp/components/textInput.dart';

import 'package:intl/intl.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiveID;

  ChatPage({Key? key, required this.receiverEmail, required this.receiveID})
      : super(key: key);

  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final AuthUser _authUser = AuthUser();

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(receiveID, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail),
      ),
      body: Column(
        children: [
          Expanded(
              child: _buildMessageList()),
          _buildInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authUser.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(receiveID, senderID),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Erreur ");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Chargement...");
        }

        return ListView(
          children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }


  Widget _buildMessageItem(DocumentSnapshot<Object?> doc) {
    final Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

    if (data == null) {
      return SizedBox(); // ou un widget adapté à un message vide
    }

    final String? message = data['message'] as String?;
    final bool isCurrentUser =
        data['senderID'] == _authUser.getCurrentUser()!.uid;
    final Timestamp? timestamp = data['timestamp'] as Timestamp?;

    // Convertir le Timestamp en DateTime
    final dateTime = timestamp != null ? timestamp.toDate() : null;

    // Formatter la date
    String formattedDateTime = '';
    if (dateTime != null) {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final yesterday = DateTime(now.year, now.month, now.day - 1);

      if (dateTime.isAfter(today)) {
        // Aujourd'hui
        formattedDateTime = 'Aujourd\'hui ${DateFormat.Hm().format(dateTime)}';
      } else if (dateTime.isAfter(yesterday)) {
        // Hier
        formattedDateTime = 'Hier ${DateFormat.Hm().format(dateTime)}';
      } else {
        // Plus d'un jour
        formattedDateTime = DateFormat('dd-MM-yyyy HH:mm').format(dateTime);
      }
    }

    return Align(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: isCurrentUser ? Colors.purple : Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              message!,
              style: TextStyle(
                color: isCurrentUser ? Colors.white : Colors.black,
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            formattedDateTime,
            style: TextStyle(
              color: isCurrentUser ? Colors.grey[400] : Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60.0),
      child: Row(
        children: [
          Expanded(
            child: TextInputField(
              controller: _messageController,
              textInput: "Ecriver un message",
              masquefield: false,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.purple,
              shape: BoxShape.circle,

            ),

            child: IconButton(
              onPressed: sendMessage,
              icon: Icon(Icons.arrow_upward),
            ),
          ),
        ],
      ),
    );
  }
}
