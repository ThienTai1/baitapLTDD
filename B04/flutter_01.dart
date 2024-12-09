import 'package:flutter/material.dart';

class ScaffoldExample extends StatelessWidget {
  const ScaffoldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scaffold Example'),
      ),
      body: const Center(
        child: Text(
          'Hello, Scaffold!',
          style: TextStyle(fontSize: 24, color: Colors.green),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Da nhan");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class RowExample extends StatelessWidget {
  const RowExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row Example'),
      ),
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.email),
            Text('phamthientai789gmail.com'),
          ],
        ),
      ),
    );
  }
}


class ColumnExample extends StatelessWidget {
  const ColumnExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row Example'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.email),
            Icon(Icons.phone),
            Icon(Icons.home),
          ],
        ),
      ),
    );
  }
}


class StackExample extends StatelessWidget {
  const StackExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row Example'),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),
            Container(
              width: 50,
              height: 50,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}


class ContainerExample extends StatelessWidget {
  const ContainerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row Example'),
      ),
      body: Center(
        child: Container(
              padding: EdgeInsets.all(10),
              child: Text("test conatiner", style: TextStyle(color: Colors.red),),
              width: 100,
              height: 100,
              color: Colors.green,
            ),
        ),
    );
  }
}


class SizeBoxExample extends StatelessWidget {
  const SizeBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row Example'),
      ),
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.email),
            SizedBox(width: 25,),
            Text('phamthientai789gmail.com'),
          ],
        ),
      ),
    );
  }
}

class IconButtonExample extends StatelessWidget{
  const IconButtonExample({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Example'),
      ),
      body: Center(
        child:  IconButton(
          icon: Icon(Icons.thumb_up),
          onPressed: (){
            print('Icon Button Pressed!');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class ImageExample extends StatelessWidget{
  const ImageExample({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images Example'),
      ),
      body: Center(
        child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('../assets/images/1.png',
                width: 750,
                height: 350,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20), // Khoảng cách giữa các hìn
              Image.network('https://picsum.photos/200/200')
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}