// ========================== 导入电子科技大学主题 ==========================
#import "themes/uestc.typ": *

// ========================== 导入需要的包 ==========================
// ── 数学与公式相关 ──
#import "@preview/numbly:0.1.0": numbly         // 数值格式化
#import "@preview/mitex:0.2.5": *               // LaTeX 数学语法支持

// ── 代码与展示相关 ──
#import "@preview/codly:1.3.0": *                             // 代码高亮显示
#import "@preview/codly-languages:0.1.1": *                   // 支持的语言定义
#show: codly-init.with()                                      // 初始化代码样式
#import "@preview/algo:0.3.6": algo, i, d, comment, code      // 算法伪代码

// ── 图像与布局相关 ──
#import "@preview/cetz:0.3.4"                         // 类似于 TikZ 的绘图库
#import "@preview/lilaq:0.2.0" as lq                  // 进行数据可视化分析
#import "@preview/subpar:0.2.2"                       // 实现子图功能
#import "@preview/pinit:0.2.2": *                     // 用于进行标注的相对定位功能

// ── 其他组件 ──
#import "@preview/frame-it:1.1.2": *                  // 提供 Block 支持
#let block_color_blue = rgb(70, 110, 172)
#let block_color_orange = rgb(237, 168, 92)
#let (example, feature, variant, syntax) = frames(
  feature: ("Feature",),
  variant: ("Variant",),
  example: ("Example", block_color_blue),
  syntax: ("Syntax",),
)
#show: frame-style(styles.boxy)

// ========================== 进行需要的配置 ==========================
// 设置字体
#set text(font: ((name: "Arial", covers: "latin-in-cjk"),"STHeiti"), lang: "zh")

// 设置标题编号格式（1.1 → 1.）
// #set heading(numbering: numbly("{1}.", default: "1.1"))

// 设置数学公式编号格式
#set math.equation(numbering: "(1)")

// 提供不同的【加粗】（强调）选项，例如修改为在中文文字下面加点
// #show strong: content => {
//   show regex("\p{Hani}"): it => box(place(text("·", size: 1em), dx: 0.1em, dy: 0.75em) + it)
//   content.body
// }

// ========================== 使用uestc主题并初始化信息 ==========================
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

// ========================== 文档开始位置 ==========================
// 标题页
#title-slide()

//  ========================== 你的内容开始的地方 ==========================
= 第一节

== 第一页slide
开始你的内容

= 参考文献与致谢

== 参考文献列表
#text(size: 15pt)[
  #bibliography("ref.bib", title: none, style: "ieee")
]

== #none
#align(
  center + horizon, 
  text(
  font: (name: "Zapfino", covers: "latin-in-cjk"),
  size: 3em,)[Thanks!]
)
//  ========================== 内容结束的地方 ==========================