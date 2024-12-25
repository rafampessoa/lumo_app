enum StoriesObjectivesEnum {
  fortalecaVinculoFamiliar(
    title: 'Fortaleça o Vínculo Familiar',
    example:
        'Transforme momentos simples em histórias mágicas que aproximam pais e filhos.',
    iconPath: 'assets/images/fortaleca_vinculo_familiar.png',
  ),
  ensineLicoesImportantes(
    title: 'Ensine Lições Importantes',
    example:
        'Ajude sua criança a enfrentar o medo do escuro com uma história onde o personagem descobre a coragem escondida dentro dele.',
    iconPath: 'assets/images/fortaleca_vinculo_familiar.png',
  ),
  estimuleCriatividade(
    title: 'Estimule a Criatividade',
    example:
        'Inspire a imaginação da sua criança com histórias criadas especialmente para ela.',
    iconPath: 'assets/images/fortaleca_vinculo_familiar.png',
  ),
  resolvaDesafiosDoDiaDia(
    title: 'Resolva Desafios do Dia a Dia',
    example:
        'Ajude sua criança a enfrentar o medo do escuro com uma história onde o personagem descobre a coragem escondida dentro dele.',
    iconPath: 'assets/images/fortaleca_vinculo_familiar.png',
  ),
  guardeMemoriasInesqueciveis(
    title: 'Guarde Memórias Inesquecíveis',
    example:
        'Transforme momentos simples em histórias mágicas que aproximam pais e filhos.',
    iconPath: 'assets/images/fortaleca_vinculo_familiar.png',
  );

  const StoriesObjectivesEnum({
    required this.title,
    required this.example,
    required this.iconPath,
  });

  final String title;
  final String example;
  final String iconPath;
}
