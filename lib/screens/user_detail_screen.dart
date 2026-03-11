import 'package:flutter/material.dart';
import '../models/user.dart';

class UserDetailScreen extends StatelessWidget {

  final User user;

  UserDetailScreen({required this.user});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Detalle del Usuario"),
      ),

      body: Padding(

        padding: EdgeInsets.all(16),
        

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          

          children: [

            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(user.avatar),
            ),

            Text(
              user.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text("Email: ${user.email}"),
            Text("Teléfono: ${user.phone}"),
            Text("Empresa: ${user.company}"),
            Text("Ciudad: ${user.city}"),

          ],
        ),
      ),
    );
  }
}