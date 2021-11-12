import 'package:flutter/material.dart';


class AuthBackground extends StatelessWidget {

  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _PurpleBox(),
          _HeaderIcon(),
          this.child
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin:EdgeInsets.only(top:30),
        child: Icon(Icons.person, color: Colors.white, size: 100,),
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final size =  MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.45,
      decoration: _buildBoxDecoration(),
      child: Stack(
        children: [
          Positioned(child: _Burbuja(), top: 90,right: -10,),
          Positioned(child: _Burbuja(), top: -10,left: -15,),
          // Positioned(child: _Burbuja(), top: 96,left: 110,),
          Positioned(child: _Burbuja(), bottom: -50,left: 130,),
          Positioned(child: _Burbuja(), bottom: 120,left: -50,)
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(65, 63, 156, 1),
          Color.fromRGBO(90, 70, 178, 1),
        ]
      )
    );
  }
}

class _Burbuja extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );
  }
}
