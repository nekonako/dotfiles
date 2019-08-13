const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0a1124", /* black   */
  [1] = "#63504E", /* red     */
  [2] = "#A33A4E", /* green   */
  [3] = "#EB3247", /* yellow  */
  [4] = "#F35743", /* blue    */
  [5] = "#F6A73B", /* magenta */
  [6] = "#F9D42E", /* cyan    */
  [7] = "#ecc29a", /* white   */

  /* 8 bright colors */
  [8]  = "#a5876b",  /* black   */
  [9]  = "#63504E",  /* red     */
  [10] = "#A33A4E", /* green   */
  [11] = "#EB3247", /* yellow  */
  [12] = "#F35743", /* blue    */
  [13] = "#F6A73B", /* magenta */
  [14] = "#F9D42E", /* cyan    */
  [15] = "#ecc29a", /* white   */

  /* special colors */
  [256] = "#0a1124", /* background */
  [257] = "#ecc29a", /* foreground */
  [258] = "#ecc29a",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
