import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final double? width;
  final double? height;

  const BasicAppButton({
    super.key,
    this.onPressed,
    this.title = '',
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            minimumSize: Size(
          width ?? MediaQuery.of(context).size.width,
          height ?? 50,
        )),
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ));
  }
}
