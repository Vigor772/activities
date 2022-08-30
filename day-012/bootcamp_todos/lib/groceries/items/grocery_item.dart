import 'package:flutter/material.dart';

class GroceryItem extends StatelessWidget {
  final String title;
  final String description;
  final String date;

  /// This is used for passing a custom
  /// function callback when the `InkWell`
  /// in this widget is pressed.
  final VoidCallback? onItemPressed;

  const GroceryItem({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    this.onItemPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      /// This is how you use the custom function callback.
      onTap: onItemPressed,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 100,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(description),
                  Text(date),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
