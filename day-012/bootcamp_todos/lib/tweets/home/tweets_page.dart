import 'package:flutter/material.dart';

import '../../widgets/item_button.dart';

class TweetsPage extends StatefulWidget {
  const TweetsPage({Key? key}) : super(key: key);

  @override
  State<TweetsPage> createState() => _TweetsPageState();
}

class _TweetsPageState extends State<TweetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social'),
      ),
      body: Center(
        child: Stack(
          children: [
            const Center(
              child: Text('Hello world!'),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ItemButton(
                title: 'New Item',
                color: Colors.green,
                onItemPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TweetsPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
