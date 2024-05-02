import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:project/pages/segundaTela.page.dart';

class PrimeiraTela extends StatefulWidget {
  State<PrimeiraTela> createState() => _PrimeiraTelaState();
}

class _PrimeiraTelaState extends State<PrimeiraTela> {
  TextEditingController _nameController = TextEditingController();

  List<PieChartSectionData> mockData = [
    PieChartSectionData(
        value: 25, color: const Color(0xFF00BFA6), title: 'Saldo'),
    PieChartSectionData(
        value: 25, color: Color.fromARGB(255, 253, 69, 69), title: 'Despesas'),
    PieChartSectionData(
        value: 25, color: Color.fromARGB(255, 238, 237, 177), title: 'Reserva'),
    PieChartSectionData(
        value: 25,
        color: const Color.fromARGB(255, 113, 185, 219),
        title: 'Investimentos'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/menu.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              //dashboard
              Container(
                height: 200,
                width: 200,
                child: PieChart(
                  PieChartData(
                    sections: mockData,
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    borderData: FlBorderData(show: false),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        buildCard(
                          title: 'Carteira',
                          icon: Icon(Icons.account_balance_wallet),
                          child: Text('Acompanhe sua carteira mensal'),
                        ),
                        buildCard(
                          title: 'Despesas',
                          icon: Icon(Icons.attach_money),
                          child: Text('Adicione suas despesas mensais'),
                        ),
                        buildCard(
                          title: 'Receitas',
                          icon: Icon(Icons.monetization_on),
                          child: Text('Acompanhe suas receitas mensais'),
                        ),
                        buildCard(
                          title: 'Reservas',
                          icon: Icon(Icons.save),
                          child: Text('Acompanhe suas reservas mensais'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        buildCard(
                          title: 'Investimentos',
                          icon: Icon(Icons.trending_up),
                          child: Text('Adicione seus investimentos'),
                        ),
                        buildCard(
                          title: 'Metas',
                          icon: Icon(Icons.check_circle),
                          child: Text('Adicione Projetos e Metas para o mês'),
                        ),
                        buildCard(
                          title: 'Dicas',
                          icon: Icon(Icons.lightbulb_outline),
                          child: Text('Aprenda dicas para economizar'),
                        ),
                        buildCard(
                          title: 'Personalize',
                          icon: Icon(Icons.settings),
                          child: Text('Preferências para o app'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onHorizontalDragEnd: (DragEndDetails details) {
                  if (details.velocity.pixelsPerSecond.dx < 0) {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            SegundaTela(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          var begin = Offset(1.0, 0.0);
                          var end = Offset.zero;
                          var tween = Tween(begin: begin, end: end);
                          var offsetAnimation = animation.drive(tween);

                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                      ),
                    );
                  }
                },
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFF00BFA6)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business, color: Color(0xFF00BFA6)),
            label: 'My Account',
          ),
        ],
      ),
    );
  }

  // Reusable card widget with title, icon, and child widget
  Widget buildCard(
      {required String title, required Icon icon, required Widget child}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              icon,
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child,
                  ],
                ),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 2.0,
        shadowColor: Colors.grey.withOpacity(0.5),
      ),
    );
  }
}
