import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:socket_chat_app/models/user_model.dart';
import 'package:socket_chat_app/pages/login_page.dart';
import 'package:socket_chat_app/services/auth_service.dart';

class UsersPage extends StatefulWidget {
  static const routeName = '/users';
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

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
    final authService = Provider.of<AuthService>(context);
    final usuario = authService.usuario;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          usuario.nombre,
          style: const TextStyle(color: Colors.black54),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, LoginPage.routeName);
            AuthService.deleteToken();
          },
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
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        header: WaterDropHeader(
          complete: Icon(Icons.check, color: Colors.blue[400]),
          waterDropColor: Colors.blue[400]!,
        ),
        onRefresh: _loadUsers,
        child: _usersListView(),
      ),
    );
  }

  Future<void> _loadUsers() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  ListView _usersListView() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: users.length,
      itemBuilder: (context, index) => _CustomTile(user: users[index]),
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}

class _CustomTile extends StatelessWidget {
  const _CustomTile({
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.nombre!),
      leading: CircleAvatar(
        backgroundColor: Colors.blue[100],
        child: Text(user.nombre!.substring(0, 2)),
      ),
      subtitle: Text(user.email!),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: user.online! ? Colors.green : Colors.red,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
