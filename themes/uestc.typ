#import "@preview/touying:0.6.1": *

#let _typst-builtin-repeat = repeat

#let uestc_blue = rgb(17, 94, 162)

#let uestc-header(self) = (
  block.with(
    // width: 100%,
    height:1.5cm,
    fill: self.colors.uestc_blue,
    inset: 1pt,
  )(
    components.mini-slides(
      self: self,
      fill: self.colors.neutral-lightest,
      linebreaks: false,
    )
  )
)

#let uestc-footer(self) = {
  set align(center + bottom)

  // 单元格包装器，指定样式
  let lcell(..args, it) = components.cell(
    ..args,
    inset: 2mm,
    align(left + horizon, text(fill: white, it, size: 13pt)),
  )
  let rcell(..args, it) = components.cell(
    ..args,
    inset: 2mm,
    align(right + horizon, text(fill: white, it, size: 13pt)),
  )

  show: block.with(width: 100%, height: auto)

  // 外层 2x1 垂直布局，每行是一个横向 grid
  grid(
    columns: (auto, auto),
    rows: (1em, 1em),
    row-gutter: 0pt,
    column-gutter:-1pt,
    lcell(
        fill: self.colors.primary,
        utils.call-or-display(self, self.store.footer-a),
      ),
    rcell(
        fill: self.colors.primary,
        utils.call-or-display(self, self.store.footer-c),
      ),
    lcell(
        fill: self.colors.secondary,
        utils.call-or-display(self, self.store.footer-b),
      ),
    rcell(
        fill: self.colors.secondary,
        utils.call-or-display(self, self.store.footer-d),
      )
  )
}

#let slide(
  config: (:),
  repeat: auto,
  setting: body => body,
  composer: auto,
  ..bodies,
) = touying-slide-wrapper(self => {
  let self = utils.merge-dicts(
    self,
    config-page(
      header: uestc-header,
      footer: uestc-footer,
    ),
    config-common(subslide-preamble: self.store.subslide-preamble),
  )
  touying-slide(self: self, config: config, repeat: repeat, setting: setting, composer: composer, ..bodies)
})

#let title-slide(
  config: (:),
  extra: none,
  ..args,
) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: uestc-header,
      footer: uestc-footer,
    ),
    config,
    config-common(freeze-slide-counter: false,
    subslide-preamble: self.store.subslide-preamble),
    // config-page(margin: 0em),
  )
  let info = self.info + args.named()
  let body = {
    set text(fill: self.colors.neutral-darkest)
    set align(center + horizon)
    block(
      width: 100%,
      inset: 3em,
      {
        v(-5em)
        block(
          fill: self.colors.uestc_blue,
          inset: 1em,
          width: 100%,
          radius: 0.8em,
          text(size: 1.5em, fill: self.colors.neutral-lightest, text(weight: "medium", info.title)) + (
            if info.subtitle != none {
              linebreak()
              v(0.2em)
              text(size: 1.1em, fill: self.colors.neutral-lightest, info.subtitle)
            }
          ),
        )
        set text(size: 1em)
        if info.author != none {
          block(spacing: 1em, info.author)
        }
        v(1em)
        if info.institution != none {
          block(spacing: 1em, info.institution)
        }
        if extra != none {
          block(spacing: 1em, extra)
        }
        v(1em)
        if info.date != none {
          block(spacing: 1em, utils.display-info-date(self))
        }
      },
    )
  }
  touying-slide(self: self, body)
})


#let uestc-theme(
  aspect-ratio: "16-9",
  mini-slides: (
    height: 4em,
    x: 2em,
    display-section: true,
    display-subsection: true,
    linebreaks: false,
    short-heading: true,
  ),
  footer: none,
  footer-a: context "    汇报人：xxx",
  footer-b: context "    文献汇报",
  footer-c: "汇报日期：" + datetime.today().display() + "    ",
  footer-d: context utils.slide-counter.display() + " / " + utils.last-slide-number + "    ",
  primary: rgb("#0c4842"),
  // uestc_blue: rgb(0,55,155),
  uestc_ginkgo: rgb(217, 183, 102),
  // 电子科技大学主调色
  uestc_blue: rgb(17, 94, 162),         // #115EA2
  uestc_blue_dark75: rgb(13, 61, 109),         // 75% 黑混合估算
  uestc_blue_dark50: rgb(10, 44, 76),          // 50% 黑混合估算
  uestc_greywhite: rgb(255, 255, 255),         // #E9E9F3
  alpha: 60%,
  subslide-preamble: self => block(
    inset: (top: -1.3em),
    spacing: 1em,
    // text(1.2em, weight: "bold", fill: self.colors.primary, utils.display-current-heading()+linebreak()+v(-1em)+h(-0.5em)+"──────────────────────────────────────────────"),
    text(1.2em, weight: "bold", fill: self.colors.primary, utils.display-current-heading())
  ),
  ..args,
  body,
) = {
  mini-slides = utils.merge-dicts(
    (height: 0em, x: 0em, display-section: false, display-subsection: true, linebreaks: true, short-heading: true),
    mini-slides,
  )
  set text(size: 20pt)
  set par(justify: true)

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      header-ascent: 2em,
      footer-descent: 0em,
      margin: (top: mini-slides.height, bottom: 2em, x: mini-slides.x),
    ),
    config-common(
      slide-fn: slide
    ),
    config-methods(
      init: (self: none, body) => {
        show heading: set text(self.colors.primary)
        body
      },
      alert: utils.alert-with-primary-color,
    ),
    config-colors(
      neutral-darkest: rgb("#000000"),
      neutral-dark: rgb("#202020"),
      neutral-light: rgb("#f3f3f3"),
      neutral-lightest: uestc_greywhite,
      primary: uestc_blue,
      uestc_blue: uestc_blue,
      uestc_ginkgo: uestc_ginkgo,
      primary-dark: uestc_blue_dark75,
      secondary: uestc_blue_dark50,
    ),
    config-store(
      mini-slides: mini-slides,
      footer: footer,
      footer-a:footer-a,
      footer-b:footer-b,
      footer-c:footer-c,
      footer-d:footer-d,
      alpha: alpha,
      subslide-preamble: subslide-preamble,
    ),
    ..args,
  )

  body
}