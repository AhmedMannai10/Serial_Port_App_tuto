import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class IOPortPage extends StatefulWidget {
  const IOPortPage({super.key, required this.portName});

  final String portName;

  @override
  State<IOPortPage> createState() => _IOPortPageState();
}

class _IOPortPageState extends State<IOPortPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.portName),
        backgroundColor: const Color.fromARGB(247, 13, 16, 20),
      ),
    );
  }
}
