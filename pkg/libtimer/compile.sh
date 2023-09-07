rm *o
rm *exe
gcc -g -c timerlib.c -o timerlib.o
gcc -g -c WheelTimer.c -o WheelTimer.o
gcc -g -c WheelTimerDemo.c -o WheelTimerDemo.o
gcc -g -c gluethread/glthread.c -o gluethread/glthread.o
gcc -g WheelTimerDemo.o WheelTimer.o timerlib.o gluethread/glthread.o -o WheelTimerDemo.exe -lrt
