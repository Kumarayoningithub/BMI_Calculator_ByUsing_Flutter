import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController =TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor= Colors.indigo.shade200;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.indigo,

          title: Text('Your BMI'),
        ),
        body: Container(
          color: bgColor,
          child: Center(
            child: Container(

              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text('BMI', style: TextStyle(
                      fontSize: 34  , fontWeight: FontWeight.w700
                  ),
                  ),

                  SizedBox(height: 21,),

                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                        label: Text('Enter your Weight(in k.g.)'),
                        prefixIcon: Icon(Icons.line_weight)

                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 11,),

                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                        label: Text('Enter your Height(in ft.)'),
                        prefixIcon: Icon(Icons.height)

                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 11,),

                  TextField(
                    controller: inController,
                    decoration: InputDecoration(
                        label: Text('Enter your Height(in inch.)'),
                        prefixIcon: Icon(Icons.height)

                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 18,),

                  ElevatedButton(onPressed: (){


                    var wt= wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();

                    if(wt!= "" && ft!= "" && inch!= ""){
                      //BMI calculation

                      var iWt= int.parse(wt);
                      var iFt= int.parse(ft);
                      var iInch= int.parse(inch);

                      var tInch = (iFt*12)+iInch;
                      var tCm = tInch*2.54;
                      var tM = tCm/100;

                      var bmi = iWt/(tM*tM);
                      var msg = "";
                      if(bmi>=30 && bmi<=39.9){
                        msg = "You are Obese!!";
                        bgColor= Colors.red.shade200;
                      }
                      else if(bmi>=25 && bmi<=29.9){
                        msg = "You are OverWeight!!";
                        bgColor= Colors.yellow.shade200;
                      } else if(bmi>=18.5 && bmi<=24.9 ){
                        msg = "You are HealthyWeight!!";
                        bgColor= Colors.green.shade200;
                      } else if ( bmi <18.5){
                        msg= "You are UnderWeight ";
                        bgColor= Colors.blue.shade200;

                      }


                      setState(() {
                        result = " $msg \n  Your BMI is ${bmi.toStringAsFixed(4)}";
                      });

                    }

                    else{
                      setState(() {
                        result = "Please fill all the Required blanks!!!";
                      });
                    }


                  },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo, // Set the desired background color here
                      ),



                      child: Text('Calculate', style: TextStyle(color: Colors.white),)),

                  SizedBox(height: 11,),

                  Text(result, style: TextStyle(fontSize: 16),)



                ],
              ),
            ),
          ),
        )
    );
  }
}
