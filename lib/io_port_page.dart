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
  FocusNode keepFocus = new FocusNode();

  List<String> io_Buffer = <String>[];

  TextEditingController inputData = TextEditingController();

  String outputData = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.portName),
        backgroundColor: const Color.fromARGB(247, 13, 16, 20),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 1, 9, 22),
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(10),
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  // These are the slivers that show up in the "outer" scroll view.
                  return <Widget>[
                    SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                      sliver: const SliverAppBar(
                        centerTitle: true,

                        title:
                            Text('OutPut'), // This is the title in the app bar.
                        automaticallyImplyLeading: false,
                        pinned: false,
                      ),
                    ),
                  ];
                },
                body: RawScrollbar(
                  thumbColor: Colors.amber,
                  radius: const Radius.circular(20),
                  thickness: 5,
                  child: Scrollbar(
                    // outputing data on the screen with the stream builder
                    child: ListView.builder(
                      reverse: true,
                      itemCount: io_Buffer.length,
                      itemBuilder: (BuildContext context, int index) {
                        int reversedIndex = io_Buffer.length - 1 - index;
                        // int reversedIndex = index;
                        return Container(
                          constraints: const BoxConstraints(maxHeight: 50),
                          child: SelectableText(
                            '>> ${io_Buffer[reversedIndex]}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 236, 238, 242),
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: TextField(
                      autofocus: true,
                      focusNode: keepFocus,
                      style: const TextStyle(color: Colors.blue),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Type commande',
                        suffixIcon: IconButton(
                          onPressed: () {
                            inputData.clear();
                          },
                          icon: const Icon(Icons.clear),
                        ),
                      ),
                      controller: inputData,
                      onSubmitted: (str) {
                        if (inputData.text.isEmpty) {
                          setState(() => Null);
                        } else {
                          setState(
                            () {
                              io_Buffer.add(inputData.text);
                              // port.write(inputData.text);
                              // port.write(" ");
                              // inputBuffer.add(inputData.text);
                              inputData.clear();
                            },
                          );
                          inputData.clear();
                          keepFocus.requestFocus();
                        }
                      },
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: 50,
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: MaterialButton(
                        child: const Icon(Icons.send),
                        onPressed: () {
                          if (inputData.text.isEmpty) {
                            setState(() {
                              Null;
                            });
                          } else {
                            setState(() {
                              io_Buffer.add(inputData.text);
                              // port.write(inputData.text);
                              // port.write(" ");
                              inputData.clear();
                            });
                            keepFocus.requestFocus();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
