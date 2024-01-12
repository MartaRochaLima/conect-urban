import "dart:math";
import "package:app_flutter/pages/pagamentoFeito.dart";
import 'package:intl/intl.dart';
import "package:app_flutter/pages/logindapagina.dart";
import "package:flutter/material.dart";
import "package:app_flutter/pages/perfil.dart";
import "package:flutter/services.dart";
import 'package:app_flutter/validators/preencher_cartao.dart';

import "../validators/validacaoData.dart";


class RecargaUsuario extends StatefulWidget{

const RecargaUsuario({super.key});

@override
State <RecargaUsuario> createState () => _RecargaUsuarioState();
}
class _RecargaUsuarioState extends State<RecargaUsuario> {
  final formKey = GlobalKey<FormState>();




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
   body: SingleChildScrollView(

     child: Column( children: <Widget>[
       Container(
         margin: EdgeInsets.only(
           top: 30,
           left:15
         ),
           child: Text(" Escolha abaixo uma forma de pagamento: ", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 15))),
       SizedBox( height: 30),

       Row(children: [
         Expanded(child: Container(
             margin: EdgeInsets.only(left:30, right:30),
             child: Divider( color: Colors.black )
         )
         )

       ],),
       Row(children: [ Container(
         margin: EdgeInsets.only(
             top:15,
             left:80),
         child: Text("Cadastro passe legal nº: 453454331"),),
         ]),
       SizedBox(height:15),
       Row(children: [ Expanded( child: Container(  margin: EdgeInsets.only(left:30, right:30), child: Divider( color: Colors.black)))],),
       SizedBox(height: 15),
       Column( children: [
      Row(children:[
        Container(
            margin:EdgeInsets.only(left:25),
            child: Icon(color: Colors.orangeAccent, Icons.credit_card)),
        Container(
            padding:EdgeInsets.only(left:30),
            child:Text("Cartão de Crédito")),
        Container(
            margin :EdgeInsets.only(left:170),
            child: IconButton(
              icon:Icon(color: Colors.green, Icons.attach_money_sharp),
              onPressed: ()
              {
                showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context){
                      return Container(
                        padding: EdgeInsets.only(top:10,left:20,right:20),
                        child: Column( children: [
                             Form(
                             key:formKey,
                              child:Column( children: [
                                  TextFormField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(16),
                                    PreencheCartao()
                                  ],
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration( hintText: "Digite o numero de seu cartão",
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular((10.0))
                                      ),
                                      prefixIcon: const Padding(
                                          padding: EdgeInsets.only(right:8),
                                          child: Icon(Icons.credit_card_outlined)),
                                      filled: true
                                  ),validator: (value) {
                                    if(value != null && value.length>= 16 ){
                                      return null;
                                    }
                                    return "Cartao invalido";
                                  },
                                ),SizedBox(height: 14,),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration( hintText: "Digite o nome que esta no cartao",
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular((10.0))
                                      ),
                                      prefixIcon: const Padding(
                                          padding: EdgeInsets.only(right:8),
                                          child: Icon(Icons.person)),
                                      filled: true
                                  ),validator: (String? value ) {
                                  if(value != null && value.length >1){
                                    return null;
                                  } return "Voce precisa preencher este campo";
                                },
                                ),SizedBox(height:14),

                                   TextFormField(

                                       inputFormatters: [
                                         FilteringTextInputFormatter.digitsOnly,
                                         LengthLimitingTextInputFormatter(4),
                                         ValidarData()

                                       ],
                                       keyboardType: TextInputType.datetime,
                                       decoration: InputDecoration( hintText: "AA-MM",
                                           enabledBorder: OutlineInputBorder(
                                               borderRadius: BorderRadius.circular((10.0))
                                           ),
                                           prefixIcon: const Padding(
                                               padding: EdgeInsets.only(right:8),
                                               child: Icon(Icons.date_range)),
                                           filled: true
                                       ),validator: (value) {
                                     if (value?.isEmpty?? true) {
                                       return 'Por favor, insira a data de validade';
                                     } else if (value?.length != 5) {
                                       return 'Formato de data inválido. Use o formato MM-AA';
                                     } else {
                                       try {
                                         print(value);

                                         String? month = value?.substring(0,2);
                                         String? year = value?.substring(3);

                                         DateFormat format = DateFormat("dd/MM/yyyy");
                                         DateTime dataCartao = format.parse("01/${month}/20${year}");
                                         DateTime dataExpiracao = DateTime(dataCartao.year, dataCartao.month+1, 0);

                                         DateTime agora = DateTime.now();

                                         if (dataExpiracao.isBefore(agora)) {
                                           return 'O cartão de crédito expirou';
                                         }
                                       } catch (e) {
                                         return 'Formato de data inválido. Use o formato MM-AA';
                                       }
                                     }
                                     return null;
                                   },),
                                   SizedBox(height:14),
                                   TextFormField(
                                     inputFormatters: [
                                       FilteringTextInputFormatter.digitsOnly,
                                       LengthLimitingTextInputFormatter(3),
                                     ],
                                     keyboardType: TextInputType.number,
                                     decoration: InputDecoration( hintText: "CVV",
                                         enabledBorder: OutlineInputBorder(
                                             borderRadius: BorderRadius.circular((10.0))
                                         ),
                                         prefixIcon: const Padding(
                                             padding: EdgeInsets.only(right:8),
                                             child: Icon(Icons.password)),
                                         filled: true
                                     ),validator: (value){
                                       if(value != null && value.length ==3){
                                         return  null;
                                       } return "Digite um codigo valido";
                                   }
                                   ),

                              ],),

                           ),
                          Row(children: [
                            Container(
                                padding:EdgeInsets.only(top:10,left:150) ,

                                child: ElevatedButton(
                                    child:Text("Pagar", style: TextStyle(fontSize: 15),),
                                    onPressed: () {
                                      if( formKey.currentState?.validate()==true){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Pagamento()),
                                        ); }

                                    }
                                )


                            )

                          ],)
                        ],)

                      );

                    });}

       )),
      ],),SizedBox(height:15),


  Row(children:[
  Container(
  margin:EdgeInsets.only(left:25),
  child: Icon(color: Colors.orangeAccent, Icons.credit_card)),
  Container(
  padding:EdgeInsets.only(left:30),
  child:Text("Cartão de Debito")),
  Container(
  margin :EdgeInsets.only(left:175),
  child: IconButton(
  icon:Icon(color: Colors.green, Icons.attach_money_sharp),
  onPressed: ()
  {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context){
        return Container(
          height: 900,
            padding: EdgeInsets.only(top:10,left:20,right:20),
            child: Column( children: [
              Form(
                key:formKey,
                child:Column( children: [
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(16),
                      PreencheCartao()
                    ],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration( hintText: "Digite o numero de seu cartão",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular((10.0))
                        ),
                        prefixIcon: const Padding(
                            padding: EdgeInsets.only(right:8),
                            child: Icon(Icons.credit_card_outlined)),
                        filled: true
                    ),validator: (value) {
                    if(value != null && value.length>= 16 ){
                      return null;
                    }
                    return "Cartao invalido";
                  },
                  ),SizedBox(height: 14,),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration( hintText: "Digite o nome que esta no cartao",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular((10.0))
                        ),
                        prefixIcon: const Padding(
                            padding: EdgeInsets.only(right:8),
                            child: Icon(Icons.person)),
                        filled: true
                    ),validator: (String? value ) {
                    if(value != null && value.length >1){
                      return null;
                    } return "Voce precisa preencher este campo";
                  },
                  ),SizedBox(height:14),

                  TextFormField(

                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                      ValidarData()

                    ],
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration( hintText: "AA-MM",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular((10.0))
                        ),
                        prefixIcon: const Padding(
                            padding: EdgeInsets.only(right:8),
                            child: Icon(Icons.date_range)),
                        filled: true
                    ),validator: (value) {
                    if (value?.isEmpty?? true) {
                      return 'Por favor, insira a data de validade';
                    } else if (value?.length != 5) {
                      return 'Formato de data inválido. Use o formato MM-AA';
                    } else {
                      try {
                        print(value);

                        String? month = value?.substring(0,2);
                        String? year = value?.substring(3);

                        DateFormat format = DateFormat("dd/MM/yyyy");
                        DateTime dataCartao = format.parse("01/${month}/20${year}");
                        DateTime dataExpiracao = DateTime(dataCartao.year, dataCartao.month+1, 0);

                        DateTime agora = DateTime.now();

                        if (dataExpiracao.isBefore(agora)) {
                          return 'O cartão de crédito expirou';
                        }
                      } catch (e) {
                        return 'Formato de data inválido. Use o formato MM-AA';
                      }
                    }
                    return null;
                  },),
                  SizedBox(height:14),
                  TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration( hintText: "CVV",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular((10.0))
                          ),
                          prefixIcon: const Padding(
                              padding: EdgeInsets.only(right:8),
                              child: Icon(Icons.password)),
                          filled: true
                      ),validator: (value){
                    if(value != null && value.length ==3){
                      return  null;
                    } return "Digite um codigo valido";
                  }
                  ),

                ],),

              ),
              Row(children: [
                Container(
                    padding:EdgeInsets.only(top:10,left:150) ,

                    child: ElevatedButton(
                        child:Text("Pagar", style: TextStyle(fontSize: 15),),
                        onPressed: () {
                          if( formKey.currentState?.validate()==true){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Pagamento()),
                            ); }

                        }
                    )


                )

              ],)
            ],)
        );});

  },)


  )],), SizedBox(height: 15),
         Row(children:[
           Container(
               margin:EdgeInsets.only(left:25),
               child: Icon(color: Colors.orangeAccent, Icons.credit_card)),
           Container(
               padding:EdgeInsets.only(left:30),
               child:Text("Boleto")),
           Container(
               margin :EdgeInsets.only(left:240),
               child: IconButton(
                 icon:Icon(color: Colors.green, Icons.attach_money_sharp),
                 onPressed: ()
                 { showDialog(
                 context: context,
                 builder: (context) {
                 return AlertDialog(
                 content: Text("Um e-mail com o boleto foi enviado paras sua caixa de entrada")
                 );});
                 },

           ))],),
         SizedBox(height:30),
         Row(children: [
           Expanded(child: Container(
               margin: EdgeInsets.only(left:30, right:30),
               child: Divider( color: Colors.grey, )
           )
           )
         ],), Container(child: Image.asset("assets/Head.png"),)

       ])])));}}


