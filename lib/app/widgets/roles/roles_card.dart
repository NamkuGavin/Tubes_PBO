import 'package:flutter/material.dart';

class RolesCard extends StatelessWidget {
  final String image;
  final String text;
  final Function()? onTap;
  const RolesCard({super.key, required this.image, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              SizedBox(width: 100, height: 100, child: Image.asset(image)),
              SizedBox(width: 20),
              Text(
                text,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
