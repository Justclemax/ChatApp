import 'package:chatapp/chat/chat_service.dart';
import 'package:chatapp/components/user_title.dart';
import 'package:flutter/material.dart';
import '/auth/auth.dart';
import 'package:chatapp/pages/chat.dart';

class HomePage extends StatelessWidget {
  final ChatService _chatService = ChatService();



  final AuthUser _authUser = AuthUser();

  HomePage({super.key});

  void logout() {
    _authUser.signOut();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Accueil",
        ),
        actions: [
          IconButton(
            onPressed: logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),

      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Erreur");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }
        if (snapshot.data == null || snapshot.data!.isEmpty) {
          return Text("Aucun utilisateur trouvé");
        }
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
            .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem (
      Map<String, dynamic>  userData,BuildContext context) {
    String name = userData["name"];

    String capitalizedName = name.substring(0, 1).toUpperCase() + name.substring(1);
    String receiveID = userData["uid"];
    if (userData["email"] != _authUser.getCurrentUser()?.email) {
      return UserTitle(
        text: capitalizedName,
        ontap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverEmail: capitalizedName,
                receiveID: receiveID,
              ),
            ),
          );
        },
      );
    } else {
      // Retourne un widget vide si la condition n'est pas satisfaite
      return Container();
    }


  }
}


