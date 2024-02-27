import 'package:cloud_firestore/cloud_firestore.dart'; // Importez cette bibliothèque si vous utilisez Firebase Firestore.

class Messages {
  final String senderID;
  final String sendEMAIL;
  final String receiveID;
  final String message;
  final Timestamp timestamp;

  Messages({
    required this.senderID,
    required this.sendEMAIL,
    required this.receiveID,
    required this.message,
    required this.timestamp, // Ajoutez 'required' ici.
  });

  Map<String, dynamic> toMap() {
    return {
      'senderID': senderID,
      'sendEMAIL': sendEMAIL,
      'receiveID': receiveID,
      'message': message,
      'timestamp': timestamp,
    };
  }
}
