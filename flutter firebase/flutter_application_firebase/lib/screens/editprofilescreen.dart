import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FilePickerDemo extends StatefulWidget {
  @override
  _FilePickerDemoState createState() => _FilePickerDemoState();
}

class _FilePickerDemoState extends State<FilePickerDemo> {
  File? _selectedFile;

  Future<void> _pickFile() async {
    //final result = await FilePicker.platform.pickFiles();

    FilePickerResult? result = await FilePicker.platform.pickFiles(
     
      type: FileType.custom,
      allowedExtensions: [ 'pdf', 'doc'],
    );

    if (result != null && result.files.isNotEmpty) {
      
      setState(() {
        _selectedFile = File(result.files.single.name
         
        );
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Picker '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_selectedFile != null)
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Center(
                  child: Text(
                    //value: FileType.custom,
                    _selectedFile!.path.split('/').first,
                                   
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ElevatedButton(
              onPressed: _pickFile,
              child: Text('Select File'),
            ),
          ],
        ),
      ),
    );
  }
}
