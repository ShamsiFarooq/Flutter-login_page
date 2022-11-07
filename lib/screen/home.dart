import 'package:flutter/material.dart';
import 'package:login_in/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HOME',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                signout(context);
              },
              icon: const Icon(Icons.exit_to_app)),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ListView.separated(
            itemBuilder: (ctx, index) {
              if (index % 2 == 0) {
                return oddTile(index);
              } else {
                return evenTile(index);
              }
            },
            separatorBuilder: (ctx, index) {
              return const Divider();
            },
            itemCount: 20,
          ),
        ),
      ),
    );
  }

  ListTile oddTile(int index) {
    return ListTile(
      title: Text(
        'baby $index',
      ),
      leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/img/prpl.png'),
        radius: 30,
      ),
    );
  }

  ListTile evenTile(int index) {
    return ListTile(
        title: Text('baby $index'),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Image.asset('assets/img/redbaby.png'),
        ));
  }

  signout(BuildContext ctx) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => ScreenLogin()), (route) => false);
  }
}
