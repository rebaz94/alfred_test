import 'dart:io';
import 'dart:isolate';
import 'dart:async';

import 'package:alfred/alfred.dart';

void main(List<String> args) async {
//   print('starting ${Platform.numberOfProcessors} instances');
//   for (var i = 0; i < Platform.numberOfProcessors - 1; i++) {
//     unawaited(Isolate.spawn(startInstance, ''));
//   }
  // Start listening on this isolate also
  await startInstance(null);
}

Future<void> startInstance(dynamic message) async {
  final app = Alfred();

  app.get('/', (req, res) => '');
  
  app..get(
      '/test-old',
       (req, res) async {
        String v = '';
        for (int i = 0; i < 10000; i++) {
          v += '$i';
        }
        return v;
      },
    )
    ..get(
      '/test-new',
      (req, res) async {
        final s = StringBuffer();
        s.writeAll(generate());
        return s.toString();
      },
    )
    ..get(
      '/env',
      (req, res) async {
        final e = Platform.environment;
        return e.entries.map((e) => '${e.key}: ${e.value}').toList().join('\n');
      },
    )
    ;
 

  app.get('/user/:id', (req, res) => req.params['id']);

  await app.listen(3000); //Listening on port 3000
}

Iterable<int> generate() sync* {
  for (int i = 0; i < 10000; i++) {
    yield i;
  }
}

/// Simple function to prevent linting errors, can be ignored
void unawaited(Future future) {}
