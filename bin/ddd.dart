import 'dart:io';

void main() async {
  print(await getGitFolders(Directory.current).toSet());
}

Stream<String> getGitFolders(Directory directory) async* {
  await for (var d in directory.list().where((item) => item is Directory)) {
    if (await isGitRoot(d)) {
      yield d.path;
      continue;
    }

    yield* getGitFolders(d);
  }
}

Future<bool> isGitRoot(Directory dir) async {
  // return (await Process.run('git', [
  //       'rev-parse',
  //       '--show-toplevel',
  //     ]))
  //         .stdout ==
  //     dir.absolute.path;
  return false;
}
