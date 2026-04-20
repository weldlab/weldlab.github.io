#import "@preview/hydra:0.6.2": hydra
#import "@preview/zebra:0.1.0": qrcode

#let header-fg = rgb("ffffff")
#let header-bg = rgb("4c70eb")
#let accent = rgb("4c70eb")
#let bg = rgb("000000")
#let fg = rgb("cccccc")
#let heading-fg = rgb("ffffff")

#set text(lang: "ru", font: "DejaVu Sans Mono")

#let title-page(event: "event", title: "title", team: "team") = page(
  paper: "presentation-16-9",
  margin: (
    x: 5mm,
    top: 32mm,
    bottom: 5mm,
  ),
  fill: bg,
  background: [
    #set text(font: "DejaVu Sans Mono") // встроен в компилятор
    #place(
      top + center,
      dy: 5mm,
      box(
        fill: accent,
        stroke: none,
        width: 100% - 10mm,
        height: 22mm,
        radius: 5mm,
        grid(
          columns: (50mm, 1fr, 50mm),
          align: horizon,
          inset: 0pt,
          stroke: none,
          box(height: 100%, width: 100%, inset: 5mm)[
            #set align(horizon + left)
            #image("./kubstu-official-logotype-dark.svg", height: 12mm)
          ],
          text(20pt, weight: "black", fill: header-fg)[
            Сварочная Лаборатория
          ],
          box(fill: bg, radius: 5mm, width: 100% - 8mm, height: 100% - 8mm)[
            #set align(horizon)
            #stack(
              dir: ltr,
              spacing: 5mm,
              image("./icons/creative-commons/cc.svg", height: 8mm),
              image("./icons/creative-commons/by.svg", height: 8mm),
              image("./icons/creative-commons/sa.svg", height: 8mm),
            )
          ]
        )
      )
    )
  ],
  [
    #place(
      bottom + right,
      image("./kubstu-building-k-bg.svg", height: 100%),
    )
    #grid(
      columns: 1fr,
      rows: (auto, 1fr, auto),
      align: horizon + center,
      text(16pt, weight: "black", fill: fg, font: "DejaVu Sans Mono", event),
      text(20pt, weight: "black", fill: heading-fg, font: "DejaVu Sans Mono", title),
      align(left, text(16pt, fill: fg, font: "DejaVu Sans Mono", team)),
    )
  ]
)

#let bye(url) = [
  == Спасибо за внимание!
  #box(
    width: 100%,
    height: 100%,
    fill: fg,
    radius: 5mm,
  )[
    #set align(horizon + center)
    #qrcode(url, width: 100mm, quiet-zone: true, background-fill: fg)
  ]
]

#let theme(doc) = {
  set text(lang: "ru", font: "DejaVu Sans Mono")

  set page(
    paper: "presentation-16-9",
    margin: (
      x: 5mm,
      top: 32mm,
      bottom: 5mm,
    ),
    fill: bg,
    background: [
      #set text(font: "DejaVu Sans Mono") // встроен в компилятор
      #place(
        top + center,
        dy: 5mm,
        box(
          fill: accent,
          stroke: none,
          width: 100% - 10mm,
          height: 22mm,
          radius: 5mm,
          grid(
            columns: (1fr, 10mm, 50mm),
            align: horizon,
            inset: 0pt,
            stroke: none,
            box(height: 100%, width: 100%, inset: 5mm)[
              #set align(horizon + left)
              #text(
                fill: header-fg,
                size: 7mm,
                weight: "bold",
                context[
                  #hydra(2, skip-starting: false)
                ]
              )
            ],
            text(7mm, weight: "black", fill: header-fg, context counter(page).display()),
            box(fill: bg, radius: 5mm, width: 100% - 8mm, height: 100% - 8mm)[
              #set align(horizon)
              #stack(
                dir: ltr,
                spacing: 5mm,
                image("./icons/creative-commons/cc.svg", height: 8mm),
                image("./icons/creative-commons/by.svg", height: 8mm),
                image("./icons/creative-commons/sa.svg", height: 8mm),
              )
            ]
          )
        )
      )
    ],
  )

  show heading.where(level: 2): it => [] // потому что он в заголовке
  show strong: set text(fill: accent)
  show emph: set text(fill: accent, weight: "bold")
  set text(20pt, fg)
  set align(horizon)

  doc
}

