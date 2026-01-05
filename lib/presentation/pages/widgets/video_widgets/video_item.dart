import 'package:flutter/material.dart';

class VideoItem extends StatelessWidget {
  const VideoItem({
    super.key,
    required this.title,
    required this.isCurrent,
    required this.onItemTapped,
  });

  final String title;
  final bool isCurrent;
  final void Function()? onItemTapped;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
      leading: Icon(isCurrent ? Icons.play_arrow_rounded : Icons.videocam),
      trailing: isCurrent ? const Text('Now Playing') : null,
      onTap: onItemTapped,
      selected: isCurrent,
      selectedColor: Colors.red,
    );
  }
}
