import 'package:flutter/material.dart';
import 'package:todo_app/models/item_model.dart';
import 'package:todo_app/typicode/repositories/typicode_http.dart';
import 'package:todo_app/widgets/item_button.dart';

/// This is an example of a todo app
/// that connects to the network
/// using RESTful APIs and the http package.
class TypicodePage extends StatefulWidget {
  const TypicodePage({Key? key}) : super(key: key);

  @override
  State<TypicodePage> createState() => _TypicodePageState();
}

class _TypicodePageState extends State<TypicodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Typicode'),
      ),
      body: Center(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: FutureBuilder<List<ItemModel>>(
                  future: TypicodeHttpClient().read(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData == false &&
                        snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error}"),
                      );
                    } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text("No items found"),
                      );
                    }

                    final itemModels = snapshot.data ?? [];

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: itemModels.length,
                      itemBuilder: (context, index) {
                        final itemModel = itemModels[index];
                        return ListTile(
                          title: Text(itemModel.title),
                          leading: Checkbox(
                            value: itemModel.completed,
                            onChanged: (value) {},
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ItemButton(
                title: 'New Item',
                color: Colors.green,
                onItemPressed: () {
                  // TODO(vince): Add CRUD for restulf API
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
