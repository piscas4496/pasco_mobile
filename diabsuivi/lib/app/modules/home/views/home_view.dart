//import 'package:diabsuivi/app/shared/components/app_text_field.dart';
import 'package:diabsuivi/app/modules/auth/views/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
   
  HomeView({Key? key}) : super(key: key);
   
final HomeController controller = HomeController();
  Widget build(BuildContext context) {
    HomeController controller = Get.put<HomeController>(HomeController());
    return Scaffold(
      backgroundColor: Colors.blue,
      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child:Column(
            children: [
               Padding(
                 padding: const EdgeInsets.only(top:50.0),
                 child: Center(
                   child: Padding(
                     padding: const EdgeInsets.all(0.0),
                     child: Center(
                       child: TextButton(onPressed:() {
                             Get.to(AuthView());
                           }, child: Text("log out",style: TextStyle( color:Colors.white, fontSize: 16,fontWeight: FontWeight.bold),)),
                     ),
                     
                   ),
                 ),
               ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Center(
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration:const BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(image:AssetImage('assets/images/codeqr.jpg'),
                      //opacity: 0.2,
                      fit: BoxFit.cover ),
                       borderRadius: BorderRadius.all(Radius.circular(30)),
                       //color: Color(0xFF1B2A47),
                       //borderRadius: BorderRadius.only(bottomRight:Radius.circular(70),bottomLeft: Radius.circular(70))  
                     ),
                    child: Stack(
                    children: [
                   
                        
                    ],
                  ),
                  ),
                ),
              ),
               Padding(
                    padding:  EdgeInsets.only(top:0.0),
                    child: Expanded(
                      child: Center(
                          child: TextButton(onPressed:() {
                                //Get.to()=>SannerView();
                                 controller.scannerQrCode();
                                 
                              }, child: Text("Scanner",style: TextStyle( color:Colors.white, fontSize: 16,fontWeight: FontWeight.bold),)),
                        ),
                    ),
                               ),
              
            
            //   Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Container(
            //       height: 300.0,
            //       width: 400.0,
            //       decoration: const BoxDecoration(
            //           color: Colors.white,
            //               borderRadius: BorderRadius.only(
            //               topLeft: Radius.circular(5.0),
            //               topRight: Radius.circular(5.0),
            //               bottomLeft: Radius.circular(5.0),
            //               bottomRight: Radius.circular(5.0),
                          
            //               ),
            //               boxShadow:[
            //                 BoxShadow(
            //                   color: Colors.white,
            //                   offset: Offset(15, 15),
            //                   blurRadius: 8,
            //                   blurStyle:BlurStyle.normal 
                               
            //                 )
            //               ] 
                          
            //       ),
                  
            //     ),
            // ),
           const Column(
              children: [
                Text("usage",style: TextStyle(color: Colors.amber),),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("l'utilisation est très simple cliquez sur le boutton 'scanner' si vous voulez faire un conrole!",style: TextStyle(color: Colors.amber,fontSize: 11,fontWeight: FontWeight.w900,fontStyle: FontStyle.italic),),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("dans le cas contaire cliquez sur le bouton 'log out' si vous voulez vous deconnecter du systeme",style: TextStyle(color: Colors.amber,fontSize: 11,fontWeight: FontWeight.w900,fontStyle: FontStyle.italic),),
                ),
                // Text("a"),
                // Text("usage"),
                // Text("usage"),
                // Text("usage"),
                // Text("usage"),
              ],
              
            ),
          const  Padding(
              padding:  EdgeInsets.only(top:50.0),
              child: Text("powered by pascovich",style: TextStyle(color: Colors.yellow,fontSize: 7),),
            )
            ]
            
          ),
          
        )
      )                        
    );
  }
}
