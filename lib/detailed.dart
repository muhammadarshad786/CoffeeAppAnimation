import 'package:coffee_app/model.dart';
import 'package:flutter/material.dart';

class HeroAnimationdetailed extends StatefulWidget {
  final Coffee coffeesssss;
  const HeroAnimationdetailed({super.key, required this.coffeesssss});

  @override
  State<HeroAnimationdetailed> createState() => _HeroAnimationdetailedState();
}

class _HeroAnimationdetailedState extends State<HeroAnimationdetailed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.coffeesssss.name),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: Hero(
              tag: widget.coffeesssss.name,
              child: Image.asset(widget.coffeesssss.image),
            ),
          ),
          Text(widget.coffeesssss.name),
        ],
      ),
    );
  }
}
