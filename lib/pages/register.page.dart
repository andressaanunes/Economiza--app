import 'package:flutter/material.dart';

enum Gender { male, female }

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _showPassword = false;
  bool _isChecked = false;
  bool _isEmailNotificationEnabled = false;
  bool _isPhoneNotificationEnabled = false;
  double fontSize = 12;
  final _formKey = GlobalKey<FormState>();
  Gender? _gender = Gender.male;

  @override
  Widget build(BuildContext context) {
    double value = 12;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create an account'),
      ),
      drawer: const Drawer(),
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 60,
                  left: 40,
                  right: 40,
                ),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/logo.png",
                        width: 180,
                        height: 180,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nome',
                        ),
                        style: const TextStyle(fontSize: 16),
                        maxLength: 50, // Limitação de caracteres
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira um nome';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Data de Nascimento',
                        ),
                        style: const TextStyle(fontSize: 20),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira uma data de nascimento';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Telefone',
                        ),
                        style: const TextStyle(fontSize: 20),
                        maxLength: 15, // Limitação de caracteres
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira um telefone';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'E-mail',
                        ),
                        style: const TextStyle(fontSize: 20),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira um e-mail';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: !_showPassword,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Senha',
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: IconButton(
                              icon: Icon(
                                _showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                            ),
                          ),
                        ),
                        style: const TextStyle(fontSize: 20),
                        maxLength: 20, // Limitação de caracteres
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira uma senha';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: <Widget>[
                          ListTile(
                            title: const Text('Masculino'),
                            leading: Radio<Gender>(
                              value: Gender.male,
                              groupValue: _gender,
                              onChanged: (Gender? value) {
                                setState(() {
                                  _gender = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('Feminino'),
                            leading: Radio<Gender>(
                              value: Gender.female,
                              groupValue: _gender,
                              onChanged: (Gender? value) {
                                setState(() {
                                  _gender = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SwitchListTile(
                        title: const Text('E-mail'),
                        value: _isEmailNotificationEnabled,
                        onChanged: (bool value) {
                          setState(() {
                            _isEmailNotificationEnabled = value;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      SwitchListTile(
                        title: const Text('Celular'),
                        value: _isPhoneNotificationEnabled,
                        onChanged: (bool value) {
                          setState(() {
                            _isPhoneNotificationEnabled = value;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: const [0.1, 1, 0.7, 0.1],
                              colors: const [
                                Color(0xFF00BFA6),
                                Color.fromRGBO(113, 195, 228, 1),
                                Color.fromARGB(255, 239, 218, 183),
                                Color.fromARGB(255, 113, 185, 219),
                              ],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Formulário válido, faça algo aqui
                              }
                            },
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Slider(
                          value: value,
                          min: 10,
                          max: 20,
                          onChanged: (double newValue) {
                            setState(() {
                              value = newValue;
                            });
                          },
                          activeColor: const Color(0xFF00BFA6),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
