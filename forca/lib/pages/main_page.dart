import 'package:flutter/material.dart';
import 'package:forca/components/fail_dialog.dart';
import 'package:forca/components/input.dart';
import 'package:forca/components/large_button.dart';

class MainPage extends StatefulWidget {
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final controller = TextEditingController();
  String mensagem = '';
  String palavra = 'processo';
  String secreto = '**********';
  int tentativas = 10;
  bool acertou = false;

  List<String> letrasTentadas = [];
  List<String> letrasCertas = [];

  void verificaEntradaDoInput(String valor) {
    if (valor.length != 1) {
      setState(() {
        mensagem = 'Insira apenas uma letra';
      });
    } else if (valor == '1' ||
        valor == '2' ||
        valor == '3' ||
        valor == '4' ||
        valor == '5' ||
        valor == '6' ||
        valor == '7' ||
        valor == '8' ||
        valor == '9' ||
        valor == '0') {
      setState(() {
        mensagem = 'Insira apenas letras';
      });
    } else if (valor.length == 1) {
      compararPalavra(valor);
    }
  }

  void verificaLetra(valor) {
    
    for (int i = 0; i < palavra.length; i++) {
      if (valor == palavra[i]) {
        setState(() {
          letrasCertas.add(valor);
        });
      }
    }
  }

  void compararPalavra(valor) {
    verificaLetra(valor);
    setState(() {
      letrasTentadas.add(valor.toUpperCase());
      mensagem = '';
      tentativas--;
    });
  }

  void Jogar() {
    if (tentativas > 0) {
      var letraInserida = controller.text;
      verificaEntradaDoInput(letraInserida);
      setState(() {
        letraInserida = '';
      });
    } else {
      showDialog(
          context: context,
          builder: (context) => FailDialog(palavra, () => recomecar()));
    }
    controller.clear();
  }

  void recomecar() {
    setState(() {
      tentativas = 10;
      Navigator.pop(context);
      letrasTentadas.clear();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Jogo da Forca',
            style: TextStyle(color: Colors.blue, fontSize: 30),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Tentativas: $tentativas'),
                SizedBox(
                  height: 30,
                ),
                Text(
                  secreto,
                  style: TextStyle(fontSize: 50),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 80,
                  child: Column(
                    children: [
                      Text('Letras tentadas'),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(letrasTentadas.join(' ')),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(letrasCertas.join(' ')),
                        ],
                      )
                    ],
                  ),
                ),
                Text(mensagem),
                Input(controller),
                SizedBox(
                  height: 30,
                ),
                LargeButton(Jogar)
              ],
            ),
          ),
        ));
  }
}
