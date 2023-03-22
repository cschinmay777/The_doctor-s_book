class ListuserItemModel {
  String title;
  String sample;

  ListuserItemModel({required this.title, required this.sample});
  String return_title() {
    return title.toString();
  }
}
