+++
title = "함수"
description = "Function"
topics = ["go"]
tags = ["syntax-go"]
slug = "function"
date = "2018-07-04T12:39:21+09:00"
imports = ["flowchart", "sequence"]
draft = true
+++

함수를 타입으로 사용하는 등 여러가지 용법이 있지만 기본적인 함수의 선언(declaration)과 정의(definition)에 대해서만 다루도록 하겠다. 

함수 작성 규칙은 다음과 같다.

```
FunctionDecl   = "func" FunctionName Signature [ FunctionBody ] .
FunctionName   = identifier .
FunctionBody   = Block .
Signature      = Parameters [ Result ] .
Result         = Parameters | Type .
Parameters     = "(" [ ParameterList [ "," ] ] ")" .
ParameterList  = ParameterDecl { "," ParameterDecl } .
ParameterDecl  = [ IdentifierList ] [ "..." ] Type .
```

매우 복잡해 보이는데 하나하나 예외를 제거하고, 예제를 통해 알아보자.

# 함수의 기본형

함수는 키워드 `func`로 시작한다. [변수]({{< ref "20180601-12-35.md" >}})처럼 다음에는 함수 이름이 오고,  괄호(())를 쓴 뒤, 마지막으로 중괄호({}) 안에 함수를 정의한다.

```go
func testFunction() {
	fmt.Println("This is test function.")
}
```

{{< flowchart>}}
st=>start: Start:>http://www.google.com[blank]
e=>end:>http://www.google.com
op1=>operation: My Operation
sub1=>subroutine: My Subroutine
cond=>condition: Yes
or No?:>http://www.google.com
io=>inputoutput: catch something...
para=>parallel: parallel tasks

st->op1->cond
cond(yes)->io->e
cond(no)->para
para(path1, bottom)->sub1(right)->op1
para(path2, top)->op1
{{< /flowchart >}}


{{< sequence theme="hand" >}}
Andrew->China: Says Hello
Note right of China: China thinks\nabout it
China-->Andrew: How are you?
Andrew->>China: I am good thanks!
{{< /sequence >}}