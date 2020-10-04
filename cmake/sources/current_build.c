#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>

int main(int argc, char **argv)
{
    char *buildfile = argv[1];
    unsigned long build = 0;
    FILE *fp;

    if (argc < 2 && buildfile == NULL)
    {
        fprintf(stderr, "Error: Invalid argument\n");
        exit(EXIT_FAILURE);
    }

    fp = fopen(buildfile, "r");

    if (fp != NULL)
    {
        char line[21] = { 0 };
        fread(line, sizeof(line), 1, fp);
        build = strtoul(line, NULL, 0);
        fclose(fp);
    }

    fp = fopen(buildfile, "w+");

    if (fp == NULL)
    {
        fprintf(stderr, "%s: %s\n", buildfile, strerror(errno));
        exit(EXIT_FAILURE);
    }

    fprintf(fp, "%d", ++build);
    fclose(fp);

    return EXIT_SUCCESS;
}
