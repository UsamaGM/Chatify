import 'package:chatify/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _firebase = FirebaseService();
  bool _hasFinishedLoading = false;

  @override
  void initState() async {
    super.initState();
    await _firebase.initialize().then(
          (value) => setState(() {
            _hasFinishedLoading = true;
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(80, 80),
                      ),
                    ),
                    color: Colors.amber,
                  ),
                ),
                const Icon(
                  CupertinoIcons.chat_bubble_2_fill,
                  color: Colors.blueGrey,
                  size: 150,
                )
              ],
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
