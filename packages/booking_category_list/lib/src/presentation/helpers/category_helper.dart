class CategoryHelper {
  static String formatTitle(String title) {
    if (title.contains('-')) {
      return title.replaceAll('-', ' ');
    }

    return title;
  }
}
