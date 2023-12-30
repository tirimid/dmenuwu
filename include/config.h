#ifndef CONFIG_H__
#define CONFIG_H__

static const char *fonts[] = {
	"Hermit:pixelsize=16"
};

static const char *colors[SchemeLast][2] = {
	[SchemeNorm] = { "#ee88bb", "#0a0a0a" },
	[SchemeSel] = { "#0a0a0a", "#ee88bb" },
	[SchemeOut] = { "#000000", "#ffffff" },
};

static const char *prompt = "OwO? Choco?";
static unsigned int lines = 12;
static unsigned int yoff = 200;
static unsigned int hpad = 300;
static unsigned int topbar = 1;
static const char worddelimiters[] = " ";
 
#endif
