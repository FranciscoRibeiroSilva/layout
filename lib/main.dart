import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 230, 230),
      body: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('asset/Kirio_Hikifune.png'),
              ),
              Column(
                children: [Text('Olá'), Text('Kirio Hikifune!')],
              )
            ],
          ),
          Text('Parabéns! Esse mês você fez'),
          MyCard(),
          CardRend(),
        ],
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({super.key});
  final Color corCard = const Color.fromARGB(255, 215, 211, 226);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: corCard,
      ),
      child: const Row(children: [
        Text('Novos pedidos'),
        Text('Novos clientes'),
        Text('Novas cidades'),
      ]),
    );
  }
}

class CardRend extends StatelessWidget {
  const CardRend({super.key});
  final Color corCard = const Color.fromARGB(255, 215, 211, 226);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: corCard),
        child: const Row(
          children: [
            Column(
              children: [Text('RS 34.000,00'), Text('em novos pedidos')],
            )
          ],
        ));
  }
}
