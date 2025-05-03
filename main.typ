#import "themes/uestc.typ": *
#import "@preview/numbly:0.1.0": numbly
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#show: codly-init.with()
#import "@preview/subpar:0.2.2"
#import "@preview/pinit:0.2.2": *
#import "@preview/mitex:0.2.5": *
#import "@preview/algo:0.3.6": algo, i, d, comment, code
#import "@preview/frame-it:1.1.2": *
#import "@preview/cetz:0.3.4"
#import "@preview/lilaq:0.2.0" as lq

// 设置字体
#set text(font: ((name: "Arial", covers: "latin-in-cjk"),"STHeiti"), lang: "zh")

#show: uestc-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-info(
    title: [文献汇报],
    subtitle: [This is the title of the article you need to report],
    author: [
      author1 #h(2em)
      author2 #h(2em)   
      author2],
    date: datetime.today(),
    institution: [
      Volume: xx, Issue: x, April 20xx \
      IEEE Transactions on Image Processing
      ],
  )
)

#let (example, feature, variant, syntax) = frames(
  feature: ("Feature",),
  // For each frame kind, you have to provide its supplement title to be displayed
  variant: ("Variant",),
  // You can provide a color or leave it out and it will be generated
  example: ("Example", gray),
  // You can add as many as you want
  syntax: ("Syntax",),
)
// This is necessary. Don't forget this!
#show: frame-style(styles.boxy)

// 设置标题编号格式（1.1 → 1.）
// #set heading(numbering: numbly("{1}.", default: "1.1"))

// 设置数学公式编号格式
#set math.equation(numbering: "(1)")

// 标题页
#title-slide()

= 基础文字展示

== 列表

在 slide 中，比起段落文字，更建议使用 *列表*。  
这是一个混合的列表：第一级使用有序列表，第二级使用无序列表。  
不建议超过 _两级列表_。

+ 第一项
  - 第一项的第一个子项，这是一个非常非常非常非常非常长的子项，用来展示换行的效果。
  - 第二项
+ 第二项
  - 第二项的第一个子项，这是一个较长的子项，用来展示效果。
+ 第三项，这是一个非常非常非常非常非常非常非常非常非常长的项，用来展示换行的效果。

== 分栏

#slide[
*左侧内容：*
+ 第一项
  - 第一项的第一个子项，这是一个非常非常非常非常非常长的子项，用来展示换行的效果。
  - 第一项的第二个子项
+ 第二项
  - 第二项的第一个子项，这是一个较长的子项，用来展示效果。
][
*右侧内容：*

这里可以放图片、图表，或者更详细的解释。

例如：

#image("/pictures/uestc-name.svg", width: 100%)
]

== 引用
这一个页面展示了文献引用的效果。\
首先请将所需要引用的文献（格式为BibTeX）添加到 bibliography.bib 文件中。\
然后在文中使用 \#cite(<key>) 进行引用，此时会自动在文末生成引用列表。

+ 第一个文献引用 #cite(<fu2022kxnet>)
+ 第二个文献引用 #cite(<celledoni2021equivariant>)
+ 第三个文献引用 #cite(<chen2023imaging>)
+ 第四个文献引用 #cite(<sannai2021improved>)
+ 第五个文献引用 #cite(<fu2024rotation>)
+ 第六个文献引用 #cite(<xie2022fourier>)
+ 第七个文献引用 #cite(<weiler2018learning>)

== 表格
#set table(
  stroke: (x, y) => if y == 1 {
    (bottom: 1.3pt + black)
  } else if y == 0 {
    (bottom: 2pt + black)
  },
  align: (x, y) => if x < 2 { left } else { center },
  inset: 10pt,
)

#table(
  columns: 8,
  align: center,
  // 分组表头
  table.header(
    [*Method*], 
    [*Scale*], 
    table.cell(colspan: 2)[*Urban100*], 
    table.cell(colspan: 2)[*BSD100*],
    table.cell(colspan: 2)[*Set14*],
  ),
  // 子表头
  [], [], [PSNR], [SSIM], [PSNR], [SSIM], [PSNR], [SSIM],
  // 数据行（无引号）
  [K], [], [28.51], [0.8667], [30.38], [0.8485], [31.28], [0.8697],
)

使用 `#figure` 将表格居中显示。
#figure(
  table(
    columns: 8,
    align: center,
    // 分组表头
    table.header(
      [*Method*], 
      [*Scale*], 
      table.cell(colspan: 2)[*Urban100*], 
      table.cell(colspan: 2)[*BSD100*],
      table.cell(colspan: 2)[*Set14*],
    ),

    // 子表头
    [], [], [PSNR], [SSIM], [PSNR], [SSIM], [PSNR], [SSIM],

    // 数据行（无引号）
    [K], [], [28.51], [0.8667], [30.38], [0.8485], [31.28], [0.8697],
    [K $p_4$], [×2], [28.91], [0.8758], [30.63], [0.8564], [31.64], [0.8756],
  )
)

== 块显示
#example[Title][Optional Tag][
  Body, i.e. large content block for the frame.
]

= 数学公式
== 基础用法
详细内容见
#link("https://typst-doc-cn.github.io/docs/reference/math/", text("此处"))

$ A = pi r^2 $
$ "area" = pi dot "radius"^2 $
$ cal(A) :=
    { x in RR | x "is natural" } $
#let x = 5
$ #x < 17 $

$ x < y => x gt.eq.not y $

$ sum_(k=0)^n k
    &= 1 + ... + n \
    &= (n(n+1)) / 2 $

$ frac(a^2, 2) $
$ vec(1, 2, delim: "[") $
$ mat(1, 2; 3, 4) $
$ lim_x =
    op("lim", limits: #true)_x $

$ (3x + y) / 7 &= 9 && "given" \
    3x + y &= 63 & "multiply by 7" \
    3x &= 63 - y && "subtract y" \
    x &= 21 - y/3 & "divide by 3" 
$
== 使用Latex语法
像这样编写行内方程：#mi(`\frac{1}{x}`)。

这个是行间公式：

#mitex(
```latex
      \newcommand{\loss}{\mathcal{L}}
      \min_{G}\max_{D} \mathbb{E}_{y,g}\{\loss(Ax^{(1)},y) &+ \alpha \loss(x^{(2)},x^{(3)})\\&+ \beta \loss_\textrm{adv}(x^{(1)},x^{(2)})\},
```)

== 标记公式

#let pinit-highlight-equation-from(height: 2em, pos: bottom, fill: rgb(0, 180, 255), highlight-pins, point-pin, body) = {
  pinit-highlight(..highlight-pins, dy: -0.9em, fill: rgb(..fill.components().slice(0, -1), 40))
  pinit-point-from(
    fill: fill, pin-dx: 0em, pin-dy: if pos == bottom { 0.5em } else { -0.9em }, body-dx: 0pt, body-dy: if pos == bottom { -1.7em } else { -1.6em }, offset-dx: 0em, offset-dy: if pos == bottom { 0.8em + height } else { -0.6em - height },
    point-pin,
    rect(
      inset: 0.5em,
      stroke: (bottom: 0.12em + fill),
      {
        set text(fill: fill)
        body
      }
    )
  )
}

公式标记：

#v(2em)

$ (#pin(1)q_T^* p_T#pin(2))/(#pin(3)p_E#pin(4))#pin(5)p_E^*#pin(6) >= (c + q_T^* p_T^*)(1+r^*)^(2N) $

#v(5em)

#pinit-highlight-equation-from((1, 2, 3, 4), (3, 4), height: 3.5em, pos: bottom, fill: rgb(0, 180, 255))[
  quantity of Terran goods
]

#pinit-highlight-equation-from((5, 6), (5, 6), height: 2.5em, pos: top, fill: rgb(150, 90, 170))[
  price of Terran goods, on Trantor
]
== 数学公式动画

在 Touying 数学公式中使用 `pause`:

#touying-equation(`
  f(x)  &= pause x^2 + 2x + 1  \
        &= pause (x + 1)^2  \
`)

#meanwhile

如您所见，#pause 这是 $f(x)$ 的表达式。

#pause

通过因式分解，我们得到了结果。

= 图片展示

== 分栏

#slide[
#figure(
image("/pictures/uestc-logo.svg", width: 50%),
caption: [校徽],
) <xiaohui>

#h(3em)
@xiaohui 是电子科技大学的校徽
][
  - 电子科技大学（University of Electronic Science and Technology of China）
  - 是中华人民共和国教育部直属的全日制普通本科高校。
  - 是“211工程”、“985工程优势学科创新平台”重点建设高校。
  - logo如 @xiaohui 所示。
]

== 子图
#subpar.grid(
  figure(image("/pictures/uestc-logo.svg"), caption: [
    电子科技大学logo
  ]), <a>,
  figure(image("/pictures/uestc-logo.svg"), caption: [
    电子科技大学logo
  ]), <b>,
  columns: (1fr, 1fr),
  caption: [子图展示],
  label: <full>,
)

在 @full 上方，我们看到一个由两个其他图形组成的图形，即 @a 和 @b。

== 科学绘图
#slide[
#h(1.35em)
#lq.diagram(
  lq.plot((0, 1, 2, 3, 4), (5, 4, 2, 1, 2))
)
#let xs = (0, 1, 2, 3, 4)
#v(-0.8em)
#lq.diagram(
  title: [#text(size: 15pt)[Precious data]],
  xlabel: $x$, 
  ylabel: $y$,

  lq.plot(xs, (5, 4, 2, 1, 2), mark: "s", label: [A]),
  lq.plot(xs, (2, 5, 4, 2, 3), mark: "o", label: [B])
)
][
#lq.diagram(
  xaxis: (subticks: none),
  lq.bar(
    (1, 2, 3, 4, 5, 6),
    (1, 2, 3, 2, 5, 3),
  )
)
#v(-0.8em)
#let a =  [Apples]
#let b =  text(size: 12pt)[Bananas]
#let c =  text(size: 12pt)[Kiwis]
#let d =  text(size: 12pt)[Mangos]
#let e =  text(size: 12pt)[Papayas]
#lq.diagram(
  xaxis: (
    ticks: (a, b, c, d, e)
      .map(rotate.with(-45deg, reflow: true))
      .enumerate(),
    subticks: none,
  ),
  lq.bar(
    range(5),
    (5, 3, 4, 2, 1)
  )
)
][
  #lq.diagram(
  lq.boxplot(
    stroke: blue.darken(50%),
    (1, 2, 3, 4, 5, 6, 7, 8, 9, 21, 19),
    range(1, 30),
    (1, 28, 25, 30),
    (1, 2, 3, 4, 5, 6, 32),
  )
)
#v(0.8em)
#lq.diagram(
  lq.boxplot(
    (1, 3, 10),
    stroke: luma(30%),
    fill: yellow,
    median: red
  ),
  lq.boxplot(
    (1.5, 3, 9),
    x: 2,
    whisker: blue,
    cap: red,
    cap-length: 0.7,
    median: green
  ),
  lq.boxplot(
    lq.linspace(5.3, 6.2) + (2, 3, 7, 9.5),
    x: 3,
    outliers: "x"
   ),
  lq.boxplot(
    lq.linspace(5.3, 6.2) + (2, 3, 7, 9.5),
    x: 4,
    outliers: none
  ),
)
]

= 代码展示
== 代码
#codly(languages: codly-languages)
```C
#include <stdio.h>

int main() {
    // 输出 Hello, World!
    printf("Hello, World!\n");
    
    return 0;
}
```
== 伪代码
#slide[
#algo(
  title: "Fib",
  parameters: ("n",)
)[
  if $n < 0$:#i\        // use #i to indent the following lines
    return null#d\      // use #d to dedent the following lines
  if $n = 0$ or $n = 1$:#i #comment[you can also]\
    return $n$#d #comment[add comments!]\
  return #smallcaps("Fib")$(n-1) +$ #smallcaps("Fib")$(n-2)$
]
][
#algo(
  title: [                    // note that title and parameters
    #set text(size: 15pt)     // can be content
    #emph(smallcaps("Fib"))
  ],
  parameters: ([#math.italic("n")],),
  comment-prefix: [#sym.triangle.stroked.r ],
  comment-styles: (fill: rgb(100%, 0%, 0%)),
  indent-size: 15pt,
  indent-guides: 1pt + gray,
  row-gutter: 5pt,
  column-gutter: 5pt,
  inset: 5pt,
  stroke: 2pt + black,
  fill: none,
)[
  if $n < 0$:#i\
    return null#d\
  if $n = 0$ or $n = 1$:#i\
    return $n$#d\
  \
  let $x <- 0$\
  let $y <- 1$\
  for $i <- 2$ to $n-1$:#i #comment[so dynamic!]\
    let $z <- x+y$\
    $x <- y$\
    $y <- z$#d\
    \
  return $x+y$
]
]

= 参考文献与致谢

== 参考文献列表
#text(size: 15pt)[
  #bibliography("ref.bib", title: none, style: "ieee")
]

== 
#align(
  center + horizon, 
  text(
  font: (name: "Zapfino", covers: "latin-in-cjk"),
  size: 3em,)[Thanks!]
)
