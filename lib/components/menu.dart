import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Menu extends StatelessWidget {
  Menu({
    Key? key,
    required this.name,
    required this.color,
    required this.routeName,
    required this.svgSrc,
    required this.widthSize,
    required this.heightSize,
  }) : super(key: key);

  final String name;
  final Color color;
  final String routeName;
  final String svgSrc;
  final double widthSize;
  final double heightSize;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(200),
      shadowColor: Colors.black,
      elevation: 30,
      color: color,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * widthSize,
                  height: MediaQuery.of(context).size.width * heightSize,
                  child: SvgPicture.asset(
                    svgSrc,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize: widthSize * 50,
                    color: Colors.black,
                    decoration: TextDecoration.none),
              ),
            ]),
      ),
    );
  }
}
