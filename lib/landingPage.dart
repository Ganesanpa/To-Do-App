import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/m.dart';
import 'package:google_fonts/google_fonts.dart';

class frontPage extends StatelessWidget {
  const frontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
          body: Column(
          children: [
           
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'TO DO',
                     //style: TextStyle(fontSize: 24),
                     style: GoogleFonts.rubik(fontSize: 70.0,fontWeight: FontWeight.w700),
                    ),
                    //SizedBox(height: 20), 
                    Text(
                      'Reminds Everythings',
                      // style: TextStyle(fontSize: 24, ),
                      style: GoogleFonts.poppins(fontSize: 25.0,color:Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            
            Expanded(
              child: Container(
                width: double.infinity,
              
                
                color: const Color.fromARGB(255, 14, 66, 156), 
child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Get Started',
                     
                     style: GoogleFonts.rubik(fontSize: 30.0,fontWeight: FontWeight.w700),
                    ),
                 
                    Text(
                      'Ready to be productive? Hit Continue to begin!',
                      // style: TextStyle(fontSize: 24, ),
                      style: GoogleFonts.poppins(fontSize: 25.0,color:Colors.grey),
                    ),
                    SizedBox(height: 50,),
                    ElevatedButton(
                      child: Text("continue"),
                    style:ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 23.0),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blueGrey,
                      minimumSize: Size(200, 70)
                    ),
                     onPressed:(){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Home1()));
                     }
                    )
     
                  ],
                ),
              ),
            ),
          ],
          
        ),
    );
  }
}