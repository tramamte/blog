+++
title = "배열, 슬라이스 그리고 맵"
description = "Array, slice and map"
topics = ["go"]
tags = ["fun-go"]
slug = "array-slice-and-map"
date = "2018-08-29T11:57:07+09:00"
imports = ["math", "zimg", "flowchart", "sequence", "mermaid"]
draft = true

+++

Go의 built-in 자료구조인 [배열]({{<ref "20180806-23-07">}}), [슬라이스]({{<ref "20180821-23-31">}}), [맵]({{<ref "20180828-23-43">}})에 대해 좀 더 자세히 살펴보자.

# 크기

배열, 슬라이스, 맵은 모두 복수의 요소를 저장할 수 있다. 따라서 몇 개의 요소를 가지고 있는지가 중요하다. 세 타입은 모두 `len()` 함수를 이용해 포함하고 있는 요소의 개수를 확인할 수 있다.

```go
package main

import "fmt"

func main() {
	a := [3]int {0, 1, 2}
	s := []int {0, 1, 2}
	m := map[string]int {"A":0, "B":1, "C":2}
	fmt.Println(len(a))
	fmt.Println(len(s))
	fmt.Println(len(m))	
}
```

위 예는 다음을 출력한다.

```
3
3
3
```

슬라이스나 맵에 비해 배열은 이미 크기를 지정하고 있다는 점에 주목할 필요가 있다. 즉, 배열 타입의 변수는 값을 넣지 않아도 이미 생성 시점에 크기가 정해져 있다.

```go
package main

import "fmt"

func main() {
	var a [3]int
	var s []int
	var m map[string]int
	fmt.Println(len(a))
	fmt.Println(len(s))
	fmt.Println(len(m))
}
```

위 예는 다음을 출력한다.

```
3
0
0
```

슬라이스와 맵은 동적으로 조절이 가능한 반면 배열은 정적 타입이다. 따라서 슬라이스와 맵은 크기만으로 몇 개의 요소가 저장돼 있는지 알 수 있지만 배열은 불가능하다.

```go
package main

import "fmt"

func main() {
	var s = make([]int, 0)
	var m = make(map[string]int)
	fmt.Println(len(s))
	fmt.Println(len(m))
	s = append(s, 1)
	m["A"] = 1
	fmt.Println(len(s))
	fmt.Println(len(m))
}
```

```
0
0
1
1
```

# 복사 또는 참조

배열을 다른 배열 변수에 대입하면 요소값이 복사된다.

{{<highlight go "linenos=table">}}
package main

import "fmt"

func main() {
	a1 := [3]int {1, 2, 3}
	a2 := a1
	a2[2] = 4
	fmt.Println(a1[2], a2[2])
}
{{</highlight>}}

```
3 4
```

위 예는 7라인에서 `a2` 변수에 `a1`을 대입하면서 각 요소들이 모두 복사되기 때문에 `a2`의 세 번째 요소값을 4로 변경하더라도---8라인--- `a1`에 영향을 주지 않는다.

반면 슬라이스나 맵은 참조형이다.

{{<highlight go "linenos=table">}}
package main

import "fmt"

func main() {
	s1 := []int {1, 2, 3}
	s2 := s1
	s2[2] = 4
	fmt.Println(s1[2], s2[2])
	
	m1 := map[string]int {"A":1, "B":2, "C":3}
	m2 := m1
	m2["C"] = 4
	fmt.Println(m1["C"], m2["C"])
}
{{</highlight>}}

```
4 4
4 4
```

슬라이스는 슬라이싱을 이용해 일부 요소만을 참조할 수도 있는데 이 경우 주의할 점이 있다. 다음 예를 보자.

```go
package main

import "fmt"

func main() {
	s1 := []int {1, 2, 3}
	s2 := s1[0:1]
}
```

`s2`는 슬라이싱을 이용해 `s1`의 첫번째 요소만을 참조하고 있다. 따라서 이 경우 `s2[0]`의 값을 변경하면 `s1[0]`의 값 역시 변경된다. 또, `s2`의 두 번째 요소---`s2[1]`---에 접근하면 runtime error가 발생한다. 그런데 `append()`를 이용해 `s2`에 두 번째 요소값을 추가하면 어떻게 될까? 

```go
package main

import "fmt"

func main() {
	s1 := []int {1, 2, 3}
	s2 := s1[0:1]
	s2 = append(s2, 4)
	fmt.Println(s1[0], s1[1], s1[2])
	fmt.Println(s2[0], s2[1])
}
```

```
1 4 3
1 4
```

위와 같이 슬라이싱으로 일부 요소값만 참조했더라도 `append()`를 이용해 값을 추가하면 동시에 변경되는 것을 확인할 수 있다. 어떻게 쓰더라도 슬라이스는 참조형이다.

# 반복

