import 'package:libserialport/libserialport.dart';

class ManagePort{

  late SerialPort port ;

  String? portName;

  ManagePort.fromName(String this.portName){
    port = SerialPort(portName!);
  }


  open(){
    
  }

  


}