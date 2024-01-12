import"package:app_flutter/validators/validator.dart";
import "package:app_flutter/pages/destino.dart";
import "package:app_flutter/pages/recuperarsenha.dart";
import "package:app_flutter/validators/validator.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "criarconta.dart";
import "package:app_flutter/pages/perfil.dart";


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ValidationMixin{
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 40,
            right: 40,
          ),
        child: Center(
          child: Form(
            key: formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                width: 160,
                child: Image.asset("assets/head1.png"),
              ),
              SizedBox( height: 5,),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ), style: TextStyle( fontSize: 20),
                validator: (value) {
                  if(isValidEmail(value)==true){
                    return null;
                  }
                  return "Email invalido";
                }
              ),
              SizedBox(
                height: 3,
              ), TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(6),
                  ],
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                      color: Colors.black38,
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                  ),
                ), style: TextStyle(
                fontSize: 20,
              ),
                  validator: (value) {
                    if( isValidPassword(value)){
                    return null;
                    } return "Senha invalida";

                  }
              ),
              Container(
                height: 28,
                alignment: Alignment.centerRight,
                child: TextButton(
                    child: Text(
                      "Esqueceu a senha?",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ), onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecuperarSenha(),
                    ),
                  );
                }
                ),
              ),
              Container(
                  height: 60,
                  width: 30,
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      if( formKey.currentState?.validate()==true){
                     Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context) => PerfilUsuario()),
                     ); }

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Background color
                    ),
                    child: const Text(
                      'Entrar',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  )
              ),
              Row(children: <Widget>[
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Divider(
                        color: Colors.deepOrange,
                      )),
                ),
                Text("OR", style:TextStyle( color: Colors.deepOrange),),
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: Divider(
                        color: Colors.deepOrange,
                      )),
                ),
              ]),
              Row(children: <Widget>[
                Expanded(
                  child: new Container(
                    child: Image.asset(
                      'assets/google.png',height: 135,
                    ),
                  ),),
                Expanded(
                  child: new Container(
                    child: Image.asset(
                      'assets/facebook.png', height: 135,
                    ),),
                ),
              ]),
              Container(
                height: 28,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top:1),
                margin: const EdgeInsets.only(bottom:40),
                child: TextButton(
                  child: Text(
                    "Criar nova conta?",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ), onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CriarConta()),
                  );
                },),)

            ],

          ),
          )),
    ));
  }
}

