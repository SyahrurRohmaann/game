import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:si_udin_app/menu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Force landscape orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Si UDIN',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Bubblegum',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFAA00), // Orange sky color
              Color(0xFFFFDD00), // Light orange/yellow for lower sky
            ],
          ),
        ),
        child: Stack(
          children: [
            // Sun
            Positioned(
              top: size.height * 0.1,
              right: size.width * 0.2,
              child: Container(
                width: size.width * 0.15,
                height: size.width * 0.15,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFEE44),
                ),
              ),
            ),

            // Birds in the sky
            Positioned(
              top: size.height * 0.15,
              left: size.width * 0.3,
              child: Row(
                children: [
                  _buildBird(),
                  SizedBox(width: size.width * 0.02),
                  _buildBird(),
                  SizedBox(width: size.width * 0.01),
                  _buildBird(),
                ],
              ),
            ),

            // Left green bush
            Positioned(
              left: 0,
              top: size.height * 0.2,
              bottom: 0,
              child: Container(
                width: size.width * 0.15,
                decoration: const BoxDecoration(
                  color: Color(0xFF44AA44),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: 10,
                      top: size.height * 0.2,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 25,
                      top: size.height * 0.3,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Right green bushes
            Positioned(
              right: 0,
              top: size.height * 0.15,
              bottom: 0,
              child: Container(
                width: size.width * 0.2,
                decoration: const BoxDecoration(
                  color: Color(0xFF44AA44),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(120),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 15,
                      top: size.height * 0.15,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 35,
                      top: size.height * 0.25,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 55,
                      top: size.height * 0.35,
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Ground with path
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: size.height * 0.3,
              child: CustomPaint(
                size: Size(size.width, size.height * 0.3),
                painter: GroundPathPainter(),
              ),
            ),

            // Fence
            Positioned(
              left: size.width * 0.2,
              bottom: size.height * 0.3,
              child: _buildFence(size),
            ),

            // Tiger character
            Positioned(
              left: size.width * 0.1,
              bottom: size.height * 0.12,
              width: size.width * 0.3,
              height: size.height * 0.6,
              child: Image.asset(
                'assets/images/tiger.png',
                fit: BoxFit.contain,
              ),
            ),

            // Logo text
            Positioned(
              right: size.width * 0.1,
              top: size.height * 0.25,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Si",
                        style: TextStyle(
                          color: Colors.cyan,
                          fontSize: size.height * 0.12,
                          fontWeight: FontWeight.bold,
                          height: 0.8,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "U",
                        style: TextStyle(
                          color: const Color(0xFFCCFF00),
                          fontSize: size.height * 0.12,
                          fontWeight: FontWeight.bold,
                          height: 0.8,
                        ),
                      ),
                      Text(
                        "D",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: size.height * 0.12,
                          fontWeight: FontWeight.bold,
                          height: 0.8,
                        ),
                      ),
                      Text(
                        "I",
                        style: TextStyle(
                          color: const Color(0xFFCCFF00),
                          fontSize: size.height * 0.12,
                          fontWeight: FontWeight.bold,
                          height: 0.8,
                        ),
                      ),
                      Text(
                        "N",
                        style: TextStyle(
                          color: const Color(0xFFFF8800),
                          fontSize: size.height * 0.12,
                          fontWeight: FontWeight.bold,
                          height: 0.8,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    'Bermain Dan Belajar',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: size.height * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Start button (Mulai)
            Positioned(
              bottom: size.height * 0.18,
              right: size.width * 0.2,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuPage()),
                    ); // Navigate to the game screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF88FF00),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                        vertical: size.height * 0.02),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Mulai',
                    style: TextStyle(
                      fontSize: size.height * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            // Settings gear icon
            Positioned(
              top: size.height * 0.05,
              right: size.width * 0.05,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: size.height * 0.05,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBird() {
    return const CustomPaint(
      size: Size(20, 10),
      painter: BirdPainter(),
    );
  }

  Widget _buildFence(Size size) {
    final postWidth = size.width * 0.02;
    final postHeight = size.height * 0.15;
    final postGap = size.width * 0.005;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) => Container(
          margin: EdgeInsets.only(right: postGap),
          width: postWidth,
          height: postHeight,
          decoration: BoxDecoration(
            color: const Color(0xFFEEDDCC),
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(2, 2),
                blurRadius: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BirdPainter extends CustomPainter {
  const BirdPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black54
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw simple bird shape (like an "m" or "w")
    final path = Path()
      ..moveTo(0, size.height / 2)
      ..quadraticBezierTo(
        size.width / 4,
        0,
        size.width / 2,
        size.height / 2,
      )
      ..quadraticBezierTo(
        3 * size.width / 4,
        size.height,
        size.width,
        size.height / 2,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class GroundPathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final groundPaint = Paint()
      ..color = const Color(0xFF88CC66)
      ..style = PaintingStyle.fill;

    final pathPaint = Paint()
      ..color = const Color(0xFFCCDD88)
      ..style = PaintingStyle.fill;

    // Draw ground
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      groundPaint,
    );

    // Draw path
    final path = Path()
      ..moveTo(size.width * 0.4, 0)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.5,
        size.width * 0.6,
        size.height,
      )
      ..lineTo(size.width * 0.4, size.height)
      ..quadraticBezierTo(
        size.width * 0.45,
        size.height * 0.5,
        size.width * 0.4,
        0,
      );

    canvas.drawPath(path, pathPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
