import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

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
  final Color violetaClaro = const Color.fromARGB(255, 75, 28, 162);
  final Color cinza = const Color.fromARGB(255, 230, 230, 230);
  final Color violetaEscuro = const Color.fromARGB(255, 33, 4, 87);
  final Color vinho = const Color.fromARGB(255, 79, 66, 111);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cinza,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 55.0),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: CircleAvatar(
                    radius: 35.0,
                    backgroundImage: AssetImage('asset/Kirio_Hikifune.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Text(
                        'Olá',
                        style: TextStyle(
                            fontFamily: 'Marker Felt', color: violetaClaro),
                        textAlign: TextAlign.right,
                      ),
                      const Text('Kirio Hikifune!'),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Text('Parabéns! Esse mês você fez'),
          const MyCard(),
          const CardRend(),
        ],
      ),
      floatingActionButton: ExpandableFab(distance: 120, children: [
        Column(
          children: [
            ActionButton(
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            const Text('representantes')
          ],
        ),
        Column(
          children: [
            ActionButton(
              icon: const Icon(
                Icons.add_shopping_cart_rounded,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            const Text('pedidos')
          ],
        ),
        Column(
          children: [
            ActionButton(
              icon: const Icon(
                Icons.person_add,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            const Text('clientes'),
          ],
        ),
      ]),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({super.key});
  final Color corCard = const Color.fromARGB(255, 215, 211, 226);
  final Color cor1 = const Color.fromARGB(255, 33, 4, 87);
  final Color cor2 = const Color.fromARGB(255, 79, 66, 111);
  final Color cor3 = const Color.fromARGB(255, 75, 28, 162);

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
      ),
    );
  }
}

class ExpandableFab extends StatefulWidget {
  const ExpandableFab(
      {Key? key, required this.children, required this.distance})
      : super(key: key);

  final List<Widget> children;
  final double distance;

  @override
  _ExpandableFabState createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _expandAnimation;
  bool _open = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        value: _open ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 250),
        vsync: this);

    _expandAnimation = CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
        reverseCurve: Curves.easeOutQuad);
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          _tapToClose(),
          ..._buildExpandableFabButton(),
          _tapToOpen(),
        ],
      ),
    );
  }

  Widget _tapToClose() {
    return SizedBox(
      height: 55,
      width: 55,
      child: Center(
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          color: const Color.fromARGB(255, 33, 4, 87),
          child: InkWell(
            onTap: _toggle,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.add_sharp,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _tapToOpen() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      transformAlignment: Alignment.center,
      transform:
          Matrix4.diagonal3Values(_open ? 0.7 : 1.0, _open ? 0.7 : 1.0, 1.0),
      curve: Curves.easeOut,
      child: AnimatedOpacity(
        opacity: _open ? 0.0 : 1.0,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 33, 4, 87),
          onPressed: _toggle,
          child: const Icon(
            Icons.add_sharp,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildExpandableFabButton() {
    final List<Widget> children = <Widget>[];
    final count = widget.children.length;
    final step = 90.0 / (count - 1);

    for (var i = 0, angleInDegrees = 0.0;
        i < count;
        i++, angleInDegrees += step) {
      children.add(_ExpandableFab(
          directionDegrees: angleInDegrees,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i]));
    }

    return children;
  }
}

class _ExpandableFab extends StatelessWidget {
  const _ExpandableFab(
      {Key? key,
      required this.directionDegrees,
      required this.maxDistance,
      required this.progress,
      required this.child})
      : super(key: key);

  final double directionDegrees;
  final double maxDistance;
  final Animation<double>? progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress!,
      builder: (context, child) {
        final offset = Offset.fromDirection(
            directionDegrees * (math.pi / 180), progress!.value * maxDistance);

        return Positioned(
          right: 4.0 + offset.dx,
          bottom: 4.0 + offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress!.value) * math.pi / 2,
            child: child,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress!,
        child: child,
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({Key? key, this.onPressed, required this.icon})
      : super(key: key);

  final VoidCallback? onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: const Color.fromARGB(255, 79, 66, 111),
      elevation: 4.0,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
