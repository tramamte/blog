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

생소한 이름이니 익숙한 곳에서 굳이 비슷한 역할을 찾아보자. 

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

C++ 클래스의 멤버 함수는 이렇게 선언과 정의를 동시에 하기도 하지만 나눌 수도 있다.

```c++
// my_class.h
class MyClass
{
public:
	void MyFunction();
}
```

```c++
// my_class.cpp
void MyClass::MyFunction()
{
	// This is MyFunction
}
```

 `MyClass`의 멤버임을 알려주기 위해 `MyFunction()` 앞에  `MyClass::`를 붙였다. 바로 이 부분을 C++의 메서드 리시버라 생각하면 이해가 빠를 것이다.

Go에서 메서드를 만드는 방식은 다음과 같다.

```
MethodDecl     = "func" Receiver MethodName Signature [ FunctionBody ] .
Receiver       = Parameters .
Parameters     = "(" [ ParameterList [ "," ] ] ")" .
ParameterList  = ParameterDecl { "," ParameterDecl } .
ParameterDecl  = [ IdentifierList ] [ "..." ] Type .
```

다음과 같은 제약 및 특징이 있다.

- Parameters는 단일, non-variadic이어야 한다.
- 타입은 T 또는 *T일 수 있다.
- 기본 타입이나 패키지 내에 존재하지 않는 타입에 대해서는 메서드를 정의할 수 없다.

C++ 예를 통해 보면 첫 번째와 세 번째는 어찌 보면 당연해 보이고, 두 번째 특징이 조금은 특이해 보인다. 이는 Go의 메서드 리시버가 함수의 소속을 나타내는 역할뿐만 아니라 인수(parameter)의 역할도 동시에 하기 때문으로 아래에서 살펴보기로 하자.

