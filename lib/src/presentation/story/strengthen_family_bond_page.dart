import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StrengthenFamilyBondPage extends StatelessWidget {
  const StrengthenFamilyBondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> formData = {};

    return Scaffold(
      appBar: AppBar(
        title: const Text("Fortaleça o Vínculo Familiar"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Queremos criar uma história única para fortalecer o vínculo entre você e sua criança.",
                style: TextStyle(fontSize: 16.sp),
              ),
              SizedBox(height: 16.h),
              _buildDropdown(
                label: "Escolha um momento especial",
                options: [
                  "Hora de dormir",
                  "Café da manhã",
                  "Hora de brincar",
                  "Outro",
                ],
                onChanged: (value) => formData['specialMoment'] = value,
              ),
              _buildDropdown(
                label: "Com quem a criança interage?",
                options: [
                  "Pai",
                  "Mãe",
                  "Avós",
                  "Irmãos",
                  "Outro",
                ],
                onChanged: (value) => formData['familyMember'] = value,
              ),
              _buildTextField(
                label: "Um valor ou emoção que deseja reforçar",
                hint: "Ex: Amor, gratidão, paciência",
                onChanged: (value) => formData['value'] = value,
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Próximo"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required List<String> options,
    required Function(String?) onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 16.sp)),
          DropdownButtonFormField<String>(
            items: options.map((option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option, style: TextStyle(fontSize: 14.sp)),
              );
            }).toList(),
            onChanged: onChanged,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required Function(String) onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 16.sp)),
          TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
