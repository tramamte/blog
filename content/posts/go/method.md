+++
title = "메서드"
description = "Method"
topics = ["go"]
tags = ["syntax-go"]
slug = "method"
date = "2018-12-18T23:22:43+09:00"
imports = [""]
draft = true

+++

*Go는 클래스가 없다.*

> What? Go는 객체지향언어가 아니란 말인가?

미리 놀랄 필요는 없다. Go는 클래스가 없는 대신 보다 유연한 방식을 제공한다. 먼저 객체의 멤버 함수, 메서드를 Go에서 어떻게 구현하는지 확인해 보자.

# 메서드 리시버 (Method Receiver)

사실 메서드 리시버는 완전히 새로운 개념은 아니다. C++ 멤버 함수를 구현하는 경우를 보자. 

```c++
class MyClass
{
public:
	void MyFunction()
	{
		// This is MyFunction.
	}
}
```

이렇게 멤버 함수의 선언과 구현은 동시에 하기도 하지만 선언부와 구현부를 나눌 수도 있다.

```c++
// my_header.h
class MyClass
{
public:
	void MyFunction();
}
```

```c++
// my_header.cpp
void MyClass::MyFunction()
{
	// This is MyFunction
}
```

`MyFunction()`이 `MyClass`의 멤버임을 알려주는 방법이 바로 `MyClass::`이다. 즉, `MyFunction()` 호출에 대한 수신자 (receiver)가 바로 `MyClass`이다.

Go는 이와 유사하게 함수를 정의할 때 해당 함수를 받을 타입을 명시함으로써 메서드를 만든다.

```
MethodDecl     = "func" Receiver MethodName Signature [ FunctionBody ] .
Receiver       = Parameters .
Parameters     = "(" [ ParameterList [ "," ] ] ")" .
ParameterList  = ParameterDecl { "," ParameterDecl } .
ParameterDecl  = [ IdentifierList ] [ "..." ] Type .
```

위와 같이 정의돼 있기는 하지만 다음과 같은 제약이 있다.

- Parameters는 단일, non-variadic이어야 한다.
- 타입은 T 또는 *T일 수 있다.
- 기본 타입이나 패키지 내에 존재하지 않는 타입에 대해서는 메서드를 정의할 수 없다.