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
        Column(
          children: [
            Icon(Icons.shop_two),
            Text('Novos pedidos'),
          ],
        ),
        Column(
          children: [
            Icon(Icons.people),
            Text('Novos clientes'),
          ],
        ),
        Column(
          children: [
            Icon(Icons.apartment),
            Text('Novas cidades'),
          ],
        ),
      ]),
    );
  }
}

class CardRend extends StatelessWidget {
  const CardRend({super.key});
  final Color corCard = const Color.fromARGB(255, 215, 211, 226);
  final Color corText = const Color.fromARGB(255, 33, 4, 87);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: corCard),
        child: Row(
          children: [
            Icon(
              Icons.shop_2,
              color: corText,
            ),
            const Column(
              children: [Text('RS 34.000,00'), Text('em novos pedidos')],
            )
          ],
        ));
  }
}

class ExpandableFab extends StatefulWidget {
  const ExpandableFab({
    super.key,
    this.initialOpen,
    required this.distance,
    required this.children,
  });
  final bool? initialOpen;
  final double distance;
  final List<Widget> children;

  @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab> {
  bool _open = false;

  @override
  void initState(){
    super.initState();
    _open = widget.initialOpen ?? false;
  }

  void _toggle(){
    setState((){
      _open = !_open;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          _buildTapToCloseFab();
          _buildTapToOpenFab();
        ],
      ),
    );
  }
  _buildTapToCloseFab(){
    return SizedBox(
      width: 56.0,
      height: 56.0,
      child: Material(
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        elevation: 4.0,
        child: InkWell(
          onTap: _toggle,
          child: Padding(padding: padding),
        ),
      ),
    )
  }
}
