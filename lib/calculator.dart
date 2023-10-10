import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


class Calculator extends StatefulWidget {
  const Calculator({super.key});
  static TextEditingController valueController = TextEditingController();

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
   String output = "0";
   
 
void buttonPressed(String buttonText) {
  setState(() {
    if (buttonText == "C") {
      output = "0";
    } else if (buttonText == "=") {
      Parser p = Parser();
      try {
        Expression exp = p.parse(output);
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        output = eval.toString();
      } catch(e) {
        output = "Error";
      }
    }else {
      if (output == "0") {
        output = buttonText;
      } else {
        output = output + buttonText;
      }
    }
  });
}
void buttonIconPressed(IconData buttonIcon) {
  setState(() {
if (buttonIcon == Icons.backspace_outlined) {
      if (output.length > 1) {
        output = output.substring(0, output.length - 1);
      } else {
        output = "0";
      }
    }
  });
}


  
  Widget buildButton(String buttonText) {
    return Expanded(
      child: MaterialButton(
        hoverColor: const Color.fromARGB(255, 36, 2, 63),
        focusColor: const Color.fromARGB(255, 108, 4, 194),
        child: Text(buttonText, style: const TextStyle(fontSize: 20.0,color: Colors.white)),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }
   Widget buildIconButton(IconData buttonIcon) {
    return Expanded(
      child: MaterialButton(
              hoverColor: const Color.fromARGB(255, 36, 2, 63),
        focusColor: const Color.fromARGB(255, 108, 4, 194),
        child: const Icon(Icons.backspace_outlined,color: Colors.white),
        onPressed: () => buttonIconPressed(buttonIcon),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Center(
    child: Container(
      width: 500.0,
      height: 500.0,
        decoration: const BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.black, // Change the shadow color here
        blurRadius: 10.0,
      ),
    ],
  ),
      child: Card(
         color: const Color.fromARGB(255, 19, 1, 34),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 20,bottom: 20),
            alignment: Alignment.centerRight,
            child: Text(output, style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold,color: Colors.white)),
           
          ),
          const Divider(thickness: 5,),
          Column(children: [
            
           Container(
            margin: const EdgeInsets.only(top: 20,bottom: 20),
            child: Row(children: [
              buildButton("7"),
              buildButton("8"),
              buildButton("9"),
              buildButton("/")
            ]),),
            Container(
            margin: const EdgeInsets.only(top: 20,bottom: 20),
            child:Row(children: [
              buildButton("4"),
              buildButton("5"),
              buildButton("6"),
              buildButton("*")
            ]),),
             Container(
            margin: const EdgeInsets.only(top: 20,bottom: 20),
            child: Row(children: [
              buildButton("1"),
              buildButton("2"),
              buildButton("3"),
              buildButton("-")
            ]),),
             Container(
            margin: const EdgeInsets.only(top: 20,bottom: 20),
            child: Row(children: [
              buildButton("0"),
              buildButton("00"),
              buildButton("."),
              buildButton("+")
            ]),),
             Container(
            margin: const EdgeInsets.only(top: 20,bottom: 20),
            child:Row(children: [
              buildButton("C"),
              buildButton("="),
              buildIconButton(Icons.backspace_outlined),
              buildButton("%")
              
            ]),)
          ]),
        ],
      ),
      ),
    ),
    
  ),);
  
  }
}
