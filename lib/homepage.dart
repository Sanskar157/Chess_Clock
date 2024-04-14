import 'package:chess_clock/provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChessClock>(
      create: (ctx) => ChessClock(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text(
              'Chess Clock',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          body: SafeArea(
            child: Consumer<ChessClock>(builder: (cxt, ChessClock, child) {
              return Column(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (ChessClock.isWhiteTurn) {
                          ChessClock.switchTurn();
                          
                        } else {
                          ChessClock.startStop();
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        color: ChessClock.isWhiteTurn == false ? Colors.green : Colors.grey,
                        alignment: Alignment.center,
                        child: Text(
                          (ChessClock.whiteTime.inSeconds / 60)
                              .toStringAsFixed(2),
                          style: const TextStyle(fontSize: 50,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            ChessClock.reset();
                          },
                          child: const Icon(
                            Icons.refresh,
                            color: Colors.white,
                            size: 40,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (!ChessClock.isWhiteTurn) {
                          ChessClock.switchTurn();
                        } else {
                          ChessClock.startStop();
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        color: ChessClock.isWhiteTurn == true ? Colors.green : Colors.grey,
                        alignment: Alignment.center,
                        child: RotatedBox(
                          quarterTurns: 2,
                          child: Text(
                            (ChessClock.blackTime.inSeconds / 60)
                                .toStringAsFixed(2),
                            style: const TextStyle(fontSize: 50,fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
