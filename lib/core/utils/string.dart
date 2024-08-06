extension StringX on String {
  String phoneFormat() => replaceAllMapped(
    RegExp(r'(\d{3})(\d{3})(\d{3})(\d+)'),
        (final Match m) => '${m[1]}-${m[2]}-${m[3]}-${m[4]}',
  );
}
