import "package:app_flutter/main.dart";
import"package:flutter/material.dart";
import"package:app_flutter/pages/criarconta.dart";

void main ()=> runApp(MyApp());

class LGPD extends StatefulWidget {
  @override
_LGPDState createState() => _LGPDState();
}

class _LGPDState extends State<LGPD>{

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Row(
        children: <Widget>[
        Expanded(child:
        Image.asset("assets/logo.png", width: 70, height:50 , alignment: Alignment(-0.3,0.0))),

    ],
    ),
    ),
        body: SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
    '''
Informativo LGPD: Protegendo Suas Informações Pessoais com o Aplicativo Conect Urban

Prezado(a) usuário(a) do Conect Urban,
Estamos comprometidos em garantir a segurança e a privacidade de suas informações pessoais. Como parte de nossa dedicação a isso, é essencial que você saiba sobre a Lei Geral de Proteção de Dados (LGPD) e como ela se aplica ao nosso aplicativo.

O que é a LGPD?

A Lei Geral de Proteção de Dados (Lei nº 13.709/2018) é uma legislação brasileira que estabelece regras para a coleta, o tratamento e o armazenamento de dados pessoais, com o objetivo de proteger a privacidade e os direitos dos cidadãos. Ela entrou em vigor em setembro de 2020 e se aplica a qualquer entidade que processe dados pessoais, incluindo empresas, organizações e aplicativos como o nosso.

O Que Isso Significa Para Você?

- Transparência: Comprometemo-nos a informar claramente como coletamos e usamos seus dados pessoais. Nosso aplicativo possui uma Política de Privacidade que descreve esses processos de forma detalhada.

- Consentimento: Antes de coletar qualquer informação pessoal, solicitamos seu consentimento explícito. Você tem o direito de decidir se deseja compartilhar seus dados e pode revogar seu consentimento a qualquer momento.

- Acesso e Retificação: A LGPD lhe dá o direito de acessar os dados que coletamos sobre você e de corrigir qualquer informação imprecisa ou desatualizada.

- Segurança de Dados: Implementamos medidas de segurança robustas para proteger suas informações pessoais contra acesso não autorizado ou uso indevido.

- Exclusão de Dados: Você pode solicitar a exclusão de seus dados pessoais, a menos que haja uma obrigação legal ou regulamentar que exija a retenção de tais informações.

- Responsabilidade: Somos responsáveis pelo tratamento adequado de seus dados pessoais e pelo cumprimento da LGPD.

Como o Aplicativo Conect Urban utiliza seus Dados?

Nosso aplicativo coleta informações pessoais para melhorar sua experiência e garantir a eficácia do sistema de passes de transporte público. Essas informações incluem nome, endereço de e-mail e informações de pagamento. Utilizamos esses dados apenas para os fins para os quais foram fornecidos, como emissão de bilhetes, notificações de viagem e suporte ao cliente.

Seus dados são armazenados de forma segura e nunca são compartilhados com terceiros sem seu consentimento explícito, a menos que seja necessário para a execução de nossos serviços ou estejamos legalmente obrigados a fazê-lo.

Como Exercer Seus Direitos LGPD?


Se você deseja exercer seus direitos sob a LGPD, como acessar seus dados, revogar o consentimento ou solicitar a exclusão de suas informações, entre em contato conosco através de nosso suporte ao cliente. Estamos aqui para ajudar e garantir que seus direitos sejam respeitados.

Estamos comprometidos com a privacidade e a proteção de dados pessoais de nossos usuários. Se tiver alguma dúvida ou preocupação, não hesite em nos contatar. Sua confiança é fundamental para nós, e continuaremos aprimorando nossas práticas para cumprir com as regulamentações da LGPD.

Atenciosamente,

Marta Lima
CEO

Aplicativo Conect Urban, a sua conexão urbana.
              ''',
      style: TextStyle(fontSize: 16),
        ))



    )

    );
  }



}
