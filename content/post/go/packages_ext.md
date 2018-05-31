+++
title = "Packages"
description = "Java와 Python 사이 그 어디쯤"
topics = ["go"]
tags = ["syntax"]
slug = "packages"
date = "2018-05-29T23:28:57+09:00"
draft = true
+++

> 모든 Go 프로그램은 package들로 구성된다.
>
> 프로그램은 `main` package에서 시작한다.
>
> 관례상 package 이름은 import 경로의 마지막 element로 한다.

Package 작성 규정 (clause)은 다음과 같다. [Go spec.](https://golang.org/ref/spec)의 문법은 EBNF (Extended Backus-Naur Form)을 따르니 익숙치 않은 경우 [여기](https://en.wikipedia.org/wiki/Extended_Backus%E2%80%93Naur_form)를 참조한다.

```
PackageClause = "package" PackageName
PackageName   = identifier
identifier    = letter { letter | unicode_digit }
letter        = unicode_letter | "_"
```

문자나 숫자를 쓸 수 있고, 시작은 문자로 해야하는 등 변수이름을 만드는 규칙과 유사하다. 단, 위 규정에 어긋나는 것은 아니나 *blank identifier - underscore(_)만 단독으로 쓴 경우 -* 는 package 이름으로 사용할 수 없다. 

같은 package 이름을 갖는 파일들이 하나의 package를 구성하고, 이 파일들은 같은 경로에 두는 것이 좋다.

