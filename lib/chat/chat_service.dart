import 'package:chatapp/modeles/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatService {
// GET INSTANCE FIRESTORE
  final  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  // GET INSTANCE FIRESTORE
  final FirebaseAuth _auth = FirebaseAuth.instance;
// USERS STREAM

  Stream<List<Map<String , dynamic>>>getUsersStream(){
      return _firebaseFirestore.collection("Users").snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          final user= doc.data();
           return user;
        }).toList();
      });


  }
//



// SEND MESSAGES

  // SEND MESSAGES
  Future<void> sendMessage(String receiveID, message) async {
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp  timestamp = Timestamp.now();

    Messages messages = Messages(
      senderID: currentUserID,
      sendEMAIL: currentUserEmail,
      receiveID: receiveID,
      message: message,
      timestamp: timestamp,
    );
    List<String> ids = [currentUserID, receiveID];
    ids.sort();
    String chatSpace = ids.join('_');
    await _firebaseFirestore.collection("chat_rooms")
        .doc(chatSpace).collection("messages").add(messages.toMap());
  }
  Stream<QuerySnapshot> getMessages(String userID, otherID) {
    //
    List<String> ids = [userID, otherID];
    ids.sort();
    String chatRoomID = ids.join('_');
    return _firebaseFirestore.collection("chat_rooms")
        .doc(chatRoomID).collection("messages")
        .orderBy("timestamp",descending: false)
        .snapshots();
  }
}