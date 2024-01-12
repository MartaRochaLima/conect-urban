import 'package:app_flutter/pages/LGPD.dart';
import 'package:flutter/services.dart';
import "../validators/validator.dart";
import 'package:flutter/material.dart';


class CriarConta extends StatefulWidget {
  const CriarConta({super.key});

  @override
  State<CriarConta> createState() => _CriarContaState();
}

class _CriarContaState extends State<CriarConta> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController sobrenomeController = TextEditingController();
  final TextEditingController passeLegalController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Expanded(child:
            Image.asset("assets/logo.png", width: 70, height:50 , alignment: Alignment(0.2,0.0)),),
            Container(
              padding: EdgeInsets.only(left:20),
              width: 80,
              height: 70,
              child: MaterialButton( onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LGPD()),
                );
              },
                  child: Image.asset("assets/LGPD.png"))

            )




          ],
        ),

      ),
      body: Padding(
      padding: const EdgeInsets.only(
          top: 10,
          left:40,
          right: 40),
        child: Center(
    child: Form(
        key: formKey,
        child: ListView(

          children: <Widget>[
            Container(
              margin:EdgeInsets.only(top: 1),
              width: 200,
              height: 160,
              decoration: BoxDecoration(
                image: new DecorationImage(
                  image: AssetImage("assets/SouEu.png"),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
                SizedBox( ),
                Row(children: <Widget> [
                  Expanded(
                      child:   TextFormField(
                        controller: nomeController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          icon: Icon(Icons.assignment_ind),
                          labelText: "Nome",
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 17,),
                          validator: (String? value) {
                            if(value == null || value.isEmpty ){
                              return "Preencha este campo";
                            }
                              return null;
                          }
                      ),

                  ),
                  Expanded(
                      child:   TextFormField(
                          controller: sobrenomeController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          icon: Icon(Icons.assignment_ind),
                          labelText: "Sobrenome",
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 20,),
                          validator: (String? value) {
                            if(value == null || value.isEmpty ){
                              return "Preencha este campo";
                            }
                            return null;
                          }
                      ), ),
                ],),
               SizedBox(
                height:3),
            Expanded(
              child:   TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(9),
                  ],
                  controller: passeLegalController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    icon: Icon(Icons.app_registration),
                    labelText: "Passe Legal nº",
                    labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 20,),
                  validator: (String? value) {
                    if(value == null || value.isEmpty ){
                      return "Preencha este campo";
                    }
                    return null;
                  }
              ),

            ),
               SizedBox(height:3),
               TextFormField(
                   controller: emailController,
               keyboardType: TextInputType.emailAddress,
               decoration: InputDecoration(
                 icon: Icon(Icons.email_outlined),
               labelText: "E-mail",
               labelStyle: TextStyle(
               color: Colors.black38,
               fontWeight: FontWeight.w400,
                fontSize: 20,
                ),
                ),
                 style: TextStyle(
                 fontSize: 20,),
                   validator: (String? value) {
                     if(value == null || value.length < 6 ){
                       return "Este campo precisa ser preenchido";
                     }  if (!value.contains('@') || value.isEmpty){
                       return "E-mail invalido";
                     } if(value.contains("@")  && value.contains(".com")){
                       return null;
                     }
                     ;
                   }
                ),
               SizedBox(
                 height:3),
               TextFormField(
                   inputFormatters: [
                     LengthLimitingTextInputFormatter(6),
                   ],
                 controller: senhaController,
               keyboardType: TextInputType.text, obscureText: true,
               decoration: InputDecoration(
                 icon: Icon(Icons.lock_outline),
               labelText: "Senha",
               labelStyle: TextStyle(
               color: Colors.black38,
               fontWeight: FontWeight.w400,
               fontSize: 20,
               ),
               ),
               style: TextStyle(
               fontSize: 20,),
                validator: (String? value) {
                if(value == null || value.isEmpty || value.length < 6 ){
               return "Senha invalida";
                }if( value.length ==6 ){
                  return null;
                }}
               ),
               SizedBox(
               height:3),
               Container(
               height:45,
               alignment: Alignment.center,
               decoration: BoxDecoration(
               color: Colors.blue,
               borderRadius: BorderRadius.all(Radius.circular(5),),),
               child: SizedBox.expand(
               child: ElevatedButton(
                child: Text("Cadastrar"),
                onPressed: () {
                  if (formKey.currentState?.validate() == true) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              content: Text("Um e-mail foi enviado para  sua caixa de entrada")
                          );
                        }
                    );
                    nomeController.clear();
                    sobrenomeController.clear();
                    passeLegalController.clear();
                    emailController.clear();
                    senhaController.clear();
                  }
                }),),
               ),
               SizedBox(
               height:7,),
               Container(
                   child: TextButton(
                       child: Text(
                         "Cancelar",
                textAlign: TextAlign.center,
                ),
                onPressed: () =>  Navigator.pop(context, false),
                ),
               ),
    ]
    )

    ))),);
  }

}