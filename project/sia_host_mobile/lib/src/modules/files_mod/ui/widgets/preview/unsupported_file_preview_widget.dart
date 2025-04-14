import 'package:flutter/material.dart';

class UnsupportedFilePreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.insert_drive_file, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text('Unsupported File Type', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
