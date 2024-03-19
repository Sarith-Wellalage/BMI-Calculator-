import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
      theme: ThemeData(
          primaryColor:const Color(0xFF12a644)
      ),
      home: const MyApp(),
      debugShowCheckedModeBanner: false,
    )
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  double _height=170.0;
  double _weight=75.0;
  int _bmi=0;
  String _condition='Select Data';
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: size.height*0.40,
              width: double.infinity,
              decoration: const BoxDecoration(color: Color(0xFF12a644)),
              padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("BMI",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 60.0),),
                  const Text("Calculator",style: TextStyle(color: Colors.white,fontSize: 40.0),),
                  SizedBox(
                    width: double.infinity,
                    child: Text("$_bmi",
                      style:const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 45.0
                      ),textAlign: TextAlign.right,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Condition : ",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25.0
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: _condition,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                            ),)
                        ]
                    ),

                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  SizedBox(height: size.height*0.03,),
                  const Text("Choose Data",style: TextStyle(color: Color(0xFF12a644),fontSize: 30.0,fontWeight: FontWeight.bold),),
                  SizedBox(height: size.height*0.03,),
                  RichText(
                    text: TextSpan(
                        text: "Height : ",
                        style: const TextStyle(
                            color: Color(0xFF403f3d),
                            fontSize: 25.0
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "$_height cm",
                            style: const TextStyle(
                                color: Color(0xFF403f3d),
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                            ),)
                        ]
                    ),

                  ),
                  SizedBox(height: size.height*0.03,),
                  Slider(
                    value: _height,
                    min:0,
                    max: 250,
                    onChanged: (height){
                      setState(() {
                        _height=height;
                      });
                    },
                    divisions: 250,
                    label: "$_height",
                    activeColor:const Color(0xFF403f3d),
                    inactiveColor: Colors.grey,
                  ),
                  SizedBox(height: size.height*0.03,),
                  RichText(
                    text: TextSpan(
                        text: "Weight : ",
                        style: const TextStyle(
                            color: Color(0xFF403f3d),
                            fontSize: 25.0
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "$_weight kg",
                            style: const TextStyle(
                                color: Color(0xFF403f3d),
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                            ),)
                        ]
                    ),

                  ),
                  SizedBox(height: size.height*0.03,),
                  Slider(
                    value: _weight,
                    min:0,
                    max: 300,
                    onChanged: (weight){
                      setState(() {
                        _weight=weight;
                      });
                    },
                    divisions: 300,
                    label: "$_weight",
                    activeColor:const Color(0xFF403f3d),
                    inactiveColor: Colors.grey,
                  ),
                  SizedBox(height: size.height*0.03,),
                  SizedBox(
                    width: size.width*0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            //18.5 - 25 Healthy 25-30 Overweight >30 Obesity
                            _bmi=(_weight/((_height/100)*(_height/100))).round().toInt();
                            if(_bmi>=18.5 && _bmi<=25) {_condition=" Normal";}
                            else if(_bmi>25 && _bmi<=30) {_condition=" Overweight";}
                            else if(_bmi>30) {_condition=" Obesity";}
                            else  {_condition=" Underweight";}
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color(0xFF12a644)),
                          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15,horizontal: 40)),
                        ),
                        child: const Text("Calculate",style: TextStyle(color: Colors.white,fontSize: 20.0),),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
