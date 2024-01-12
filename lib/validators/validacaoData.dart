import 'package:app_flutter/pages/recarga.dart';
import'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ValidarData extends TextInputFormatter{
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if(newValue.selection.baseOffset == 0){
      return newValue;
    }

    String dadoContido = newValue.text;
    StringBuffer buffer = StringBuffer();

    for(int i= 0; i<dadoContido.length; i++){
      buffer.write(dadoContido[i]);
      int index = i + 1;
      if(index % 2 ==0 && dadoContido.length != index){
        buffer.write("-");
      }

    }

    return TextEditingValue(
        text: buffer.toString(),
        selection: TextSelection.collapsed(offset: buffer.toString().length)
    );

  }


}
