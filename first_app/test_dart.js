const cp = require('child_process');
console.log("Testing flutter path...");
try {
  let flutter = cp.spawnSync("/Volumes/External Storage/development/flutter/bin/flutter", ["--version"]);
  console.log("Flutter out:", flutter.stdout.toString().trim());
  console.log("Flutter err:", flutter.stderr.toString().trim());
} catch(e) { console.log(e); }

console.log("Testing dart path...");
try {
  let dart = cp.spawnSync("/Volumes/External Storage/development/flutter/bin/cache/dart-sdk/bin/dart", ["--version"]);
  console.log("Dart out:", dart.stdout.toString().trim());
  console.log("Dart err:", dart.stderr.toString().trim());
} catch(e) { console.log(e); }
