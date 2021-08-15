import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final Function func;
  final double size;
  CircleButton({@required this.icon, @required this.func, @required this.size});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: func,
        icon: Icon(icon),
        iconSize: size,
        color: Colors.black,
      ),
    );
  }
}
