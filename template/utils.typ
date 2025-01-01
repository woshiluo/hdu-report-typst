#import "fonts.typ":*


#let hdu_blue=color.rgb(0, 0, 148)

#let date_format(
date: (2023,5,14)
) = {
      set text(font: font_style.songti, size: font_size.四号);
      [#date.at(0) 年 #date.at(1) 月 #date.at(2) 日]
}

#let toc() = {
  align(left)[
    #text(font: font_style.heiti, weight: "semibold", fill: hdu_blue, size: 18pt, "目录")
  ]

  parbreak()

  set text(font: font_style.heiti, size: 12pt)
  set par(first-line-indent: 0pt)

  show outline: it => {
      set text(font: font_style.heiti, size: 12pt)
      it
      parbreak()
    }

    outline(
    title: none,
    indent: true,
    )
}
