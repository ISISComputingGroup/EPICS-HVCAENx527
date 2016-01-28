#include <stdio.h>

int
main( int argc, char **argv)
{
	printf( "Size for Type:\n");
	printf( "   int: %d\n", sizeof(int));
	printf( " float: %d\n", sizeof(float));
	printf( " short: %d\n", sizeof(short));
	printf( "  long: %d\n", sizeof(long));
	printf( "double: %d\n", sizeof(double));
	printf( "  char: %d\n", sizeof(char));
	printf( " char*: %d\n", sizeof(char*));
	printf( "  int*: %d\n", sizeof(int*));
}
