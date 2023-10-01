import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});
  static TextEditingController valueController = TextEditingController();
  static int k = 1;

  @override
  Widget build(BuildContext context) {
    return  Center(
    child: Container(
      width: 400.0,
      height: 400.0,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: valueController,
                          style: const TextStyle(color: Color.fromARGB(97, 20, 13, 13)),
                          decoration: const InputDecoration(
                            labelText: '0',
                            labelStyle: TextStyle(
                              color: Color.fromARGB(97, 8, 6, 6),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white38,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                for (int i = 0; i < 3; i++)
                  Expanded(
                    child: Row(
                      children: [
                        for (int j = 0; j < 3; j++,k++)
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                print('Card $i $j tapped');
                              },
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '$k',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
  }
}
