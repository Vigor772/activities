import 'package:flutter/material.dart';
import 'package:todo_app/groceries/home/groceries_page.dart';
import 'package:todo_app/social/home/social_page.dart';
import 'package:todo_app/typicode/home/typicode_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Center(
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return const GroceriesPage();
                  }),
                );
              },
              title: const Text('Groceries - Local DB Demo'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return const TypicodePage();
                  }),
                );
              },
              title: const Text('Typicode - RESTful API Demo'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return const SocialPage();
                  }),
                );
              },
              title: const Text('Social - Firestore'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return const SocialPage();
                  }),
                );
              },
              title: const Text('Tweets - Firestore'),
            ),
          ],
        ),
      ),
    );
  }
}
