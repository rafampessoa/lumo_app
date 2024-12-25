import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardStoryWidget extends StatelessWidget {
  final List<String> benefits; // Lista de benefícios passados para o card
  final int storyIndex;

  const CardStoryWidget(
      {super.key, required this.benefits, required this.storyIndex});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: InkWell(
        onTap: () {
          // Ação para abrir a história sugerida
        },
        child: SizedBox(
          width: 200.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container da imagem com sobreposição de texto
              Stack(
                children: [
                  // Imagem de fundo com Lorem Picsum
                  Container(
                    height: 120.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.r),
                        topRight: Radius.circular(8.r),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://picsum.photos/200/300?random=${storyIndex + 1}", // Imagem aleatória com base no índice
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Gradiente atrás do título
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8.r),
                          bottomRight: Radius.circular(8.r),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                  // Título sobre a imagem com sombra
                  Positioned(
                    bottom: 10.h,
                    left: 12.w,
                    right: 12.w,
                    child: Text(
                      "História ${storyIndex + 1}",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 8.0,
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              // Lista de benefícios
              Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: benefits
                      .map((benefit) => _buildBenefit(benefit))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para representar os benefícios
  Widget _buildBenefit(String benefit) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Row(
        children: [
          Icon(Icons.check_circle, size: 16.r, color: Colors.green),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              benefit,
              style: TextStyle(fontSize: 12.sp),
              // maxLines: 1,
              // overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
