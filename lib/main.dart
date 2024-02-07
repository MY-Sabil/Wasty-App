import 'package:flutter/material.dart';
import 'package:scan_qr/Buttons/buttons.dart';
import 'package:scan_qr/functionality/scan_qr_code.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Scan',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int points = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scan'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color(0xff00c897),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0)),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.control_point,
                        size: 20.0,
                        color: Color(0xff00c897),
                      ),
                      Text(
                        ' $points',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xff00c897),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 120.0,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xff00c897)),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Redeem',
                          style:
                              TextStyle(color: Color(0xffffffff), fontSize: 16.0),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContentButtons(
                icons: Icons.qr_code_scanner_rounded,
                text: 'Scan QR',
                onPressed: () async {
                  // Navigate to the ScanQR screen
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScanQR()),
                  );

                  // Show popup with the scanned result
                  if (result != null) {
                    setState((){
                      points += 50;
                    });
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Scanned Result'),
                          content: Text(result),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
              ContentButtons(
                  icons: Icons.pin_drop_rounded,
                  text: 'Find BinBin',
                  onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
