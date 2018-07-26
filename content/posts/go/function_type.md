+++
title = "함수 타입과 익명 함수"
description = "Function type and anonymous function"
topics = ["go"]
tags = ["syntax-go"]
slug = "function-type-and-anonymous-function"
date = "2018-07-25T21:18:07+09:00"
imports = ["math", "zimg", "flowchart", "sequence", "mermaid"]
draft = true
+++

[함수]({{< ref "20180709-12-50.md" >}})에서는 기본적인 함수 선언 및 호출 방법에 대해서 다뤘다. 해당 글을 시작할 때 함수를 타입으로 사용할 수도 있다고 언급했는데, 이 내용은 [구조체 기초]({{< ref "20180715-20-10.md" >}})에서도 동일하게 나온다.

여기서 얘기하는 함수는 앞서 살펴본 **선언하고 정의한 함수와는 약간의 차이**가 있다. 기본적인 내용은 [구조체 기초]({{< ref "20180715-20-10.md" >}})에서 이미 일부 다뤘지만 좀 더 상세히 알아보도록 하자.

# 함수 타입 의미

함수 타입 규정은 다음과 같다.

```
FunctionType   = "func" Signature .
Signature      = Parameters [ Result ] .
Result         = Parameters | Type .
Parameters     = "(" [ ParameterList [ "," ] ] ")" .
ParameterList  = ParameterDecl { "," ParameterDecl } .
ParameterDecl  = [ IdentifierList ] [ "..." ] Type .
```

 다른 것들은 같으니, FunctionType과 [함수]({{<ref "20180709-12-50">}})에서 다룬 FunctionDecl만 자세히 보자.

```
FunctionType   = "func" Signature .
FunctionDecl   = "func" FunctionName Signature [ FunctionBody ] .
```

함수 타입은 이름(FunctionName)이 없고, 구현부(FunctionBody)도 없다. 

사실 함수 타입, 시그니쳐 등은 C 개발자에게는 이미 너무나 익숙한 용어일 것이다. Java는 class가 중심이 되는 언어이기 때문에 비슷한 기능을 위해 인터페이스(interface)를 정의하지만, C는 함수의 형태(signature)를 타입으로 정의할 수 있고, 이 타입의 변수에 함수 구현을 저장할 수 있다. 다음 예를 보자.

```c
int pthread_create(pthread_t *thread, const pthread_attr_t *attr,
                   void *(*start_routine) (void *), void *arg);
```

`void *`를 인수로 받고, `void *`를 반환하는 형태의 함수를 `start_routine`이라는 이름의 인수로 받는 `pthread_create` 함수의 프로토타입이다.

Go의 함수 타입 역시 C와 동일하게 다양한 함수 구현체들을 변수에 담을 수 있도록 함수의 형태를 정의하는 역할을 한다. 

`int`를 예로 들어보자. `var i int`라 하면 **정수**를 담기 위한 `i`라는 이름의 변수를 만든다. 마찬가지로 함수 `var ft 이러이러한-형태의-함수`라 하면 **이러이러한-형태의-함수**를 담기 위한 `ft`라는 이름의 변수를 만들 수 있다. 그리고 **이러이러한-형태의-함수**를 정의하는 것이 바로 함수 타입이다.

# 함수 타입 사용법

## 타입이 들어가는 자리에 사용

## 타입 선언 방식으로 사용



