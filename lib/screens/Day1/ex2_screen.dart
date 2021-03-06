import 'package:flutter/material.dart';

class Exercise2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const _colorsMain = Colors.pinkAccent;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Row(
            children: [
              Expanded(
                flex: 120,
                child: Column(
                  children: [
                    Expanded(
                        flex: 115,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      color: Colors.red,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      color: Colors.orange,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      color: _colorsMain,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      color: Colors.lightBlueAccent,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            color: Colors.greenAccent,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            color: Colors.yellowAccent,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                    Expanded(
                      flex: 323 - 125,
                      child: Container(
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      flex: 520 - 323,
                      child: Container(
                        color: Colors.yellow,
                      ),
                    ),
                    Expanded(
                      flex: 716 - 520,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 301 - 91,
                child: Container(
                  color: _colorsMain,
                ),
              ),
              Expanded(
                flex: 315 - 301,
                child: Container(
                  color: Colors.white,
                ),
              ),
              Expanded(
                flex: 424 - 315,
                child: Container(
                  color: _colorsMain,
                ),
              ),
            ],
          ),
          Positioned(
            width: 140,
            height: 140,
            bottom: (0.9 / 3) * MediaQuery.of(context).size.height,
            left: (1 / 8) * MediaQuery.of(context).size.width,
            child: Container(
              color: Colors.black38,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
