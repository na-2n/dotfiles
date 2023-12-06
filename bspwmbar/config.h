/* See LICENSE file for copyright and license details. */

#ifndef BSPWMBAR_CONFIG_H_
#define BSPWMBAR_CONFIG_H_

#include "bspwmbar.h"

/* intel */
#define THERMAL_PATH "/sys/class/thermal/thermal_zone0/temp"
/* k10temp */
/* #define THERMAL_PATH "/sys/class/hwmon/hwmon1/temp1_input" */

/* max length of monitor output name and bspwm desktop name */
#define NAME_MAXSZ  32
/* max length of active window title */
#define TITLE_MAXSZ 50
/* set window height */
#define BAR_HEIGHT  24

/* set font pattern for find fonts, see fonts-conf(5) */
const char *fontname = "Inconsolata:size=10";

/*
 * color settings by index of color map
 */
/* bspwmbar fg color */
#define FGCOLOR    "#dcdfe4" //"#e5e5e5"
/* bspwmbar bg color */
#define BGCOLOR    "#282c34" //"#222222"
/* inactive fg color */
#define ALTFGCOLOR "#7f7f7f"
/* graph bg color */
#define ALTBGCOLOR "#555555"

/*
 * Module definition
 */

/* modules on the left */
module_t left_modules[] = {
	{
		.text = {
			.func = text,
			.label = "na2",
			.fg = "#c678dd",
		},
	},
	{ /* bspwm desktop state */
		.desk = {
			.func = desktops,
			.focused = "[x]",
			.unfocused = "[ ]",
			.fg_free = ALTFGCOLOR,
		},
	},
	{ /* active window title */
		.title = {
			.func = windowtitle,
			.maxlen   = TITLE_MAXSZ,
			.ellipsis = "…",
		},
	},
};

/* modules on the right */
module_t right_modules[] = {
	{ /* system tray */
		.tray = {
			.func = systray,
			.iconsize = 16,
		},
	},
	{ /* cpu usage */
		.cpu = {
			.func = cpugraph,
			.prefix = "cpu: "
		},
	},
	{ /* memory usage */
		.mem = {
			.func = memgraph,
			.prefix = "mem: "
		},
	},
	{
		.mixer = {
			.func = mixer,
			.handler = mixer_ev,
			.prefix = "vol: ",
			.suffix = "%",
			.device = "/dev/mixer0",
		},
	},
	{ /* backlight */
		.backlight = {
			.func = backlight,
			.handler = backlight_ev,
			.prefix = "bl: ",
			.suffix = "%",
			.device = "/dev/backlight/backlight0",
		},
	},
	{ /* battery */
		.battery = {
			.func = battery,
			.prefix = "bat: ",
			.prefix_1 = "bat: ",
			.prefix_2 = "bat: ",
			.prefix_3 = "bat: ",
			.prefix_4 = "bat: ",
			.suffix = "%",
			.path = "/sys/class/power_supply/BAT0/uevent",
		},
	},
	//{ /* master playback volume */
	//	.vol = {
	//		.func = volume,
	//		.handler = volume_ev,
	//		.suffix = "％",
	//		.muted = "婢",
	//		.unmuted = "墳",
	//	},
	//},
	//{ /* used space of root file system */
	//	.fs = {
	//		.func = filesystem,
	//		.mountpoint = "/",
	//		.prefix = "fs: ",
	//		.suffix = "%",
	//	},
	//},
	//{ /* cpu temperature */
	//	.thermal = {
	//		.func = thermal,
	//		.sensor = "tz0",
	//		.prefix = "temp: ",
	//		.suffix = "C",
	//	},
	//},
	{ /* clock */
		.date = {
			.func = datetime,
			.prefix = "",
			.format = "%H:%M",
		},
	},
};

#endif
