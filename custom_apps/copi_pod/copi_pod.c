#include "copi_view.h"

#include <sys/boardctl.h>

int main(int argc, FAR char *argv[])
{
  boardctl(BOARDIOC_INIT, 0);

  copi_view_init();

  return 0;
}
