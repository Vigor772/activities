import 'package:flutter/material.dart';

class ItemButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback? onItemPressed;

  const ItemButton({
    super.key,
    required this.title,

    /// Default value for the color
    this.color = const Color(0xFF1abc9c),
    this.onItemPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: onItemPressed,
            child: Container(
              height: 56,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
