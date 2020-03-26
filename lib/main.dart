import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onboard_slider_gradient_app/style.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // AnnotatedRegion: Anota una región del árbol de capas con un valor.
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,// Preferencia de estilo de capa cubierta
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.4, 0.7, 0.9],
                colors: [
                  Color(0xFF3594DD),// Azul 1
                  Color(0xFF4563DB),// Azul 2
                  Color(0xFF5036D5),// Azul 3
                  Color(0xFF5B16D0) // Azul 4
                ]
              )
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0),// 40
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: (){
                        print("Skip");
                      },
                      child: Text("Skip", style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                  Container(
                    height: 600.0,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page){
                        setState(() {
                          _currentPage = page;// Asignamos la pagina a la que nos movilizamos a la variable _currentpage
                        });
                      },
                      children: <Widget>[
                        // Slider 1
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage('assets/images/onboarding0.png'),
                                  width: 250.0,
                                  height: 250.0,
                                ),
                              ),
                              SizedBox(height: 30.0),
                              Text('Connect people \n around the world', style: kTitleStyle),
                              SizedBox(height: 15.0),
                              Text('Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.')
                            ],
                          ),
                        ),
                        // Slider 2
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage('assets/images/onboarding0.png'),
                                  width: 250.0,
                                  height: 250.0,
                                ),
                              ),
                              SizedBox(height: 30.0),
                              Text('Live your life smarter \n with us', style: kTitleStyle),
                              SizedBox(height: 15.0),
                              Text('Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.')
                            ],
                          ),
                        ),
                        // Slider 3
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage('assets/images/onboarding0.png'),
                                  width: 250.0,
                                  height: 250.0,
                                ),
                              ),
                              SizedBox(height: 30.0),
                              Text('Get a new experiencie \n of imagination', style: kTitleStyle),
                              SizedBox(height: 15.0),
                              Text('Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.')
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator()
                  ),
                  _currentPage != _numPages -1?
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomRight,
                      child: FlatButton(
                        onPressed: (){
                          _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text('Next', style: TextStyle(color: Colors.white, fontSize: 22.0)),
                            SizedBox(width: 10.0),
                            Icon(Icons.arrow_forward, color: Colors.white, size: 30.0)
                          ],
                        ),
                      ),
                    ),
                  )
                  : Text('')                
                ]
              ),
            ),
          )
        ),
        bottomSheet: _currentPage == _numPages -1 ?
        Container(
          height: 100.0, width: double.infinity, color: Colors.white,
          child: GestureDetector(
            onTap: (){
              print('Get Started');
            },
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: Text('Get Started', style: TextStyle(color: Color(0xFF5B16D0), fontSize: 20.0, fontWeight: FontWeight.bold))
              ),
            ),
          ),
        ):
        Text(''),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (var i = 0; i < _numPages; i++) {
      // Añadimos un Widget indicador con un estado según se encuentre activo o no
      list.add(i==_currentPage ? _indicator(true):_indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0:16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF7B51D3),
        borderRadius: BorderRadius.all(Radius.circular(12))
      ),
    );
  }
}
