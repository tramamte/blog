+++
title = "Blog 작성 참고자료"
description = "Hugo 기본 및 추가 shortcode 사용법"
topics = ["hugo"]
tags = ["shortcode"]
slug = "hugo-shortcode"
date = "2018-05-31T22:20:26+09:00"
draft = true
+++

---

Awesome Patrick 글 작성을 위해 개인적으로 참고할 내용을 정리한 글입니다.

---

## Shortcode 사용법

### Markdown 문법과 같이 사용할 수 있는 shortcode

```
{ {% shortcode_name %}} **Contents** { {% /shortcode_name %}}
```

### Markdown 사용하지 않는 shortcode

```
{ {< shortcode_name >}} <b>Contents</b> { {< /shortcode_name >}}
```

<br>

## Hugo built-in shortcodes

### 1. `figure`

: image 출력

`src` : image URL

`height`, `width`

`link`: hyperlink destination URL

`target`: `target` attribute if `link` parameter is set.

`alt`, `title`, `caption`

```
{ {< figure src="/post/hugo/sky.jpg" width="300" caption="Caption: Original resolution is 1880 x 1253" title="Title: Sky">}}
```

{{< figure src="/post/hugo/sky.jpg" width="300" caption="Caption: Original resolution is 1880 x 1253" title="Title: Sky">}}

### 2. `highlight`

: syntax highlighting

`linenos`: `table` or `inline`

`linenostart`: default 1

`hl_lines`: highlight lines (ex: 3-8 10-20)

```
{ {< highlight go "linenos=table, linenostart=10, hl_lines=3 6" >}}
package main

import "fmt"

func main() {
	fmt.Println("Hello, Go")
}
{ {< /highlight >}}
```

{{< highlight go "linenos=table, linenostart=10, hl_lines=3 6" >}}
package main

import "fmt"

func main() {
	fmt.Println("Hello, Go")
}
{{< /highlight >}}

### 3. `ref`, `relref` 

- markdown 파일을 이용해 절대, 상대 경로 자동 성성
- markdown 파일 위치는 content/ directory 기준
- 전체에 같은 파일 이름이 하나밖에 없다면 파일 이름만 입력도 가능

#### 3.1 Anchor 만들기 (#making-anchor) {#making-anchor}

```
## Alpha 101 {#alpha}
## Version 1.0 {#version-1-dot-0}
```

```
[Go to making-anchor]({ {< relref "#making-anchor" >}})
```

[Go to making-anchor]({{< relref "#making-anchor" >}})

### 4. `youtube`

: Youtube 동영상 삽입

`id`, `autoplay`

`https://www.youtube.com/watch?v=w7Ft2ymGmfc` 영상의 경우,

```
{ {< youtube w7Ft2ymGmfc >}}

or

{ {< youtube id="w7Ft2ymGmfc" autoplay="true" >}}
```



