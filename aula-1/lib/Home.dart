import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{
  late AnimationController controller;

  @override
  void initState(){
    //Inicializar
    controller = AnimationController(
      //pega o mixin definido acima
        vsync: this,
        duration: const Duration(seconds: 3 )
    )..addListener(() { //Registre um fechamento a ser chamado quando o objeto mudar.
      setState((){});
    });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LinearProgressIndicator(
              value: controller.value,
            )
          ],
        ),
      ),
    );
  }
}
