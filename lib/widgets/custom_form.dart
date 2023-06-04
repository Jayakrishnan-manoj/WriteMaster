import 'package:flutter/material.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:write_master/widgets/custom_formfield.dart';

class CustomForm extends StatelessWidget {
  final String title;
  final VoidCallback generateFunction;
  const CustomForm({
    super.key,
    required this.title,
    required this.generateFunction,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController roleController = TextEditingController();
    final TextEditingController skillsController = TextEditingController();
    final TextEditingController companyController = TextEditingController();
    final TextEditingController infoController = TextEditingController();
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              CustomFormField(
                label: "COMPANY",
                hintText: "Company name",
                formController: companyController,
                maxLines: 1,
              ),
              CustomFormField(
                label: "ROLE",
                hintText: "Role you're applying for",
                formController: roleController,
                maxLines: 1,
              ),
              CustomFormField(
                label: "SKILLS",
                hintText: "Flutter,Firebase,..",
                formController: skillsController,
                maxLines: 1,
              ),
              CustomFormField(
                label: "MORE INFO",
                hintText: "Experiences,Education,..",
                formController: infoController,
                maxLines: 4,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: NeoPopButton(
                  color: Colors.white,
                  onTapUp: () => generateFunction(),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 50,
                    ),
                    child: Text(
                      'generate',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
