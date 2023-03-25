import 'package:doctor_book/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/utils/image_constants.dart';
import '../models/patient_model.dart';

class PatientListTile extends StatelessWidget {
  final Patient patient;
  const PatientListTile(this.patient, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () async {
                final Uri url = Uri(scheme: 'tel',path: "7506470449");
                if(await canLaunchUrl(url)){
                  await launchUrl(url);
                }
                else
                  {
                     print('cannot launch');
                  }
            },
            icon: Icon(
            Icons.call,
            color: Colors.white,
          ),)

        ],
      ),
      title: Text(
        patient.name!,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        patient.age.toString(),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      trailing:
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        //],
      //)
    );
  }
}
