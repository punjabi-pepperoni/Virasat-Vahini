import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final IconData icon; // In real app, use SvgPicture with assets
  final VoidCallback onPressed;
  final Color backgroundColor;

  const SocialButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 32,
          color: Colors.black, // Placeholder icon color
        ),
      ),
    );
  }
}
