import 'package:flutter/material.dart';
import 'package:latihan_7/models/user_models.dart';
import 'package:latihan_7/repository/user_repository.dart';
import 'package:latihan_7/ui/user_create_page.dart';
import 'package:latihan_7/ui/user_detail.dart';

class UserHomepage extends StatefulWidget {
  const UserHomepage({super.key});

  @override
  State<UserHomepage> createState() => _UserHomepageState();
}

class _UserHomepageState extends State<UserHomepage> {
  final userRepository = UserRepository();
  late final Future<List<UserModel>> futureUser;

  @override
  void initState() {
    futureUser = userRepository.getUserModels();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => UserCreatePage()));
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
          future: futureUser,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    UserModel userModel = snapshot.data![index];

                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UserDetail(userModel: userModel)));
                        debugPrint('Item : ${snapshot.data![index].firstName}');
                      },
                      //leading: CircleAvatar(
                        //backgroundImage: NetworkImage(
                            //snapshot.data![index].image.toString()),
                      //),
                      title: Text(snapshot.data![index].firstName),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
