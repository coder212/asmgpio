#Makefile
all:  lat

lat: lat.o gpio_lib.o
	gcc -o $@  $+
lat.o : lat.s
	as -o $@ $<
gpio_lib.o : gpio_lib.s
	as -o $@ $<

clean:
	rm -vf lat *.o
