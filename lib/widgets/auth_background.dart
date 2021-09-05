import 'package:flutter/material.dart';
import 'package:master_jobz/helpers/environment.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
  const AuthBackground({
    Key? key, required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          Box(size: size),
          Align(alignment: Alignment.topCenter ,child: Icono(size: size)),
          this.child
        ],
      ),
    );
  }
}
class AuthBackgroundRegister extends StatelessWidget {
  final Widget child;
  const AuthBackgroundRegister({
    Key? key, required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Environment.negro,
      child: Stack(
        children: [
          Container(
          width: double.infinity,
          height: size.height * 0.2,
          decoration: BoxDecoration(
          color: Environment.negro,
          ),
          child: Center(child: Text('Register', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),),
        ),
          this.child
        ],
      ),
    );
  }
}

class Icono extends StatelessWidget {
  const Icono({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 50),
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: Environment.negro,
          borderRadius: BorderRadius.circular(200),
          border: Border.all(color:Colors.white, width: 5 )
        ),
        child: Center(child: Image(
              image: AssetImage('assets/logowhite.png'),
            ),),
      ),
    );
  }
}

class Box extends StatelessWidget {
  const Box({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: BoxDecoration(
        color: Environment.negro,
      ),
    );
  }
}