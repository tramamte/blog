+++
title = "타입 임베딩"
description = "Type embedding"
topics = ["go"]
tags = ["syntax-go"]
slug = "type-embedding"
date = "2019-01-01T11:04:00+09:00"
imports = [""]
draft = true

+++

[메서드]({{<ref "20181220-23-22">}})에서 언급한 것처럼 Go는 클래스가 없다. 따라서 클래스 상속을 통한 IS-A 관계도 없다. "C++은 구조체도 상속해 IS-A 관계를 만들 수 있다."라는 반대를 위한 반대는 접어두자.

Go에서 IS-A 관계를 만들지 못하는 것은 아니지만 여기서는 **상속을 통한 IS-A 관계는 없다**는 점을 기억하자. IS-A 관계가 없으므로 더 적극적으로 활용하는 방법이 HAS-A 관계, 즉 타입 임베딩이다.

# 무명 필드

