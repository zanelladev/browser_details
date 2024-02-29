enum Browser {
  chrome('Chrome', 'org.chromium.chrome'),
  firefox('Firefox', 'org.mozilla.firefox'),
  edge('Edge', 'com.microsoft.emmx'),
  opera('Opera', 'com.opera.browser'),
  unknown('Unknown Browser', 'Unknown Browser Bundle');

  final String name;
  final String bundle;

  const Browser(this.name, this.bundle);
}
