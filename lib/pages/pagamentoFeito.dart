import 'package:app_flutter/pages/perfil.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter/pages/recarga.dart';
import 'package:flutter/rendering.dart';

class Pagamento extends StatefulWidget{

  const Pagamento({super.key});

  @override
  _PagamentoState createState () => _PagamentoState();
}
class _PagamentoState extends State<Pagamento>{

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Container(
                child: Expanded (child:
                Image.asset("assets/logo.png", width: 70, height:50 , alignment: Alignment(-0.3,0.0))),
              )
            ],
          ),
          elevation: 0,
          foregroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.blue,
            onPressed: ()=> Navigator.pop(context,false),
          )
      ),

      body: Column(children: [

        Container(
          width:380,
          margin: EdgeInsets.only(top:60,left: 20), child: Image.asset("assets/ultima-tela.png"),
         ),
        Container(
            margin:EdgeInsets.only( top:60 ),
            child: Text( "Seu pagamento foi feito!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22), )),
        Container(
            margin:EdgeInsets.only( top:5 ),
            child: Text( "Obrigada por escolher o ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.orangeAccent),  )),
        Container(
          width:150,
          margin: EdgeInsets.only(top:5,left: 20), child: Image.asset("assets/logo.png"),
        ),

        Container(

          decoration: BoxDecoration( borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],),
          margin:EdgeInsets.only(top:80),

          height: 50,
          width: 300,
          child: SizedBox.expand(
            child: ElevatedButton( style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // Background color
            ),
                child: Text("Pronto", style: TextStyle(color: Colors.black) ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PerfilUsuario()),
                  );

                  },
    ),),
         )

      ],


      )



    );
  }
}


