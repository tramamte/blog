+++
title = "for 반복문"
description = "for statement"
topics = ["go"]
tags = ["syntax-go"]
slug = "for-statement"
date = "2018-06-28T00:00:08+09:00"
draft = true
+++

시작하기에 앞서, Go에는 `while`이 없다! 반복문은 `for` 하나로 모두 작성한다.

<br>

`for` 반복문의 작성 규칙을 살펴보자.

```
ForStmt = "for" [ Condition | ForClause | RangeClause ] Block .
Condition = Expression .
```

`while`이 없는 대신 `for` 자체가 이렇게도, 저렇게도 사용할 수 있도록 돼 있다. `RangeClause`는 아직 다루지 않은 배열, 슬라이스, 맵이나 채널 등과 같이 사용하니 일단은 미뤄두도록 하자. --- 점점 빚이 늘어나는 것 같은 심적 부담이...

# for 처럼 사용하기

'`for`를 for 처럼 사용한다는게 무슨 소린가?' 하겠지만, 다른 언어, 특히 C/C++의 `for`처럼 사용한다는 의미이다. 

# while 처럼 사용하기



# 무한루프

