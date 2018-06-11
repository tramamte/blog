+++
title = "Import"
description = "Import - 외부 패키지 사용"
topics = ["go"]
tags = ["syntax"]
slug = "import"
date = "2018-06-08T18:58:47+09:00"
draft = true
+++

외부 패키지에서 제공하는 기능을 사용하기 위해 Go에서는 `import` 명령을 사용한다. 작성 규칙은 다음과 같다.

```
ImportDecl   = "import" ( ImportSpec | "(" { ImportSpec ";" } ")" ) .
ImportSpec   = [ "." | PackageName ] ImportPath .
ImportPath   = string_lit .
```

`string_lit` 에 대해서는 따로 붙이지 않았는데, 대략 큰따옴표로 묶은 것으로 생각하면 된다. (path를 이상한 조합으로 만들지 않는 한...)

주로 접할 수 있는 Go 샘플에서는 `import` 뒤에 사용할 패키지의 path를 큰따옴표 안에 적는 방식으로 사용하는데, 좀 더 자세히 보면 path 앞에 점(".")이나 `PackageName` 을 쓸 수도 있다.

가장 처음 접하게 되는 패키지인 `fmt` 패키지를 예로 들면, 보통 샘플은 다음과 같다.

```go
package main

import "fmt"

func main() {
    fmt.Println("Hello, Go!")
}
```

[Packages]({{< ref "20180531-13-05.md" >}}) 에서 언급한 것처럼 관례상 path의 마지막 element를 패키지 이름으로 맞췄기 때문에 `import` 뒤에 쓴 `"fmt"` 와 `Println` 앞에 쓴 `fmt`가 같아 보이는 것이지, 정확하게는 `"fmt"` 는 패키지의 path, `fmt` 는 패키지의 이름이다.

`PackageName` 을 `ImportPath` 앞에 별도로 적는 경우는 일종의 별칭을 만드는 것이다.

출력을 위해 매번 `fmt` 를 쓰는 것이 귀찮다면 별칭을 만들어 사용할 수 있다.

```go
package main

import f "fmt"

func main() {
    f.Println("Hello, Go!")
}
```

별칭을 쓰는 것조차 귀찮다면 점(".")을 찍으면 된다. `ImportPath` 앞에 점을 찍으면 해당 패키지의 기능들을 마치 동일 패키지인 듯 접근할 수 있다.

```go
package main

import . "fmt"

func main() {
    Println("Hello, Go!")
}
```

패키지의 이름을 정할 때는 *blank identifier - underscore만 단독으로 쓴 경우 -* 를 사용할 수 없지만, 외부 패키지를 import 할 때 `PackageName` 자리에는 blank identifer를 사용할 수 있다. 이 경우에는 해당 패키지의 기능을 호출하지 않겠다는 의미이다.

> "아니, 사용하지도 않을거면서 왜 import 하고 난리야?"

이 부분은 나중에, `main` 이 아닌 패키지를 만들 때 다시 다루는게 좋겠다. To be continued.

