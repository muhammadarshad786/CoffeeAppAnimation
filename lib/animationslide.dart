// import 'package:coffee_app/detailed.dart';
// import 'package:coffee_app/model.dart';
// import 'package:flutter/material.dart';

// const _durationss = Duration(milliseconds: 300);

// class AnimationSlide extends StatefulWidget {
//   const AnimationSlide({super.key});

//   @override
//   State<AnimationSlide> createState() => _AnimationSlideState();
// }

// class _AnimationSlideState extends State<AnimationSlide> with SingleTickerProviderStateMixin {
//   final PageController _controller = PageController(viewportFraction: 0.35);
//   final PageController _textcontroller = PageController();
//   double _currentPage = 0.0;
//   double _currenttext = 0.0;

//   void _scrollListener() {
//     setState(() {
//       _currentPage = _controller.page!;
//     });
//   }

//   void _textlistener() {
//     setState(() {
//       _currenttext = _textcontroller.page!;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _controller.addListener(_scrollListener);
//     _textcontroller.addListener(_textlistener);
//   }

//   @override
//   void dispose() {
//     _controller.removeListener(_scrollListener);
//     _textcontroller.removeListener(_textlistener);
//     _textcontroller.dispose();
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Coffee App'),
//         centerTitle: true,
//       ),
//       body: Stack(
//         children: [
//           Positioned(
//             left: 20,
//             right: 20,
//             bottom: -size.height * 0.22,
//             height: size.height * 0.3,
//             child: const DecoratedBox(
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.brown,
//                     blurRadius: 90,
//                     offset: Offset.zero,
//                     spreadRadius: 45,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Transform.scale(
//             scale: 1.6,
//             alignment: Alignment.bottomCenter,
//             child: PageView.builder(
//               controller: _controller,
//               scrollDirection: Axis.vertical,
//               itemCount: coffeess.length + 1,
//               onPageChanged: (value) {
//                 if (value < coffeess.length) {
//                   _textcontroller.animateToPage(value, duration: _durationss, curve: Curves.easeInOut);
//                 }
//               },
//               itemBuilder: (context, index) {
//                 if (index == 0 || index == coffeess.length + 1) {
//                   return const SizedBox.shrink();
//                 }

//                 final coffee = coffeess[index - 1];
//                 final result = _currentPage - index + 1;
//                 final value = -0.4 * result + 1;
//                 final opacity = value.clamp(0.0, 1.0);

//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(context, PageRouteBuilder(
//                       pageBuilder: (context, animation, secondaryAnimation) {
//                         return FadeTransition(
//                           opacity: animation.drive(Tween(begin: 0.4, end: 1.0).chain(CurveTween(curve: Curves.easeInOut))),
//                           child: HeroAnimationdetailed(coffeesssss: coffee),
//                         );
//                       },
//                     ));
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.only(bottom: 20),
//                     child: Transform(
//                       alignment: Alignment.bottomCenter,
//                       transform: Matrix4.identity()
//                         ..setEntry(3, 2, 0.001)
//                         ..translate(
//                           0.0,
//                           size.height / 2 * (1 - value).abs(),
//                         )
//                         ..scale(value),
//                       child: Opacity(
//                         opacity: opacity,
//                         child: Hero(
//                           tag: coffee.name,
//                           child: Image.asset(
//                             coffee.image,
//                             fit: BoxFit.fitHeight,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Positioned(
//             left: 0,
//             right: 0,
//             top: 0,
//             height: 100,
//             child: Column(
//               children: [
//                 Expanded(
//                   child: PageView.builder(

//                     controller: _textcontroller,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: coffeess.length+1,
//                     itemBuilder: (context, index) {
                    
//                       final opacityy = (1 - (index - _currentPage).abs()).clamp(0.0, 1.0);
//                       return Opacity(
//                         opacity: opacityy,
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
//                           child: Text(
//                             coffeess[index].name,
//                             maxLines: 2,
//                             textAlign: TextAlign.center,
//                             style: TextStyle(fontSize: 25),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//             AnimatedSwitcher(
//   duration: _durationss,
//   child: Text(
//     _currentPage >= 0 && _currentPage <=  coffeess.length+1
//         ? '\$${coffeess[_currentPage.toInt()].price.toStringAsFixed(2)}'
//         : '\$0.00',
//     style: TextStyle(fontSize: 30),
//     key: Key(coffeess[_currentPage.toInt()].name),
//   ),
// ),

//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }






import 'package:coffee_app/detailed.dart';
import 'package:coffee_app/model.dart';
import 'package:flutter/material.dart';

const _durationss = Duration(milliseconds: 300);

class AnimationSlide extends StatefulWidget {
  const AnimationSlide({super.key});

  @override
  State<AnimationSlide> createState() => _AnimationSlideState();
}

class _AnimationSlideState extends State<AnimationSlide> with SingleTickerProviderStateMixin {
  final PageController _controller = PageController(viewportFraction: 0.35);
  final PageController _textcontroller = PageController();
  double _currentPage = 0.0;
  double _currenttext = 0.0;

  void _scrollListener() {
    setState(() {
      _currentPage = _controller.page!;
    });
  }

  void _textlistener() {
    setState(() {
      _currenttext = _textcontroller.page!;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_scrollListener);
    _textcontroller.addListener(_textlistener);
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    _textcontroller.removeListener(_textlistener);
    _textcontroller.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee App'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(
            left: 20,
            right: 20,
            bottom: -size.height * 0.22,
            height: size.height * 0.3,
            child: const DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.brown,
                    blurRadius: 90,
                    offset: Offset.zero,
                    spreadRadius: 45,
                  ),
                ],
              ),
            ),
          ),
          Transform.scale(
            scale: 1.6,
            alignment: Alignment.bottomCenter,
            child: PageView.builder(
              controller: _controller,
              scrollDirection: Axis.vertical,
              itemCount: coffeess.length + 1,
              onPageChanged: (value) {
                if (value < coffeess.length) {
                  _textcontroller.animateToPage(value, duration: _durationss, curve: Curves.easeInOut);
                }
              },
              itemBuilder: (context, index) {
                if (index == 0 || index == coffeess.length+1) {
                  return const SizedBox.shrink();
                }

                final coffee = coffeess[index - 1];
                final result = _currentPage - index + 1;
                final value = -0.4 * result + 1;
                final opacity = value.clamp(0.0, 1.0);

                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return FadeTransition(
                          opacity: animation.drive(Tween(begin: 0.4, end: 1.0).chain(CurveTween(curve: Curves.easeInOut))),
                          child: HeroAnimationdetailed(coffeesssss: coffee),
                        );
                      },
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Transform(
                      alignment: Alignment.bottomCenter,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..translate(
                          0.0,
                          size.height / 2 * (1 - value).abs(),
                        )
                        ..scale(value),
                      child: Opacity(
                        opacity: opacity,
                        child: Hero(
                          tag: coffee.name,
                          child: Image.asset(
                            coffee.image,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: 100,
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _textcontroller,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: coffeess.length,
                    itemBuilder: (context, index) {
                      final opacityy = (1 - (index - _currentPage).abs()).clamp(0.0, 1.0);
                      return Opacity(
                        opacity: opacityy,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
                          child: Text(
                            coffeess[index].name,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                AnimatedSwitcher(
                  duration: _durationss,
                  child: Text(
                    _currentPage >= 0 && _currentPage < coffeess.length
                        ? '\$${coffeess[_currentPage.toInt()].price.toStringAsFixed(2)}'
                        : '\$0.00',
                    style: TextStyle(fontSize: 30),
                    key: Key(_currentPage >= 0 && _currentPage < coffeess.length 
                        ? coffeess[_currentPage.toInt()].name 
                        : 'outOfBounds'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
