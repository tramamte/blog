+++
title = "함수"
description = "Function"
topics = ["go"]
tags = ["syntax-go"]
slug = "function"
date = "2018-07-04T12:39:21+09:00"
imports = [""]
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

호출 방법은 다음과 같다.

```go
testFunction()
```

FunctionDecl을 보면 Signature 뒤에 FunctionBody는 생략할 수 있는데, 다음과 같은 형태가 된다.

```go
func testFunction()
```

마치 C의 함수 프로토타입과 비슷해 보이는데, 