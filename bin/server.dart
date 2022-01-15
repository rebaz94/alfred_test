import 'dart:io';
import 'dart:isolate';

import 'package:alfred/alfred.dart';

void main(List<String> args) async {
  print('starting ${Platform.numberOfProcessors} instances');
  for (var i = 0; i < Platform.numberOfProcessors - 1; i++) {
    unawaited(Isolate.spawn(startInstance, ''));
  }
  // Start listening on this isolate also
  await startInstance(null);
}

Future<void> startInstance(dynamic message) async {
  final app = Alfred();

  app.get('/', (req, res) => '');

  app.get('/user', (req, res) => '');

  app.get('/user/:id', (req, res) => req.params['id']);

  await app.listen(3000); //Listening on port 3000
}

/// Simple function to prevent linting errors, can be ignored
void unawaited(Future future) {}
