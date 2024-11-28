import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lumo_flutter/src/domain/enum/stories_objectives.enum.dart';

class CreateStoryPage extends StatelessWidget {
  const CreateStoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar História'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Escolha um ou dois objetivos para a sua história",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              "Isso ajudará a moldar o tema e o enredo da sua criação.",
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                itemCount: StoriesObjectivesEnum.values.length,
                itemBuilder: (context, index) {
                  final objective = StoriesObjectivesEnum.values[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: InkWell(
                      onTap: () {
                        // Navegar para a próxima etapa
                      },
                      child: Padding(
                        padding: EdgeInsets.all(16.r),
                        child: Row(
                          children: [
                            Icon(Icons.star, size: 40.r), // Example icon
                            SizedBox(width: 16.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    objective.title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    objective
                                        .example, // Placeholder explanation
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Avançar para a próxima etapa
              },
              child: const Text("Próxima Etapa"),
            ),
          ],
        ),
      ),
    );
  }
}
