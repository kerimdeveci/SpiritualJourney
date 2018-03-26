//
//  main.c
//  0103-输入和显示
//
//  Created by Enrica on 2018/3/26.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

int main(void) {
    
    // 变量no在这里有特殊的用途，我们会在后面将从键盘输入的
    // 整数存储到它里面，因此暂时可以不必进行初始化
    int no;
    
    printf("请输入一个整数：");
    
    // 将输入的整数存入变量no。这里scanf函数有两个参数，第一个参数"%d"，
    // 它限制了函数只能读取十进制数，如果输入其它类型的数，比如说浮点数
    // 或者字符串，系统会隐式的将其转换为十进制的整数(也就是说并不会报错)
    // 因此，为了让程序达到预期效果，在输入的时候一定要注意数据类型
    scanf("%d", &no);
    
    printf("你输入的整数是：%d\n", no);
    
    // 在来一个乘法运算
    printf("%d的5倍是%d\n", no, 5 * no);
    
    
    
    int x, y;
    
    // 使用puts函数。puts函数末尾的s取自string，从这里也可以看出，它
    // 其实是用来输出字符串实参的，其功能和printf("字符串\n")一样。也
    // 就是说，函数puts在输出字符串参数之后，会自动换行。一般情况下，在
    // 需要换行，但是无需格式化输出的时候，可以使用puts函数来代替printf
    // 函数。另外，需要注意的是，puts函数的实参只能有一个，多于一个会出错
    puts("下面输入两个整数。");
    printf("请输入第一个整数：");
    scanf("%d", &x);
    printf("请输入第二个整数：");
    scanf("%d", &y);
    
    printf("%d和%d的和是：%d\n", x, y, x + y);
    
    return 0;
}
