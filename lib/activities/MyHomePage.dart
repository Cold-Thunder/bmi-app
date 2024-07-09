import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage  extends StatefulWidget {
  @override
  _MyHomePage createState() => _MyHomePage();
}
class _MyHomePage extends State<MyHomePage>{
  var wtCont = TextEditingController();
  var ftCont = TextEditingController();
  var inCont = TextEditingController();

  String result = '';
  String wet = '';

  calculate(){
    var wt = wtCont.text.toString();
    var ft = ftCont.text.toString();
    var inC = inCont.text.toString();
    if(wt != "" && ft != "" && inC != ""){
      var weight =int.parse(wt);
      var feet = int.parse(ft);
      var inches = int.parse(inC);
      var totalInc = ((feet*12)+inches)*2.4;
      var metar = (totalInc/100);
      var bmi = weight/(metar*metar);

      if(bmi < 18.5){
        setState((){
          wet = 'Have to Increase!';
        });
      }else if(bmi >= 18.5 && bmi <= 24.9){
        setState((){
          wet = 'Normal Weight!';
        });
      }else if(bmi > 24.9 && bmi < 30){
        setState((){
          wet = 'Over Weight!';
        });
      }else if(bmi > 30){
        setState((){
          wet = 'You are over weighted!';
        });
      }

      setState((){
        result = "Your BMI is : ${bmi.toStringAsFixed(3)}";
      });
      wtCont.clear();
      ftCont.clear();
      inCont.clear();
    }else{
      setState((){
        result = 'Please give all values';
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        titleTextStyle:const TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold
        ),
        title:const Text("BMI Calculator"),
        backgroundColor: Colors.purple.shade500,
        centerTitle: true,
        // backgroundColor: Colors.purple,
        elevation: 10,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20,),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1,1),
                        blurRadius: 5,
                        color: Colors.grey
                      )
                    ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child:const Text('BMI', style: TextStyle(
                              fontSize: 30,
                              color: Colors.purple,
                              fontWeight: FontWeight.bold))
                      ),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                              height: 50,
                              child: TextField(
                                  controller: wtCont,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                  decoration: InputDecoration(
                                      labelText: 'Weight',
                                      labelStyle: TextStyle(fontSize: 22, color: Colors.purple),
                                      prefixIcon: Icon(Icons.line_weight, size: 22, color: Colors.purple),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 2,
                                          color: Colors.purple,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 2,
                                          color: Colors.purple,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      hintText: 'Give your weight...',
                                      hintStyle: TextStyle(fontSize: 20, color: Colors.grey.shade500)
                                  )
                              )
                          )
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                              height: 50,
                              child: TextField(
                                  controller: ftCont,
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      labelText: 'Height(Ft)',
                                      labelStyle: TextStyle(fontSize: 22, color: Colors.purple),
                                      prefixIcon: Icon(Icons.height, size: 22, color: Colors.purple),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 2,
                                          color: Colors.purple,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 2,
                                          color: Colors.purple,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      hintText: 'Give your height in feet...',
                                      hintStyle: TextStyle(fontSize: 20, color: Colors.grey.shade500)
                                  )
                              )
                          )
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                              height: 50,
                              child: TextField(
                                  controller: inCont,
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      labelText: 'Rest Height (Inches)',
                                      labelStyle: TextStyle(fontSize: 22, color: Colors.purple),
                                      prefixIcon: Icon(Icons.height, size: 22, color: Colors.purple),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 2,
                                          color: Colors.purple,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 2,
                                          color: Colors.purple,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      hintText: 'Give your rest height in inches...',
                                      hintStyle: TextStyle(fontSize: 20, color: Colors.grey.shade500)
                                  )
                              )
                          )
                      ),
                    ],
                  )
                ),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(1,1),
                            blurRadius: 3,
                            color: Colors.grey,
                        )
                      ]
                  ),
                  child: ElevatedButton(
                    child: Text('Calculate', style: TextStyle(fontSize: 22, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                    ),
                    onPressed: (){
                      calculate();
                    }
                  )
                ),
                result != '' ? Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 100,
                  width: 300,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                    borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0,1),
                            blurRadius: 3,
                            color: Colors.grey
                        )
                      ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child:  Text("${wet != '' ? wet : ''}",
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                      Text("${result != '' ? result : ''}", style: TextStyle(fontSize: 22, color: Colors.white))

                    ]
                  )
                ) : Container()
              ]
            )
          )
        )
      )
    );
}
}