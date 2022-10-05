import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
  }) : super(key: key);

  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.index,
    required this.text,
    required this.onTap,
    required this.onLongPress,
  }) : super(key: key);

  final dynamic index;
  final String text;
  final void Function() onTap;
  final void Function() onLongPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: index.isEven ? Colors.amber : Colors.cyan,
      margin: const EdgeInsets.symmetric(vertical: 3.0),
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Text(text),
      ),
    );
  }
}
