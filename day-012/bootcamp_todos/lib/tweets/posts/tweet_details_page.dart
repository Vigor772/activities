import 'package:flutter/material.dart';
import 'package:todo_app/widgets/item_button.dart';

class TweetDetailsPage extends StatefulWidget {
  final String id;
  final String title;
  final String description;
  final Function(bool isUpdated)? onItemUpdated;
  final VoidCallback? onItemDeleted;

  const TweetDetailsPage({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    this.onItemUpdated,
    this.onItemDeleted,
  });

  @override
  State<TweetDetailsPage> createState() => _TweetDetailsPageState();
}

class _TweetDetailsPageState extends State<TweetDetailsPage> {
  String? updatedTitle;
  String? updatedDescription;
  String? updatedDate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            updatedTitle ?? widget.title,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    updatedDescription ?? widget.description,
                    style: const TextStyle(
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ItemButton(
                      title: 'Delete',
                      color: Colors.red,
                      onItemPressed: () {
                        widget.onItemDeleted!();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
