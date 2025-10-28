#import "fonts.typ": *

#let hdu_blue = color.rgb(0, 0, 148)

#let date_format(date) = {
  set text(font: font_style.songti, size: font_size.四号)
  if type(date) == datetime {
    [#date.display("[year] 年 [month] 月 [day] 日")]
  } else if type(date) == array {
    [#date.at(0) 年 #date.at(1) 月 #date.at(2) 日]
  } else {
    panic("array or datetime expected, got " + str(type(date)))
  }
}

#let toc() = {
  set par(first-line-indent: 0pt)

  align(left)[
    #text(font: font_style.heiti, weight: "semibold", fill: hdu_blue, size: 18pt, "目录")
  ]

  v(1em)

  set text(font: font_style.heiti, size: 12pt)

  show outline: it => {
    set text(font: font_style.heiti, size: 12pt)
    it
    parbreak()
  }

  outline(
    title: none,
    indent: auto,
  )
}
