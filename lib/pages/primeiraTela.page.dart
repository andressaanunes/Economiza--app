import 'package:flutter/material.dart';

class PrimeiraTela extends StatefulWidget {
  State<PrimeiraTela> createState() {
    return _PrimeiraTelaState();
  }
}

class _PrimeiraTelaState extends State<PrimeiraTela> {
  TextEditingController _nameController = TextEditingController();

  Widget build(BuildContext context) {
    final String nome = ModalRoute.of(context)?.settings.arguments != null
        ? ModalRoute.of(context)?.settings.arguments as String
        : '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Bem vindo(a), $nome'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Digite seu nome'),
            controller: _nameController,
          ),
          Text('Primeira Tela'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                Navigator.of(context).pushNamed(
                  "/segunda",
                  arguments: _nameController.text,
                );
              });
            },
            child: Text('Ir para segunda tela'),
          ),
        ],
      ),
    );
  }
}
