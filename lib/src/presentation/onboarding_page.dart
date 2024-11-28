import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lumo_flutter/src/domain/enum/stories_objectives.enum.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String?>> onboardingContent = [
    {
      "title": "Bem-vindo ao Lumo!",
      "description":
          "Aqui, momentos simples se transformam em histórias mágicas personalizadas para seu filho, fortalecendo a conexão entre vocês.",
      "image": "assets/images/onboarding/step1.png",
      "example": null
    },
    {
      'title': StoriesObjectivesEnum.fortalecaVinculoFamiliar.title,
      'description':
          "Transforme memórias em histórias mágicas que aproximam pais e filhos.",
      'image': 'assets/images/onboarding/step2.png',
      'example':
          "Imagine uma tarde no parque transformada em uma aventura com dragões e heróis. O Lumo faz isso por você!"
    },
    {
      'title': StoriesObjectivesEnum.ensineLicoesImportantes.title,
      'description':
          "Eduque sobre coragem, empatia e valores de forma divertida.",
      'image': 'assets/images/onboarding/step3.png',
      'example':
          "Ajude sua criança a enfrentar o medo do escuro com uma história onde o personagem descobre a coragem escondida dentro dele.",
    },
    {
      'title': StoriesObjectivesEnum.estimuleCriatividade.title,
      'description':
          "Histórias criadas especialmente para inspirar a imaginação da sua criança.",
      'image': 'assets/images/onboarding/step4.png',
      'example':
          "Que tal transformar o personagem favorito da criança em um explorador de mundos submarinos cheios de mistérios?",
    },
    {
      'title': StoriesObjectivesEnum.resolvaDesafiosDoDiaDia.title,
      'description':
          "Torne momentos desafiadores mais leves com histórias educativas.",
      'image': 'assets/images/onboarding/step5.png',
      'example':
          "Use uma história onde o personagem aprende a comer vegetais com a ajuda de um coelho mágico.",
    },
    {
      'title': StoriesObjectivesEnum.guardeMemoriasInesqueciveis.title,
      'description':
          "Registre momentos especiais em histórias que sua família pode revisitar sempre.",
      'image': 'assets/images/onboarding/step6.png',
      'example':
          "Aquela viagem em família pode se tornar um conto épico sobre desbravadores de terras mágicas.",
    },
    {
      "title": "Pronto para começar?",
      "description":
          "Agora que você conhece o Lumo, crie sua primeira história personalizada para seu filho!",
      "image": "assets/images/onboarding/step7.png",
      "example": null
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemCount: onboardingContent.length,
        itemBuilder: (context, index) {
          final content = onboardingContent[index];
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  content['image']!,
                  fit: BoxFit.contain,
                  // fit: BoxFit.fitWidth,
                ),
                Flexible(child: _buildInformation(content, context, index)),
              ],
            ),
          );
        },
      ),
    );
  }

  Padding _buildInformation(
      Map<String, String?> content, BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.all(16.0.r),
      child: Column(children: [
        Text(
          content['title']!,
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        Text(
          content['description']!,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        if (content['example'] != null) ...[
          SizedBox(height: 10.h),
          Text(
            content['example']!,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
        ],
        const Spacer(),
        ElevatedButton(
          onPressed: index == onboardingContent.length - 1
              ? () => context.go('/create-story')
              : () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 32.0.w, vertical: 16.0.h),
          ),
          child: Text(
            index == onboardingContent.length - 1 ? 'Começar' : 'Próximo',
          ),
        ),
      ]),
    );
  }
}
