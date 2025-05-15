#include "copi_view.h"

#include <lvgl/lvgl.h>

int copi_view_init(void)
{
  lv_nuttx_dsc_t info;
  lv_nuttx_result_t result;

  if (lv_is_initialized())
  {
    LV_LOG_ERROR("LVGL already initialized! aborting.");
    return -1;
  }

  lv_init();

  lv_nuttx_dsc_init(&info);

  info.fb_path = "/dev/lcd0";

  lv_nuttx_init(&info, &result);

  if (result.disp == NULL)
  {
    LV_LOG_ERROR("copi_view initialization failure!");
    return 1;
  }
  
  // Create a simple label
  lv_obj_t *label = lv_label_create(lv_scr_act());  // Create label on the active screen
  lv_label_set_text(label, "Hello, World!");        // Set the text
  lv_obj_align(label, LV_ALIGN_CENTER, 0, 0);        // Center it on the screen

  while (1)
  {
    uint32_t idle;
    idle = lv_timer_handler();

    /* Minimum sleep of 1ms */

    idle = idle ? idle : 1;
    usleep(idle * 1000);
  }

  lv_nuttx_deinit(&result);
  lv_deinit();
  return 0;
}
