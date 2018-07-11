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

CSS(Cascading Style Sheets)라는 용어는 굳이 웹 개발자가 아니더라도 들어는 봤을 것이다. 간단히 얘기하면 **대상 문서의 서식을 정의한 문서** 정도 되겠다. 워드프로세서를 이용해 글을 쓸 때, 전체 문서의 글꼴은 맑은 고딕, 본문의 글자 크기는 10포인트, 제목의 글자 크기는 12포인트에 굵게, 단락의 첫 글자는 한 칸 띄고 시작... 등을 정의하는 것처럼 CSS도 대상 문서---주로 HTML 문서---의 서식만을 따로 정의한 것이다.

그런데 이런 서식을 개발한다? 