import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lumo_flutter/src/domain/enum/stories_objectives.enum.dart';

class CreateOwnStoryObjectivePage extends StatelessWidget {
  final List<StoriesObjectivesEnum> objectives = StoriesObjectivesEnum.values;

  const CreateOwnStoryObjectivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selecione um Objetivo"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 16.0.w), // Use ScreenUtil for padding
        child: ListView.builder(
          padding: EdgeInsets.only(top: 16.0.h, bottom: 16.0.h),
          itemCount: objectives.length,
          itemBuilder: (context, index) {
            final objective = objectives[index];

            return GestureDetector(
              onTap: () {
                // Navegação direta para a próxima página
                context.go('/create-story/objective/record');
              },
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      12.0.r), // Use ScreenUtil for radius
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0.w), // Use ScreenUtil for padding
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star, // Use any icon
                        size: 24.0.sp, // Use ScreenUtil for size
                        color: Colors.blue, // Set the color of the icon
                      ),
                      // SizedBox(width: 8.0.w), // Use ScreenUtil for spacing
                      // Image.asset(
                      //   getIconPath(objective),
                      //   height: 50.h, // Use ScreenUtil for height
                      //   width: 50.w, // Use ScreenUtil for width
                      //   fit: BoxFit.contain,
                      // ),
                      SizedBox(width: 12.0.w), // Use ScreenUtil for spacing
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              objective.title,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize:
                                    16.0.sp, // Use ScreenUtil for font size
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height: 8.0.h), // Use ScreenUtil for spacing
                            Text(
                              objective.example,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize:
                                    14.0.sp, // Use ScreenUtil for font size
                                color: Colors.grey[600],
                              ),
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
    );
  }
}
