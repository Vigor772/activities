import 'package:flutter/material.dart';

class SocialPostItem extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onItemPressed;

  const SocialPostItem({
    super.key,
    required this.title,
    required this.description,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
