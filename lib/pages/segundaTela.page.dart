import 'package:flutter/material.dart';

class SegundaTela extends StatefulWidget {
  // String? valor;
  // SegundaTela(this.valor); // Add the missing argument here

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
          Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => SegundaTela(),
          // ...
        ),
          );
        });
      },
      child: Text('Texto digitado: ${valor}', style: TextStyle(fontSize: 20)),
    );
  }
}
