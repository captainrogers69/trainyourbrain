import 'package:flutter/material.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            value: 0,
            child: Text(
              'View Contact',
            ),
          ),
          const PopupMenuItem(
            value: 1,
            child: Text(
              'Media,links,and docs',
            ),
          ),
          const PopupMenuItem(
            value: 1,
            child: Text(
              'Search',
            ),
          ),
          const PopupMenuItem(
            value: 1,
            child: Text(
              'More',
            ),
          ),
        ];
      },
    );
  }
}
