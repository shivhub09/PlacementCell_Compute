import 'package:flutter/material.dart';

class UploadDocs extends StatefulWidget {
  const UploadDocs({super.key});

  @override
  State<UploadDocs> createState() => _UploadDocsState();
}

class _UploadDocsState extends State<UploadDocs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Upload Docs here")),
    );
  }
}
