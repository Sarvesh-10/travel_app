class Destination {
  final String name;
  final String location;

  final double rating;
  final bool isHearted;
  final String Description =
      "One of the most happening beach where you will find water sports, fine dining restaurants,bars and clubs. Situated in North Goa Beach is bordered by Colongule and Anjuna Beaches";

  final String filePath;
  Destination(
      {required this.name,
      required this.location,
      required this.rating,
      required this.isHearted,
      required this.filePath});
}
