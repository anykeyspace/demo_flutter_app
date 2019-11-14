void main([List<String> args]){
    print(myIterable().elementAt(int.parse(args.first)));

}

Iterable myIterable() sync* {
    BigInt _counter = BigInt.from(0);
    while(true){
        yield _counter = _counter + BigInt.from(1);
    }
}

class  MyIterable extends Iterable {
    Iterator _myIterator =new MyIterator();

  @override
  Iterator get iterator => _myIterator;
}

class MyIterator extends Iterator {
    int _counter = 0;

    @override
    get current => _counter;

    @override
    bool moveNext() {
        _counter++;
        return true;
    }
}
