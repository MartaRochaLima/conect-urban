 import "dart:ui";

import "package:app_flutter/pages/destino.dart";
import "package:app_flutter/pages/logindapagina.dart";
import "package:app_flutter/pages/recarga.dart";
import "package:flutter/material.dart";

class PerfilUsuario extends StatefulWidget{

  const PerfilUsuario({super.key});

  @override
  State <PerfilUsuario> createState () => _PerfilUsuarioState();
}
class _PerfilUsuarioState extends State<PerfilUsuario>{


  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Expanded(child:
              Image.asset("assets/logo.png", width: 70, height:50 , alignment: Alignment(-0.3,0.0))),

             ],
          ),
          elevation: 0,
    foregroundColor: Colors.black,
    leading: IconButton(
    icon: Icon(Icons.pin_drop_outlined),
    color: Colors.white,
    onPressed: ()=>  Navigator.push(context, MaterialPageRoute(builder: (context) => Destino(),
  )

    )) ),
      body: SingleChildScrollView(
        child: Column (
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 18,
                  left: 120,
              ),
          child: Stack(
            alignment: Alignment.center,
              children: [
              Container (
                padding: EdgeInsets.only(left:36),
                height: 150, width: MediaQuery.of(context).size.width,
                child: Text("Meu perfil",
                    style:  TextStyle( fontWeight: FontWeight.bold,
                    fontSize: 18, fontFamily:"Arial" ))
              ),
                Padding(padding: EdgeInsets.only(top: 20, right: 120),
              child: CircleAvatar(radius: 50, backgroundColor: Colors.orangeAccent,
                  child: CircleAvatar(child: Container( padding: EdgeInsets.only( top:50, left:71),
                      child:CircleAvatar(backgroundColor: Colors.white,
                          radius: 9,
                          child: Center(child: Icon( color: Colors.black, Icons.edit, size: 13), ))),
                    radius: 46, backgroundImage: AssetImage("assets/imgUsuario.png"),)))
              ],),),
            SizedBox(
              height:8,
            ),
            Text("Sobrenome, Nome" , style: TextStyle( fontWeight: FontWeight.bold, fontSize: 15)),
            Text("usuario@conecturban.com.br"),
            Column(
              children: <Widget>[
              Container(
                padding: EdgeInsets.only( left: 270, ),
            child: Row(children: [
              Container(
                padding: EdgeInsets.only( left: 50),
                child: Center(child: Icon(color: Colors.orangeAccent, Icons.logout_outlined, size: 26, )),
              ),
             Container(
               child: TextButton(
                   child: Text(
                     "Sair",
                     style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: Colors.blue),
                   ), onPressed: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) => LoginPage(),
                   ),
                 );
               }
               ),
             ),])
           ),
           ] ),
             SizedBox(height:10),
        Row(children: <Widget>[
          Expanded(
            child: new Container(
              margin: EdgeInsets.only(left:30, right:30),
                child: Divider( color: Colors.grey,
                )),
          ),
  ]), SizedBox(height:15),
            Container(
            padding: EdgeInsets.only(right:200),
            child: Text("Configurações e Preferências", style: TextStyle(fontWeight: FontWeight.w300, fontFamily: "Arial"))),
        SizedBox(height: 10),
        Column(children: [
          Row(children: [
          Container(
            margin:EdgeInsets.only(left:25),
              child: Icon(color: Colors.orangeAccent, Icons.notification_important)),
           Container(
               padding:EdgeInsets.only(left:30),
               child:Text("Notificações")),
            Container(
               margin :EdgeInsets.only(left:200),
                 child:Icon(color: Colors.black, Icons.arrow_forward_ios)),
          ],), SizedBox(height:18),
           Row(children: [
            Container(
                margin:EdgeInsets.only(left:25),
                child: Icon(color: Colors.orangeAccent, Icons.money)),
            Container(
                padding:EdgeInsets.only(left:30),
                child:Text("Recarga Cartão")),
             Container(
                 margin :EdgeInsets.only(left:170),
               child: IconButton(
            icon:Icon(color: Colors.black, Icons.arrow_forward_ios),
             onPressed: ()=>{
               Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (context) => RecargaUsuario()),
               )
             },
             )
                ),
         ]),



          SizedBox(height:10),

        ],),
            SizedBox(height:8),
          Row(children: [
            Expanded(
              child: new Container(
                  margin: EdgeInsets.only(left:30, right:30),
                  child: Divider( color: Colors.grey
                  )),
            ),
          ],),
            SizedBox(),
            Container(
                padding: EdgeInsets.only(right:320),
                child: Text("Suporte", style: TextStyle(fontWeight: FontWeight.w300, fontFamily: "Arial"))),
            SizedBox(height:8),
            Column( children: [
              Row( children: [
                Container(
                    margin:EdgeInsets.only(left:25),
                    child: Icon(color: Colors.orangeAccent, Icons.contact_support)),
                Container(
                    padding:EdgeInsets.only(left:30),
                    child:Text("Central de ajuda")),
                Container(
                    margin :EdgeInsets.only(left:175),
                    child:Icon(color: Colors.black, Icons.arrow_forward_ios)),
              ],),
              Row(children: [
                Container(
                  height: 100,
                  width: 200,
                  margin :EdgeInsets.only(left:100,bottom: 700, top: 0.1),
                  child: Image.asset("assets/Head.png", width: 200, height:190),
                ),
              ],),

            ],),

         ]))

    );

  }

}