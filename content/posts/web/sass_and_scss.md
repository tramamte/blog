+++
title = "CSS 개발 도구, Sass & SCSS"
description = "스마트한 CSS 작성 방법"
topics = ["web"]
tags = ["sass", "scss", "css"]
slug = "sass-and-scss"
date = "2018-07-11T14:56:38+09:00"
imports = ["math", "zimg", "flowchart", "sequence", "mermaid"]
draft = true
+++

> CSS를 개발해? CSS가 개발까지 필요한거였어?

웹 기술을 이용한 프론트엔드 개발에 익숙하지 않은 개발자라면 유사한 의문을 품을 수 있을께다. 지금 이 글을 쓰고 있는 본인도 웹 개발에는 거의 문외한이고, Awesome Patrick을 개설하면서 겨우 최근의 웹 기술을 조금 맛 본 실정이다. 

JavaScript 등을 이용해 네이티브앱에 버금가면서도 개발 속도도 빠르고 멀티 플랫폼 지원도 쉽게 할 수 있는 여러 도구들이 등장했지만,

> 이름은 들어봤어. 네이티브 코딩으로 다 할 줄 알고 더 복잡한 고급 기능들도 쓸 수 있는데, 엑스칼리버 두고 뭐하러 커터칼을 써?

라며 공부를 게을리 했던 것이 사실이다.

그런데, 모든 앱을 개발하는데 엑스칼리버가 필요한 것은 아니며, 커터칼처럼 보였던 것이 실은 [맥 형님](https://ko.wikipedia.org/wiki/%EB%A7%A5%EA%B0%80%EC%9D%B4%EB%B2%84)이 들고 다니던 스위스 아미 나이프였더라. 늦었다 실망 말고 공부하자.

{{% box %}}

아래 내용은 [Sass 사이트의 Documentation](http://www.sass-lang.com/documentation/file.SASS_REFERENCE.html)을 정리하며 약간의 주석을 추가한 것입니다.

{{% /box %}}

# Sass? SCSS?

{{% quote %}}

- Sass (Syntactically Awesome StyleSheets)
- SCSS (Sassy CSS)
- CSS (Cascading Style Sheets)

{{% /quote %}}

CSS라는 용어는 굳이 웹 개발자가 아니더라도 들어는 봤을 것이다. 간단히 얘기하면 **대상 문서의 서식을 정의한 문서** 정도 되겠다. 워드프로세서를 이용해 글을 쓸 때, 전체 문서의 글꼴은 맑은고딕, 본문의 글자 크기는 10포인트, 제목의 글자 크기는 12포인트에 굵게, 단락의 첫 글자는 한 칸 띄고 시작... 등을 정의하는 것처럼 CSS도 대상 문서---주로 HTML 문서---의 서식만을 따로 정의한 것이다.

그런데 이런 서식을 개발한다? 워드프로세서의 예로 돌아가 보자. 본문은 10포인트 검은색 글자, 표의 캡션은 9포인트 회색 글자이고, 표의 내용은 10포인트 회색 글자라 가정해 보자. "검은색", "회색", "10포인트", "9포인트"를 각각 변수에 담고 싶지 않은가? '표'라는 주제 아래에 '캡션'과 '내용'을 묶고 싶지 않은가? Sass를 사용하면 바로 이런 것이 가능하다. 정리하자면,

{{% quote note %}}

결과로 CSS 파일을 얻을 수 있는, CSS에는 없는 편리한 기능들이 추가된 문법

{{% /quote %}}

이 바로 Sass이다. Sass 사이트에서는 다음과 같이 설명하고 있다.

{{% quote quote %}}

Sass is the most mature, stable, and powerful professional grade CSS extension language in the world.

{{% /quote %}}

