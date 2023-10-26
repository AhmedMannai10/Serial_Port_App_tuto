import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';

class HomePage extends StatefulWidget {
    const HomePage({super.key});

    @override
        State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    List<String> ports = <String>[]; 

    @override
        void initState(){
            super.initState();
            setState(() {
                    ports = SerialPort.availablePorts;
                    });
        }

    void initPorts() {
        setState(() {
                ports = SerialPort.availablePorts;
                });
    }

    final GlobalKey<ExpansionTileCardState> cardA =  GlobalKey();


    @override
        Widget build(BuildContext context) {
            return Scaffold(
                    appBar:  AppBar(title: const Text("Serial Port APP"), 
                        backgroundColor: const Color(0xff764abc)),
                    floatingActionButton: FloatingActionButton(
                        backgroundColor: const Color(0xff764abc),
                        child: const Icon(Icons.refresh_sharp),
                        onPressed: ()  {
                        initPorts();
                        }),

            body: ports.isEmpty ? 
                    Container(
                        decoration: const  BoxDecoration(color: Color(0xffA0A0B0)),
                        padding:  const EdgeInsets.all(16),

                        child: const Center(child: Text("There is no Available Port")),
                        )
                    :  ListView.builder(
                        itemCount: ports.length,
                        itemBuilder: ( context,index) {
                        SerialPort? serialPort = SerialPort(ports[index]);
                        return   Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ExpansionTileCard(
                                  baseColor: Colors.cyan[50],
                                  expandedColor: Colors.red[50],
                                  key: cardA,
                                  leading: CircleAvatar(
                                      child: Image.asset("assets/images/devs.jpg")),
                                  title:  Text( serialPort.name.toString()),
                                  subtitle: Text(serialPort.description.toString()),
                                  children: <Widget>[
                                  const Divider(
                                      thickness: 1.0,
                                      height: 1.0,
                                      ),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child:const Padding(
                                           padding: EdgeInsets.symmetric(
                                              horizontal: 16.0,
                                              vertical: 8.0,
                                              ),
                                          child: Text("N/A"),
                                          ),
                                      ),
                                  ],
                                  ),
                        );},
                        ),
                        ) ;
                            }
        }

//Container(
 //                    decoration:const BoxDecoration(color: Color(0xffEAEAef)),
  //                   margin: const EdgeInsets.all(8.0),
    //                 
     //                   child:ListTile(title: Text(ports[index])));
           
