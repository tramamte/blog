+++
title = "리눅스 메모리 사용량 확인"
description = "리눅스 장비에서 메모리 사용량 확인하는 방법"
topics = ["computer-general"]
tags = ["memory", "ram", "usage", "free", "meminfo"]
slug = "memory-usage"
date = "2019-11-12T12:45:17+09:00"
imports = []
draft = true

+++

GUI 기반 데스크톱 리눅스 환경이라면 한눈에 알아볼 수 있는 도구가 있지만, 주로 `free` 명령을 이용하거나 `/proc/meminfo` 내용을 확인하는 방법으로 리눅스 장비의 메모리 사용량 및 남은 용량을 확인한다.

출력 결과가 몇 줄에 불과하지만 의미가 혼란스러운 경우가 많다.

{{< figure src="/posts/computer/system_monitor.png" title="gnome-system-monitor" caption="이렇게 좋은 기능도 있지만..." >}}

# free

`free` 명령은 가장 쉽고 가장 많이 사용하는 메모리 확인 방법이다.

```sh
$ free
```

`-b`, `-k`, `-m`, `-g` 등 옵션을 추가해 출력 단위를 조절할 수 있다.

```
              total        used        free      shared  buff/cache   available
Mem:        8070756     1727000     3374400      885568     2969356     5159876
Swap:       2097148           0     2097148
```

주로 사용되는 Ubuntu 18.04, CentOS 7 등에서는 출력 결과가 한결 단순한데, 

```
             total       used       free     shared    buffers     cached
Mem:       1030456     393252     637204          0     106276      69416
-/+ buffers/cache:     217560     812896
Swap:      2064376      47440    2016936
```

명령어 버전에 따라 위와 같은 형식으로 출력되는 경우도 있으니 함께 살펴보자.

# meminfo

`/proc/meminfo`에는 좀 더 자세한 정보가 기록돼 있다.

```sh
$ cat /proc/meminfo
```

