+++
title = "Floating Point"
description = "IEEE 754 부동소수점에 대한 이해"
topics = ["computer-general"]
tags = ["floating-point", "ieee754"]
slug = "floating-point"
date = "2019-11-09T14:31:45+09:00"
imports = ["math"]
draft = true

+++

123.456은 다음과 같이 다양한 방식으로 표현할 수 있다.
$$\begin{align}
123.456 &=& 1.23456 \times 10 ^ 2
\\\ &=& 12.3456 \times 10 ^ 1 \\\ &=& 123.456 \times 10 ^ 0
\\\ &=& 1234.56 \times 10 ^ {-1} \\\ &=& 12345.6 \times 10 ^ {-2} \\\ &=& \ldots
\end{align}$$

실수를 _F_ 라 하면 일반화해 다음과 같이 나타낼 수 있다.

$$
F = m \times b ^ e
$$
부동소수점 실수는 할당된 공간을 고정된 크기의 가수 (假數, mantissa 또는 fraction)와 지수 (指數, exponent)부로 나눠 사용해 다양한 실수를 표현한다. 표현 방식은 다음과 같다.



소수점의 위치가 둥둥~ 그래서 뜰 부浮 움직일 동動. 