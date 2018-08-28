+++
title = "맵"
description = "Map"
topics = ["go"]
tags = ["syntax-go"]
slug = "map"
date = "2018-08-23T09:43:27+09:00"
imports = ["math", "zimg", "flowchart", "sequence", "mermaid"]
draft = true

+++

배열이나 슬라이스는 저장된 각 요소에 접근하기 위한 키로 숫자를 사용하는 자료구조이다. 반면 맵은 키로 숫자가 아닌 다양한 타입을 사용할 수 있다.

Python의 *dict* 및 Ruby의 *hash*에 해당한다고 볼 수 있다.

# 맵 타입

맵 타입은 다음과 같이 정의한다.

```
MapType     = "map" "[" KeyType "]" ElementType .
```

"map"이라는 키워드 뒤에 키 타입과 요소 타입을 각각 기술한다. 예를 들어 문자열을 키로 하고 정수를 저장하는 맵은 다음과 같이 쓸 수 있다.

```go
var m map[string]int
```

# 생성 및 초기화

