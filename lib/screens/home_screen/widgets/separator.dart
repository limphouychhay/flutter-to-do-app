import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  const Separator({
    Key? key,
    required this.thickness,
  }) : super(key: key);

  final double thickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness,
    );
  }
}
