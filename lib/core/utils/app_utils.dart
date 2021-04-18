class AppUtilities {
  static List<T> map<T>({required List list, required Function handler}) {
    List<T> result = [];
    if (list != null) {
      if (list.length > 0) {
        if (handler != null) {
          for (var i = 0; i < list.length; i++) {
            result.add(handler(i, list[i]));
          }
        }
      }
    }
    return result;
  }
}
