import 'package:diabsuivi/app/modules/home/views/home_view.dart';
import 'package:diabsuivi/app/shared/components/app_buton.dart';
import 'package:diabsuivi/app/shared/components/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsertConsultationView extends GetView {
  const InsertConsultationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: const Text('Adresse du patient'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // controller: controller,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: const AppTextField(
                labelText: 'Poid*',
                hintText: 'Entrer le poid',
              ).paddingOnly(bottom: 0.0),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: const AppTextField(
                prefixIconData: Icons.flag,
                labelText: 'Imc*',
                hintText: 'Entrer  Imc',
              ).paddingOnly(bottom: 0.0),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: const AppTextField(
                labelText: 'frenquence card*',
                hintText: 'Entrer la  frequence cardiographique',
              ).paddingOnly(bottom: 0.0),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: const AppTextField(
                labelText: 'frequence resp *',
                hintText: 'Entrer la frequence respiratoire',
              ).paddingOnly(bottom: 0.0),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: const AppTextField(
                labelText: 'Taux_glycemie*',
                hintText: 'Entrer le Taux de glycemie',
              ).paddingOnly(bottom: 0.0),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: const AppTextField(
                labelText: 'activites',
                hintText: 'Entrer activites',
              ).paddingOnly(bottom: 0.0),
            ),
            Center(
              child: AppButton(
                onPressed: () {
                  // controller.login();
                  Get.to(() => HomeView());
                  // Get.to(()=>FirstPageView());
                },
                labelText: 'ENVOYER',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
