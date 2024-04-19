import 'package:flutter/material.dart';

class CatAnimation extends StatefulWidget {
  const CatAnimation({super.key});

  @override
  State<CatAnimation> createState() => _CatAnimationState();
}

class _CatAnimationState extends State<CatAnimation> {
  bool _mostrarGato = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _mostrarGato = true;
      });
    });
  }

  void _reiniciarAnimacion() {
    setState(() {
      _mostrarGato = false;
    });
    Future.delayed(const Duration(milliseconds: 3000), () {
      setState(() {
        _mostrarGato = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _reiniciarAnimacion,
      child: Stack(
        children: [
          AnimatedPositioned(
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              top: _mostrarGato
                  ? MediaQuery.of(context).size.height / 2 - 50
                  : -100,
              left: MediaQuery.of(context).size.width / 2 - 50,
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image.asset('assets/clipart3464483.png'),
              ))
        ],
      ),
    );
  }
}
