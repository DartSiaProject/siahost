import 'package:flutter/material.dart';

class FilesDynamicWidget extends StatelessWidget {
  final int bucketNumber;

  const FilesDynamicWidget({
    super.key,
    required this.bucketNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Bucket List $bucketNumber",
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
