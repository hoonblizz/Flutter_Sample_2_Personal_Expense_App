# flutter_sample_personal_expense_app

연습용 프로젝트 2번째.
소스: [Learn Flutter & Dart to Build iOS & Android Apps](https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps)
<br>

## 유용한 사이트 모음
[Dart 패키지 모음](https://pub.dev/)

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

## Widget Styling
어떤 위젯은 내가 하고싶어하는 스타일링이 안될수도 있다. <br>
예를들어, `Text` 위젯 백그라운드에 색을 넣고 싶다랄지, 공간을 넣고 싶다랄지...<br>
그런 경우엔 해당 위젯을 Refactoring 해서 다른 위젯으로 감싸서 해결하자.
```dart
...
Container(
  margin: EdgeInsets.symmetric(
    vertical: 10,
    horizontal: 15,
  ),
  decoration: BoxDecoration(
      border: Border.all(
    color: Colors.black,
    width: 2,
  )),
  padding: EdgeInsets.all(10),
  child: Text(
    e.amount.toString(),
  ),
),
...
```

## String Interpolation
예를들어, <br>
```dart
...
child: Text(
  e.amount.toString(),
  style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.purple,
  ),
),
...
```
`e.amount.toString()` 이 물건값을 가리키는 값이라 할때, 여기에 달라 사인을 붙여보고 싶다.<br>
달라 사인의 문제는, 스트링을 붙여넣는 신택스로 `${}` 이게 쓰이기 때문에, 쉽게 달라 사인을 쓸수가 없는것. <br>
즉, 다음의 두줄이 같은 기능을 한다. <br>
```dart
'A: ' + e.amount.toString()
'A: ${e.amount.toString()}'
```
해답은 `\` 백슬래쉬를 달라사인 앞에 넣는것. (다른 프로그래밍 언어도 비슷하다)<br>
```dart
'\$ ${e.amount.toString()}'
```

## Dart Packages install
[Pub.dev](https://pub.dev/) 에서 `intl` 이라는 패키지를 설치한다. <br>
이건 로컬라이징이나, Date 를 좀더 나은 포멧으로 바꿔주는 유용한 패키지이다. <br>
Puv.dev 에서 intl 을 찾아서, install 방법을 보면, <br>
```
Add this to your package's pubspec.yaml file:
dependencies:
  intl: ^0.16.1
```
이런식으로 쓰여져 있다. 말 그대로, 저 디펜던시를 복사해서, `pubspec.yaml` 에 붙여넣기 하자. <br>
yaml 에서는 indentation이 매우 중요하므로, 디펜던시를 붙여넣을때, 꼭 flutter 와 같은 레벨에서 붙여넣자. <br>
이게 무슨 소리냐 하면, 기본적으로 pubspec.yaml 을 보면, <br>
```
...
dependencies:
  flutter:
    sdk: flutter

...
```
이렇게 되어있는데, flutter 와 같은 레벨의 인덴테이션에서 새 패키지를 넣어준다. <br>
```
dependencies:
  flutter:
    sdk: flutter
  intl: ^0.16.1
```
잘 넣어줬으면, VSCode 같은 경우에는 자동으로 설치를 해준다.
해당 패키지에 대한 자세한 설명은, [API reference](https://pub.dev/documentation/intl/latest/intl/intl-library.html) 를 참조하도록 한다. 


## TextInput
다음과 같은 텍스트 인풋이 있다고 하면, <br>
```dart
...
child: Column(
  children: <Widget>[
    TextField(
      decoration: InputDecoration(labelText: 'Title'),
    ),
    TextField(
      decoration: InputDecoration(labelText: 'Amount'),
    ),
    FlatButton(
      child: Text('Add Transaction'),
      textColor: Colors.purple,
      onPressed: () {},
    )
  ],
),
...
```
텍스트 필드에 쓰여지는 값을 어떻게 관리 할까? <br>
여기에 두가지 방법이 있다. <br>
하나는, `onChanged` 를 이용해서 각각 텍스트 인풋을 variable 에 넣어줘서 관리하는것. <br>
보통 인풋안에 뭔가 추가적인 알고리즘이 들어가 있을때 용이하다. <br>
```dart
...
child: Column(
  children: <Widget>[
    TextField(
      decoration: InputDecoration(labelText: 'Title'),
      onChanged: (val) {
        titleInput = val;
      },
    ),
    TextField(
      decoration: InputDecoration(labelText: 'Amount'),
      onChanged: (val) {
        amountInput = val;
      },
    ),
    FlatButton(
      child: Text('Add Transaction'),
      textColor: Colors.purple,
      onPressed: () {
        print(titleInput);
        print(amountInput);
      },
    )
  ],
),
...
```
두번째 방법은, 그냥 인풋이 간단한 인풋일때 유용하다. <br>
variable 을 `TextEditingController()` 로 지정해주고 쓰는 방법. <br>
예를들어,<br>
```dart
...
final titleController = TextEditingController();
final amountController = TextEditingController();

....

child: Column(
  children: <Widget>[
    TextField(
      decoration: InputDecoration(labelText: 'Title'),
      controller: titleController,
      //onChanged: (val) => titleInput = val
    ),
    TextField(
      decoration: InputDecoration(labelText: 'Amount'),
      controller: amountController,
      //onChanged: (val) => amountInput = val
    ),
    FlatButton(
      child: Text('Add Transaction'),
      textColor: Colors.purple,
      onPressed: () {
        print(titleController.text);

      },
    )
  ],
),
...
```
나중에 인풋값은 `.text` 로 가져올수 있다. <br>

## String to Double
다음을 보면, <br>

### new_transaction.dart
```dart
...
FlatButton(
  child: Text('Add Transaction'),
  textColor: Colors.purple,
  onPressed: () {
    addTx(titleController.text, amountController.text)
  },
)
...
```
### user_transaction.dart
```dart
...
void _addNewTransaction(String txTitle, double txAmount) {
  // 새로운 Transaction 만들고, 추가시켜준다.
  final newTx = Transaction(title: txTitle, amount: txAmount, date: DateTime.now(), id: DateTime.now().toString(),);
  setState(() {
    _userTransactions.add(newTx);
  });
};

@override
Widget build(BuildContext context) {
  return Column(children: <Widget>[
    // 유저 인풋
    NewTransaction(_addNewTransaction),
    // 인풋 결과들 리스트
    TransactionList(_userTransactions)
  ],)
}
...
```
`_addNewTransaction` 에서 argument 로서 `String` 과 `Double`이 들어간다. <br>
하지만, `new_transaction.dart` 에서 `onPress` 이벤트에서 보내줄때 둘다 `String` 으로 보내주게 되고, <br>
이러면 에러가 난다. String 에서 Double 로 바꿔주는 무언가가 필요하다. <br>
간단히, 스트링 부분을 `double.parse(amountController.text)` 이렇게 double parse 해주면 된다. <br>
문제는, 이게 완벽한 솔루션이 아니라는것. 만약 안의 String 이 더블이 될수 없는 포멧이면 또다시 에러가 나기 때문. <br>

## Scrolling
`SingleChildScrollView` 가 한가지 옵션이 될수 있는데, <br>
반드시 `Container` 로 묶고, `height` 를 어떤식으로든 지정해 주어야 작동을 잘 한다.<br>
왜? 정해진 사이즈의 컨테이너 안에서 스크롤하게끔 만드는게 이 위젯의 작동 방법이기 때문. <br><br>
그리고 실험해보면, 소프트 키보드가 인풋 위젯을 가리는것 같은 현상이 일어날수 있는데, 그걸 방지하기 위해서 <br>
`body` 안쪽 에도 `SingleChildScrollView` 를 넣어준다. <br>
### main.dart
```dart
...
body: SingleChildScrollView(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
...
```
### transaction_list.dart
```dart
...
@override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
...
```
다른 옵션으로는 `ListView` 를 쓰는게 될수 있다. <br>
`ListView` 에 여러 옵션들이 있고, direction 도 정할수 있어서, column, row 둘다 대체 가능하다. <br>
주의점은, 그냥 단순히 `SingleChildScrollView`, `Column` 을 대체하는게 아니고, 이것도 역시 `height` 를 정해주는것이 매우 중요하다.<br><br>
또 다른 옵션으로는 `ListView.builder()` 가 있다. <br><br>

## ListView(children[]) vs ListView.builder()
`ListView(children[])` 와 `ListView.builder()` 에는 어떤 차이가 있을까? <br><br>
위에 언급했듯이, `ListView(children[])` 는 `SingleChildScrollView` + `Column` 이라고 할수 있다. <br>
예를들어, 어떤 아이템 100개를 리스팅 한다고 할때, `ListView(children[])` 에서는 100개 모두 렌더링이 된다. <br>
정확히는, 100개가 렌더링이 되어서 `SingleChildScrollView` 에 나타나지만 `Column` 안에 있는 아이템들만 보이게 된다. <br>
`ListView.builder()` 는 오직 화면에 들어오는 아이템만 렌더링 하게된다. 정해진 컨테이너 밖의 아이템은 렌더링 되지 않는다.<br>
결국엔 똑같아 보이지만, 리스트가 클수록 optimization 이나 performance 에서 차이가 나게 된다. <br><br>
그러면 무조건 `ListView.builder()` 를 써야할까? <br>
`ListView.builder()` 의 용법이 `ListView(children[])` 보다는 다소 복잡하고 코드가 길어지기 때문에, <br>
확정된 짧은 리스트 에서는 쉽게 `ListView(children[])` 를 써주고, 무한정 길어질수 있는 리스트에서는 <br>
`ListView.builder()` 를 사용해주면 된다. <br><br>

`ListView.builder()` 는 우선 `itemBuilder`, `itemCount` 라는게 필요하다. 
`itemBuilder` 는 렌더링 되는 위젯을 보내주면 되고, `itemCount` 는 말 그대로 아이템 갯수를 정해주면 된다. <br>

```dart
@override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: transactions.length,   // <-- 아이템 수
        itemBuilder: (context, index) {   // 
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  width: 90,
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.purple,
                    width: 2,
                  )),
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Text(
                    '\$ ${transactions[index].amount.toString()}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          ); 
        },
      ),
    );
  }
```

## Underscore as argument
예를 들어, 다음이 있다.<br>
```dart
...
void submitData() {
  addTx(titleController.text, double.parse(amountController.text));
}

...

TextField(
  decoration: InputDecoration(labelText: 'Amount'),
  controller: amountController,
  keyboardType: TextInputType.number,
  onSubmitted: () => submitData,
),
...
```
여기서 `onSubmitted: () => submitData(),` 부분에 에러가 나는걸 알수 있다.<br>
이유는, `onSubmitted` 이 String 을 패스해주기 때문. <br>
내가 쓰던 안쓰던 이걸 받아들여야 에러가 없어진다. <br>
보통은 `onSubmitted: (val) => submitData(),` 이런식으로 해결이 가능하지만, 만약 패스되는 argument 수가 많다면? <br>
그래서 쓰이는게 `onSubmitted: (_) => submitData(),` 이렇게 언더스코어로 나타내준다. <br>
의미는, '어떤 argument든 받아는 들이지만, 사용은 않겠다` 라는 뜻. <br>

## Widget property
`new_transaction.dart` 는 stateless 위젯이었다. <br>
그런데 텍스트 인풋을 저장하지 못하는 문제가 있어서, (인풋 내용이 onBlur 시에 없어지는 현상)<br>
refactoring 을 이용해서 stateful 로 만들어주었다. <br>
여기서 알수있는 한가지 중요한것. 
```dart
class NewTransaction extends StatefulWidget {
  final Function addTx; //  user_transaction 에서 온 function

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    ....

...
```
`submitData` 에 보면 `widget.addTx` 를 볼수 있는데, <br>
여기서 `widget` 이란 해당 widget 에서 무언가를 가져올수 있는 특별한 기능이다.<br>


## Theme
최상위의 `MaterialApp` 에서 `theme` 설정이 가능하다. <br>
```dart
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}
```
그리고 다른 child 에서 이 theme 을 사용하고 싶으면, <br>
일일이 지정해 주던가, 혹은 `Theme.of` 를 이용해서, context (상위의) theme 을 가져와서 사용한다. <br>
```dart
decoration: BoxDecoration(
    border: Border.all(
  color: Theme.of(context).primaryColor,
  width: 2,
)),
```

## Add Images
기본적으로는 `Image` 를 통해 원하는곳에 넣으면 된다. <br>
다음의 예는, `assets/images/image` 폴더를 만들고, 그 안에 이미지를 넣은다음, 다음과 같이 불러준다. <br>
```dart
Column(
  children: <Widget>[
    Text(
      'No transaction added',
      style: Theme.of(context).textTheme.title,
    ),
    Image.asset('assets/images/image/waiting.png'),
  ],
)
```
그 후에 중요한건, `pubspec.yaml` 에 추가시켜줘야 한다는것. <br>
```dart
# To add assets to your application, add an assets section, like this:
  assets:
    - assets/images/image/waiting.png
  #  - images/a_dot_ham.jpeg
```
그리고 앱을 재실행 시켜준다. <br>
문제는 그냥 저렇게 이미지를 넣어주면 크기가 조정이 안되어 있다는것. <br>
```dart
Column(
  children: <Widget>[
    Text(
      'No transaction added',
      style: Theme.of(context).textTheme.title,
    ),
    SizedBox(height: 50,),
    Container(
        height: 200,
        child: Image.asset(
          'assets/images/image/waiting.png',
          fit: BoxFit.cover,
        )),
  ],
)
```
`SizedBox()` 는 안에 child 위젯을 넣을수도 있고, 아무것도 안넣을수도 있다. <br>
위처럼 아무것도 안넣으면 그냥 separator 로서 활용되기도 한다. <br>
`Image` 에게 최대 크기를 정해주기 위해 `Container` 로 감싸주고, `height` 도 정해준다. <br>
그리고 `fit` 을 이용해서 이미지가 컨테이너 크기에 맞춰지도록 한다. <br>


## where
javascript 의 filter 와 같이 Array 안의 내용이 True 인 아이들만 모아서 리턴해준다. <br>
```dart
// Chart 에 쓰일 트랜젝션만 골라넣은것
List<Transaction> get _recentTransactions {
  return _userTransactions.where((tx) {
    // isAfter: 해당 날짜보다 후면 True
    // 현재 시간 (DateTime.now()) 으로부터 7일 전 안에 해당되면 true.
    return tx.date.isAfter(
      DateTime.now().subtract(  
        Duration(days: 7),
      ),
    );
  }).toList();
}
```

## Stack and bar graph
`Stack` 위젯은 아이들을 겹치게 쌓을수 있다. (overlapping) <br>
이걸 이용해서 바 그래프를 그릴수 있다. <br>
```dart
Container(
  height: 60,
  width: 10,
  child: Stack(
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.0),
          color: Color.fromRGBO(220, 220, 220, 1),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      FractionallySizedBox(
        heightFactor: spendingPctOfTotal,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      )
    ],
  ),
),
```
`Container` 에서 크기를 잡아주고, (height, width) child 로서 `Stack` 을 넣기 시작한다. <br>
`Stack` 안의 첫번째 `Container` 는 바 그래프의 배경이 되는 컨테이너를 그려준다. <br>
그리고 두번째는 `Container` 도 좋지만, `FractionallySizedBox` 가 좀더 쉬운 방법이라 할수 있는데, <br>
그 이유는 `FractionallySizedBox` 가 갖고있는 `heightFactor` 때문. <br>
`heightFactor` 를 이용해서 퍼센트로 outter container 를 채울수 있다. <br>

## Flexible & FittebBox Widget
`Flexible` 은 javascript 의 flex 와 비슷하다. `flex: 1` 와 같은 식으로 크기를 정해주거나, <br>
`fit: FlexFit.tight,` 처럼 내용물 포지션을 지정해주는게 가능하다. <br>
`FlexFit.tight` 는 마치 flex grow 처럼 남은 공간을 차지하게 된다. <br>
생각보다 `Flexible`, `FlexFit.tight` 의 조합이 많이 쓰이기 때문에, 이걸 대체하는 위젯 `Expanded` 가 있다 <br>
<br>
`FittebBox` 는 child 가 밖에 벗어나지 못하도록 해준다. 예를들면, multiline 텍스트가 되는걸 방지해준다랄지..<br>

## Padding Widget
하다보면 디자인때문에 padding 을 써야할때가 많은데, <br>
만약 `padding` 만을 위해서 `Container` 로 Refactoring 해줘야 하는 상황이라면 <br>
`Padding` 이라는 위젯으로 Refactoring 해주는게 좋다.


## Date Picker
`showDatePicker` 는 flutter 에서 기본으로 제공되는 date picker 이다. <br>
기본 템플릿에서 ok 를 누르면 `.then` 으로 값을 불러서 쓸수 있다. <br>
```dart
showDatePicker(
  context: context,
  initialDate: DateTime.now(),
  firstDate: DateTime(2019),
  lastDate: DateTime.now(),
).then((pickedDate) {
  print('Picked date: ${pickedDate}');
  if (pickedDate == null) {
    return;
  }
  setState(() {   // setState 로 State 를 변경해줘야 렌더링이 일어난다.
    _selectedDate = pickedDate;
  });
});

...

Expanded(
  child: Text(
    _selectedDate == null
        ? 'No Date Chosen!'
        : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
  ),
),

...
```