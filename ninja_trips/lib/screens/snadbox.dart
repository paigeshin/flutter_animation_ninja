import 'package:flutter/material.dart';

class SandBox extends StatefulWidget {
  const SandBox({Key? key}) : super(key: key);

  @override
  State<SandBox> createState() => _SandBoxState();
}

class _SandBoxState extends State<SandBox> {
  double _opacity = 1;
  double _margin = 0;
  double _width = 200;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          margin: EdgeInsets.all(_margin),
          width: _width,
          color: _color,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _margin = 50;
                  });
                },
                child: Text('animate margin'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _color = Colors.purple;
                  });
                },
                child: Text('animate color'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _width = 400;
                  });
                },
                child: Text('animate width'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _opacity = 0;
                  });
                },
                child: Text('animate opacity'),
              ),
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 2),
                child: Text(
                  'Hide Me',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
