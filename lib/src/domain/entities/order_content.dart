class OrderContent {
  final String urlContent;
  final String contentTypeName;
  final String contentDescription;

  OrderContent({
    required this.urlContent,
    required this.contentTypeName,
    this.contentDescription = "DESCRIPTION NOT PROVIDED",
  });
}
