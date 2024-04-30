import 'package:flutter/material.dart';

class SegundaTela extends StatefulWidget {
  String? valor;
  SegundaTela(String this.valor);

  @override
  State<SegundaTela> createState() {
    return _SegundaTelaState();
  }
}

class _SegundaTelaState extends State<SegundaTela> {
  @override
  Widget build(BuildContext context) {
    String valor = ModalRoute.of(context)?.settings.arguments as String;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          Navigator.pop(context);
          Navigator.of(context).pushReplacementNamed("/");
        });
      },
      child: Text('Texto digitado: ${valor}', style: TextStyle(fontSize: 20)),
    );
  }
}
