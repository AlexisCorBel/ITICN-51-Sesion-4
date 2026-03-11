import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/api_service.dart';
import 'user_detail_screen.dart';

class UserListScreen extends StatelessWidget {

  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Usuarios"),
      ),

      body: FutureBuilder<List<User>>(

        future: apiService.fetchUsers(),

        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error al cargar datos"));
          }

          final users = snapshot.data!;

          return ListView.builder(
            itemCount: users.length,

            itemBuilder: (context, index) {

              final user = users[index];

              return ListTile(

                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar),
                ),


                title: Text(user.name),
                subtitle: Text(user.email),

                onTap: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDetailScreen(user: user),
                    ),
                  );

                },
              );
            },
          );
        },
      ),
    );
  }
}