import 'package:flutter/material.dart';
import 'package:socket_chat_app/models/user_model.dart';

class UsersPage extends StatefulWidget {
  static const routeName = '/users';
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final users = [
    UserModel(uid: '1', nombre: 'Maria', email: "maria@mail.com", online: true),
    UserModel(
      uid: '2',
      nombre: 'Mario',
      email: "mario@mail.com",
      online: false,
    ),
    UserModel(
      uid: '3',
      nombre: 'Carlos',
      email: "carlos@mail.com",
      online: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Mi nombre',
            style: TextStyle(color: Colors.black54),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.black87,
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.check_circle,
                color: Colors.blue[400],
              ),
            )
          ],
        ),
        body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              title: Text(user.nombre!),
              leading: CircleAvatar(
                child: Text(user.nombre!.substring(0, 2)),
              ),
              trailing: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: user.online! ? Colors.green : Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        ));
  }
}
