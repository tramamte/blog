+++
title = "호출 연기"
description = "Defer statement"
topics = ["go"]
tags = ["syntax-go"]
slug = "defer"
date = "2018-09-20T12:12:52+09:00"
imports = ["math", "zimg", "flowchart", "sequence", "mermaid"]
draft = true

+++

Defer는 호출을 연기하는 Go의 독특한 구문 중 하나이다. 호출을 연기한다는 것이 무슨 의미인지는 다음 C 코드를 예로 알아보자.

```c
#include <stdio.h>
#include <stdlib.h>

#define BUF_SIZE 512

int main(int argc, char *argv[])
{
	FILE* fp = NULL;
	char* buf = (char*)malloc(BUF_SIZE);

	if (argc != 2)
	{
		printf("empty filename\n");
		free(buf);
		return -1;
	}

	fp = fopen(argv[1], "r");
	if (!fp)
	{
		printf("fopen fail\n");
		free(buf);
		return -1;
	}

	while(fgets(buf, BUF_SIZE, fp))
	{
		printf("%s", buf);
	}

	free(buf);
	fclose(fp);
	return 0;
}
```

Defer를 알아보기 위해 조금 미련하게 작성하기는 했지만 큰 틀에서 위와 같이 리소스를 열고 닫는 코드는 C/C++, Java 등 언어를 막론하고 많이 접하게 된다. 위 예에서는 메모리를 할당/해제하거나, 파일을 열고 닫는 코드가 이에 해당한다.

메모리 해제에 대한 부담이 없는 언어의 경우라도 열었던 파일을 닫아주는 수고는 필요하다.

소멸자의 호출 시점을 특정할 수 있는 C++이라면 다음과 유사한 코드를 통해 그마나 `return` 전 여기 저기서 `fclose()`를 호출해야 하는 부담을 줄일 수는 있다.

```c++
class FileCloser
{
public:
	FileCloser(FILE* fp)
	{
		this.fp = fp;
	}
    
	~FileCloser()
	{
		fclose(fp);
	}
    
private:
	FILE* fp;
};

int main(int argc, char *argv[])
{
	FILE* fp = fopen("test.file", "r");
	FileCloser fc(fp);
	//...
}
```

위 예에서 만든 FileClose 클래스는 template을 이용해 좀 더 일반화할 수 있지만 리소스를 해제하는 방식이 다른 경우라면---`fclose()` 함수로 닫는 리소스가 아니라면--- 개별 작성을 피할 수 없다. 

Python은 이를 좀 더 일반화해 `with` 구문을 제공한다.

```python
with open("test.file") as f:
	# do somthing
```

