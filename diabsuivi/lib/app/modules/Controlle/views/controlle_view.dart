import 'package:diabsuivi/app/data/models/dossier.dart';
import 'package:diabsuivi/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controlle_controller.dart';

class ControlleView extends GetView<ControlleController> {
  const ControlleView(this.dossier,{Key? key}) : super(key: key);
   final Dossier? dossier;
  
     
  @override
  Widget build(BuildContext context) {
      HomeController controller= Get.put<HomeController>(HomeController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text("DGM TRAFIC CONTROLLER"),
        centerTitle: true,
      ),
      // controller.load.value?const Center(child: CupertinoActivityIndicator(),):
      // Obx(() =>
      //); 
       body: 
      SingleChildScrollView(
                    child:Column(
                      
                      children: [
                          Padding(
            padding:  EdgeInsets.only(top: 8),
            child:   Center(child:  
            Container(
              height: 300,
              width: 400,             
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        image: DecorationImage(
          image:AssetImage("assets/images/dgmcontrol.jpeg"),
          fit: BoxFit.cover
          )
      )
,
              child: Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.white,
                      child:ClipOval(
                        child: SizedBox.fromSize(
                        size: const Size.fromRadius(98),
                        
                         child:Image.asset("assets/images/pasco.jpeg",fit: BoxFit.cover,),
                         
                      // CachedNetworkImage(
                      //  // height: 100,
                      //  imageUrl:'${Api.host}/storage/images/${dossier!.image}',
                      //   fit: BoxFit.cover,
                      // ) ,
                        // child:  Image.asset(
                        //     "assets/images/login1.jpg",
                           
                         // ),
                      ),)
                         
                      ),
                  ),
                ],
              ),
            )
              ),
          ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(top:8.0,left: 8.0),
                                     child: Container(child:const Text("IDENTITE DU CITOYEN",style: TextStyle(fontWeight: FontWeight.bold),),),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(left:8.0),
                                     child:  Text("${dossier!.nom}",style:TextStyle(color: Colors.blue, fontSize: 14,fontWeight: FontWeight.bold)),
                                   ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0,left: 8),
                                    child: Container(child: Text("N° DE LA CARTE ",style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0,left: 8.0),
                                    child: Container(child: Text("${dossier!.numeroCarte}",style:TextStyle(fontSize: 14,color:Colors.blue,fontWeight: FontWeight.bold)),),
                                  ),
                                 ],
                               ),
                             ),
                             
                            Padding(
                              padding: const EdgeInsets.only(left:0.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                     padding: const EdgeInsets.only(top:8.0),
                                     child: Container(child:const Text("INTITULE DOCUMENT",style: TextStyle(fontWeight: FontWeight.bold),),),
                                   ),
                                   Container(child: Text("${dossier!.designation}",style:TextStyle(color: Colors.blue, fontSize: 14,fontWeight: FontWeight.bold)),),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Container(child: Text("N° DU DOCUMENT ",style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(child: Text("070808080",style:TextStyle(fontSize: 14,color:Colors.blue,fontWeight: FontWeight.bold)),),
                                  ),
                                   
                                ],
                              ),
                            )
                            
                          ],
                        ),
                       
                         Padding(
                           padding: const EdgeInsets.only(top:18.0),
                           child: Container(child:Column(children: [
                           // Text("status",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
                            Container(
                              height:120,
                              width: 120,
                              //color: Colors.blue,
                              decoration:const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(75))
                              ),
                              child: Center(child: Text("${dossier!.statutDocument}".toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color:Colors.white),)),
                            )
                           ],) ,),
                         ),
                       
                      ],
                    ),
                  )     
      
       //
       //
       //
       //
       //ClipOval(
        
      //   child:CachedNetworkImage(
      //     height: 100,
      //    imageUrl:'${Api.host}/storage/images/${dossier!.image}'
      //   ) 
      // ,)
      
      
    
        
    );
  }
}
