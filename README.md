# flutter_sample_personal_expense_app

연습용 프로젝트 2번째.
소스: [Learn Flutter & Dart to Build iOS & Android Apps](https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps)
<br>

## 목차
| Title | Desc | 
| :--- | :---:  | 
| [What to Learn](#what-to-expect-from-this-sample-app) | ..| 
| [Widgets](#widgets) | ..| 
| [Combining Widgets](#combining-widgets) | ..| 
| [Column & Row](#column--row) | ..| 

<br><br>

## What to expect from this sample app?
- 위젯에 관한 심화 학습
- 테마, Material 디자인
- 이미지와 폰트
- 비지니스 로직 추가하는 방법 (중요!)

## Widgets
Flutter 공식 사이트에 보면, [위젯 리스트](https://flutter.dev/docs/development/ui/widgets) 가 나와있다. <br>
그중에서도 [Layout](https://flutter.dev/docs/development/ui/widgets/layout) 이 있는데, 이건 전체적인 디자인을 구성하는데 도움을 준다. <br>
혹은 [api.flutter.dev](https://api.flutter.dev) 에서는 각각 클래스의 아이디어나 작동원리를 알려주고, 서치도 가능하다.
<br><br>
이중에서도 가장 많이 쓰이는 위젯들을 꼽아보자면, <br>
- App / Page 셋업 관련
  - MaterialApp, CupertinoApp
  - Scaffold / CupertinoPageScaffold
- Layout 관련
  - Container
  - Row
  - Column
- Row / Column Children 관련
  - Flexible
  - Expanded
- Content Containers 관련
  - Stack
  - Card
- Repeat Elements 관련
  - ListView
  - GridView
  - ListTile
- Content Types 관련
  - Text
  - Image
  - Icon
- User Input 관련
  - TextField
  - RaisedButton / FlatButton
  - GestureDetector
  - InkWell

## Combining Widgets
예를들어, 다음이 있다 <br>
```dart
...
body: Column(
  children: <Widget>[
    Card(
      child: Text('Chart place'),
      elevation: 5,   // 드랍다운 그림자
    ),
    Card(
      child: Text('List of transaction!'),
    )
  ],
));
...
```
각각 카드의 크기는 자동으로 안의 내용에 따라 정해진다. <br>
이걸 돌려보면, 상대적으로 글자가 긴 두번째 카드의 크기가 첫번째보다 길다는걸 알수있다. <br>
디자인적으로 두 카드의 크기를 맞추고 싶다면 두가지 방법이 있다. <br>
### Refactoring
내용물을 Refactoring 을 이용해 `Container` 로 감싸주는것이 첫번째 방법. <br>
컨테이너는 크기 조절이 가능한 위젯중 하나이기 때문. <br>
참고로 Refactoring 방법은 [여기](https://github.com/hoonblizz/Flutter_Sample_1_QuizApp)<br>
그래서 컨테이너로 감싸주면 다음과 같이 된다. <br>
```dart
...
children: <Widget>[
  Card(
    child: Container(
      width: double.infinity,
      child: Text('Chart place'),
    ),
    elevation: 5,
    color: Colors.blue,
  ),
  Card(
    child: Text('List of transaction!'),
  ),
...
```
`width`를 `double.infinity`로 세팅해주면, 화면크기에 맞춘다.<br><br>
두번째 방법은 내용물이 아닌, 현재의 `Card` 자체를 Refactoring 을 이용해서 `Container` 로 감싸주는것이다.<br>

## Column & Row
`Column`은 세로로 나아가는 방향. `Row`는 가로로 나아가는 방향을 뜻한다. <br>
Flutter 에서 주가 되는 방향은 `MainAxis` 라 부르고, 주가 되지 않는 방향을 `CrossAxis` 라 부른다. <br>
이 두 단어를 잘 이해하고 있어야 디자인에 용이하다. <br>
즉, `Column` 의 `MainAxis` 는 밑으로 나아가는 방향이 되고, `CrossAxis` 는 오른쪽으로 나아가는 방향이다. <br>
`Row`의 `MainAxis`는 오른쪽 방향이고, `CrossAxis`는 아랫쪽 방향이다.<br>
```dart
...
body: Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: <Widget>[
    Container(
      width: double.infinity,
      child: Card(
        child: Text('Chart place'),
        elevation: 5,
        color: Colors.blue,
      ),
    ),
    Card(
      color: Colors.green,
      child: Text('List of transaction!'),
    ),
  ],
));
...
```
예를들어, `mainAxisAlignment`, `crossAxisAlignment` 를 이용해서 alignment 규칙을 만들수 있다. <br><br>
Javascript 의 `flex` 를 알고있다면 익숙할 내용이다. <br>





