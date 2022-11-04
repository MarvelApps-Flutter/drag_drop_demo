class DraggableList {
  final String header;
  final String image;
  final List<DraggableListItem> items;

  const DraggableList({
    required this.header,
    required this.image,
    required this.items,

  });
}

class DraggableListItem {
  final String? title;
  final String? subTitle;
  final String? urlImage;
  final String? description;

  const DraggableListItem({
     this.title,
     this.urlImage,
     this.description,
     this.subTitle
  });
}