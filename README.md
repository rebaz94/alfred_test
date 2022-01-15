A server app built using [Alfred](https://pub.dev/packages/alfred),
configured to enable running with [Docker](https://www.docker.com/).

## Running with the Dart SDK

You can run the example with the [Dart SDK](https://dart.dev/get-dart)
like this:

```
$ dart run bin/server.dart
Server listening on port 3000
```

And test the server using 
```
wrk -t12 -c512 -d15s http://localhost:3000/
```
