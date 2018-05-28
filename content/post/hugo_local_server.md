+++
title = "Hugo Local Server 접속 방법"
description = "작성중인 내용을 다른 장치에서 확인하기"
date = "2018-05-28T16:06:37+09:00"
topics = ["hugo"]
tags = ["hugo"]
draft = false
+++

테마를 수정하거나 컨텐츠 작성 중 변경 사항을 확인하기 위해서 hugo server를 실행하면 배포하지 않고도 *local* 에서 확인이 가능합니다.

```bash
$ hugo server
```

그런데 기본 주소가 localhost (127.0.0.1)이기 때문에 말 그대로 *local* 에서만 확인 가능하고 서버를 실행한 장치가 아니면 접속이 불가능합니다. PC, 모바일 단말 등 다양한 장치에서 확인하기 위해서는 옵션을 추가할 필요가 있습니다.

[hugo server](https://gohugo.io/commands/hugo_server/)에 다양한 사용법이 있는데 다음 두 가지가 중요합니다.

```bash
 -b, --baseURL string  hostname (and path) to the root
     --bind string     interface to which the server will bind
```

실행 전 장치의 IP 주소를 확인합니다.

```bash
# Windows
> ipconfig

# macOS or Linux
$ ifconfig
```

확인한 IP 주소를 이용해 hugo server를 다음과 같이 실행합니다.

```bash
$ hugo server --baseURL "http://{ip addr}" --bind "0.0.0.0."
```

이제 같은 공유기에 접속해 있는 다른 장치들에서도 임시버전을 확인할 수 있습니다. 