
import"package:flutter/material.dart";


class RecuperarSenha extends StatefulWidget {

  const RecuperarSenha ({super.key});
  @override
  State <RecuperarSenha> createState () => _RecuperarSenhaState();
  }

  class _RecuperarSenhaState extends State<RecuperarSenha> {
    final formKey = GlobalKey<FormState>();
    final TextEditingController recoveryController = TextEditingController();

   @override

Widget build(BuildContext context){
   return Scaffold(
       backgroundColor: Colors.white,
     appBar: AppBar(
       title: Row(
         children: <Widget>[
           Expanded(child:
           Image.asset("assets/logo.png", width: 70, height:50 , alignment: Alignment(-0.3,0.0)),
           ),


         ],
       ),),
     body: Padding(
       padding: const EdgeInsets.only(
           top: 60,
           left: 40,
           right: 40),
       child: Center(
         child: Form(
       key: formKey,
       child: ListView(
         children: <Widget>[
           SizedBox(
             height: 200,
             width: 200,
             child: Image.asset("assets/reset.password.png")
           ),
            SizedBox(
              height: 20,
            ),
           Text(
             "Esqueceu a senha?",
             style: TextStyle(
               fontSize: 32,
               fontWeight: FontWeight.w500,
             ),
             textAlign: TextAlign.center

           ),SizedBox(
             height: 20,
           ),
           Text(
             "Por favor, informe o e-mail associado a conta cadastrada",
             style: TextStyle(
               fontSize: 16,
               fontWeight: FontWeight.w400,
             ),
             textAlign: TextAlign.center,
           ),
          SizedBox(
            height: 20,
          ),
           TextFormField(
             controller: recoveryController,
             keyboardType: TextInputType.emailAddress,
             decoration: InputDecoration(
               labelText: "E-mail",
               labelStyle: TextStyle(
                 color: Colors.black38,
                 fontWeight: FontWeight.w400,
                 fontSize: 20,
               ),
               ),
                style: TextStyle(
                  fontSize: 20,
             ),
             validator: (value){
     if(value == null || value.length < 6 ){
     return "Este campo precisa ser preenchido";
     }  if (!value.contains('@') || value.isEmpty){
     return "E-mail invalido";
     } if(value.contains("@") && value.contains(".com")){

       showDialog(
           context: context,
           builder: (context) {
             return AlertDialog(
                 content: Text("Um e-mail foi enviado para  sua caixa de entrada")
             );
           }
       );

     } }
           ),
          SizedBox( height: 20,),
           Container(
               height: 60,
               alignment: Alignment.center,
               decoration: BoxDecoration(
                 color: Colors.blue,
               ),
               child: SizedBox.expand(
                 child: ElevatedButton(
                   child: Text("Entrar",
                     style: TextStyle(
                         fontWeight: FontWeight.bold,
                         color: Colors.white,
                         fontSize: 20
                     ),
                     textAlign: TextAlign.center,
                   ),
                   onPressed: () {
                     formKey.currentState?.validate();
                     recoveryController.clear();

                   },

                 ),

               )


           ),

         ],

       ),

     ),
       )));
}

}