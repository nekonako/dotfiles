static const char norm_fg[] = "#ecc29a";
static const char norm_bg[] = "#0a1124";
static const char norm_border[] = "#a5876b";

static const char sel_fg[] = "#ecc29a";
static const char sel_bg[] = "#A33A4E";
static const char sel_border[] = "#ecc29a";

static const char urg_fg[] = "#ecc29a";
static const char urg_bg[] = "#63504E";
static const char urg_border[] = "#63504E";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
