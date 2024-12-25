import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lumo_flutter/src/domain/enum/stories_objectives.enum.dart';
import 'package:lumo_flutter/src/presentation/story/widgets/card_story_widget.dart';

class CreateStoryPage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _objectivesListKey = GlobalKey();

  CreateStoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sugestões de Histórias'),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: _buildHeader(),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: _buildActionButtons(context),
            ),
            SizedBox(height: 24.h),
            Divider(
              key: _objectivesListKey,
              color: Theme.of(context).dividerColor,
            ),
            SizedBox(height: 24.h),
            _buildObjectivesList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          "O que você prefere?",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          "Escolha entre criar sua história ou usar uma já recomendada.",
          style: TextStyle(fontSize: 16.sp),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        _buildActionButton(
          context,
          icon: Icons.edit,
          label: "Crie sua História",
          onPressed: () {
            // Navegar para a página de criação
            context.go('/create-story/objective');
          },
        ),
        SizedBox(width: 16.w),
        _buildActionButton(
          context,
          icon: Icons.book,
          label: "Histórias Recomendadas",
          onPressed: () {
            _scrollToObjectivesList();
          },
        ),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onPressed}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        child: SizedBox(
          height: 75.h,
          child: Column(
            children: [
              Icon(icon, size: 32.r),
              SizedBox(height: 8.h),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildObjectivesList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: StoriesObjectivesEnum.values.length,
      itemBuilder: (context, index) {
        final objective = StoriesObjectivesEnum.values[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: _buildObjectiveSection(objective),
        );
      },
    );
  }

  Widget _buildObjectiveSection(StoriesObjectivesEnum objective) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            objective.title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 12.h),
        _buildRecommendedStories(objective),
      ],
    );
  }

  Widget _buildRecommendedStories(StoriesObjectivesEnum objective) {
    return SizedBox(
      height: 280.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3, // Três histórias recomendadas
        itemBuilder: (context, storyIndex) {
          return Padding(
            padding: EdgeInsets.only(
              right: storyIndex == 0 ? 16.w : 12.w,
              left: storyIndex == 0 ? 16.w : 0,
            ),
            child: CardStoryWidget(
              benefits: const [
                "Ensinar a importância de usar o vaso sanitário",
                "Aprender a fazer xixi",
                "Não colocar o dedo na tomada"
              ],
              storyIndex: storyIndex,
            ),
          );
        },
      ),
    );
  }

  void _scrollToObjectivesList() {
    final context = _objectivesListKey.currentContext;
    if (context != null) {
      // Calcula a posição do widget
      final box = context.findRenderObject() as RenderBox;
      final position = box.localToGlobal(Offset.zero).dy +
          _scrollController.offset -
          AppBar().preferredSize.height -
          16.h;

      // Anima o scroll até a posição do widget
      _scrollController.animateTo(
        position,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }
}
