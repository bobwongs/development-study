//
//  main.c
//  BWCStudy
//
//  Created by BobWong on 2018/5/28.
//  Copyright © 2018年 BobWongStudio. All rights reserved.
//

#include <stdio.h>

void sayHi(void);

int main(int argc, const char * argv[]) {
    void *p0;
    int num0 = 12;
    char *char0 = "hello";
//    p0 = &num0;
//    p0 = char0;
    p0 = sayHi;
//    printf("p0: %d\n", *(int *)(p0));
//    printf("p0: %c\n", *(int *)(p0));
//    void (*p2)(void) = &sayHi;
//    p2();
    p0 = &sayHi;
    ((void (*)(void))p0)();
    return 0;
}

void sayHi() {
    printf("say hi\n");
}



// C语言
// 学习记录
//  函数指针语法

// To Do
//  动态内存分配和管理

