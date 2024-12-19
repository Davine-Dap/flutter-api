import 'package:flutter/material.dart';
import 'package:latihan_7/params/user_params.dart';
import 'package:latihan_7/repository/responsis/user_create_response.dart';
import 'package:latihan_7/repository/user_repository.dart';

class UserCreatePage extends StatefulWidget {
  const UserCreatePage({super.key});

  @override
  State<UserCreatePage> createState() => _UserCreatePageState();
}

class _UserCreatePageState extends State<UserCreatePage> {
  final userRepository = UserRepository();
  late final Future<UserCreateResponse> futureUserCreate;

  @override
  void initState() {
    futureUserCreate = userRepository.addUser(UserParam(
        firstName: 'Kevin', lastName: 'Wijaya', gender: 'Male', image: null));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
      ),
    );
  }
}
