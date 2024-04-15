import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;
  final String text;
  const NoteTile({super.key, required this.text, required this.onDeletePressed, required this.onEditPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(top: 10, left: 25, right: 25),
      child: ListTile(
        title: Text(text),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: onEditPressed, icon: Icon(Icons.edit),),

            IconButton(onPressed: onDeletePressed, icon: Icon(Icons.delete),)
          ],
        ),
      ),
    );
  }
}
