class SportCenter {
  final String centerName;
  final List<String> sports;
  final double rating;
  final String imageurl;

  const SportCenter({
    required this.centerName,
    required this.sports,
    required this.rating,
    required this.imageurl,
  });
}

// Initialize the list of SportCenter objects with const constructors
List<SportCenter> sportCenterList = [
  const SportCenter(
    centerName: "Journée Portes Ouvetes",
    sports: ["L’École Nationale des Sciences Appliquées d’EL Jadida (ENSAJ) et l’École Supérieure d’Éducation et Formation (ESEF) ont organisé conjointement une journée des portes ouvertes le samedi 2 mars 2024. Cet événement a constitué une opportunité exceptionnelle d’échange pour les étudiants de ces deux établissements et les bacheliers du secondaire en offrant aux lycéens une occasion unique de découvrir les programmes académiques, les installations et les ressources disponibles dans ENSAJ et ESEF. Des démonstrations."],
    rating: 12.04,
    imageurl: "assets/images/2.jpg",
  ),
  const SportCenter(
    centerName: "CÉRÉMONIE J23",
    sports: ["L’Ecole Nationale des Sciences Appliquées d’El Jadida organisera le 24 avril 2024 la 8ème édition du Forum ENSAJ ENTREPRISES. Cette édition aura pour thème « L’intelligence Artificielle au service de l’ingénierie moderne – Révolution Technologique pour un avenir durable »."],
    rating: 24.01,
    imageurl: "assets/images/5.jpg",
  ),
  const SportCenter(
    centerName: "CBE-Maroc",
    sports: ["Pour tisser des liens plus étroits avec le milieu socio-économique et établir des collaborations fructueuses, l’École Nationale des Sciences Appliquées d’El Jadida a accueilli le lundi 19 février 2024 le Directeur développement durable et relations publiques de Riva Industries, un complexe sidérurgique et métallurgique implanté au niveau de la zone industrielle Medz / Jorf Lasfar. Cette rencontre a permis d’explorer des possibilités de partenariats stratégiques et de discuter des besoins mutuels en termes de recherche, de développement et de formation, ouvrant ainsi la voie à une collaboration fructueuse entre l’école et cette entreprise."],
    rating: 11.12,
    imageurl: "assets/images/4.jpg",
  ),
  const SportCenter(
    centerName: "Playing Ground",
    sports: ["L’Ecole Nationale des Sciences Appliquées d’El Jadida organisera le 24 avril 2024 la 8ème édition du Forum ENSAJ ENTREPRISES. Cette édition aura pour thème « L’intelligence Artificielle au service de l’ingénierie moderne – Révolution Technologique pour un avenir durable »."],
    rating: 06.10,
    imageurl: "assets/images/4.jpg",
  ),
];
