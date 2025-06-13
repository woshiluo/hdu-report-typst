#import "fonts.typ": *
#import "utils.typ": *

#let cover_normal(
  title: "Title",
  authors: ("author1", "author2"),
  date: (2023, 5, 14),
) = {
  set page("a4", numbering: none, margin: (top: 25%))
  align(center)[
    #set par(leading: 1.5em);
    #text(title, size: font_size.小一, weight: "bold");\
    #{
      if type(authors) == string {
        text(authors, size: font_size.四号)
      } else if type(authors) == array {
        text(authors.join(" "), size: font_size.四号)
      } else {
        authors
      }
    }\
    #date_format(date: date);
  ]
}

#let _info_key(body) = {
  rect(
    width: 100%,
    inset: 2pt,
    stroke: none,
    text(
      font: font_style.songti,
      size: 16pt,
      body,
    ),
  )
}

#let _info_value(body) = {
  text(
    font: font_style.songti,
    weight: 550,
    size: 14pt,
  )[
    #body
  ]
}

#let cover_hdu_report(
  title: "",
  subtitle: "",
  authors: "",
  author_id: "",
  class: "",
  grade: "",
  department: "",
  date: (2023, 04, 17),
) = {
  if type(authors) != type(author_id) {
    panic("`authors` and `author_id` should be of the same type")
  }

  let author_entry_from((author, id)) = {
    _info_value(author) + _info_value(id)
  }

  let authors_listing = if type(authors) == str and type(author_id) == str {
    (author_entry_from((authors, author_id)),)
  } else if type(authors) == array and type(author_id) == array {
    authors.zip(author_id).map(author_entry_from)
  } else {
    (authors + author_id,)
  }

  align(left)[
    #image("assets/hdu.png", width: 60%)
  ]
  align(center + horizon)[
    #pad(top: -15pt, text(title, size: 32pt, weight: 550, fill: hdu_blue, font: font_style.songti))\
    #text(size: 18pt, weight: 550)[ #subtitle ]\
    #pad(
      top: 32pt,
      grid(
        columns: 1,
        gutter: 12pt,
        _info_value(department),
        _info_value(class),
        ..authors_listing,
      ),
    )
  ]
  pagebreak()
}

#let equation_num(.., n) = {
  let loc = here()
  let chapt = counter(heading).at(loc).at(0)
  let c = counter("equation-chapter" + str(chapt))
  str(chapt) + "-" + str(c.get().last() + 1)
}

#let table_num(.., n) = {
  let loc = here()
  let chapt = counter(heading).at(loc).at(0)
  let c = counter("table-chapter" + str(chapt))
  str(chapt) + "-" + str(c.get().last() + 1)
}

#let image_num(.., n) = {
  let loc = here()
  let chapt = counter(heading).at(loc).at(0)
  let c = counter("image-chapter" + str(chapt))
  str(chapt) + "-" + str(c.get().last() + 1)
}

#let code_num(.., n) = {
  let loc = here()
  let chapt = counter(heading).at(loc).at(0)
  let c = counter("code-chapter" + str(chapt))
  str(chapt) + "-" + str(c.get().last() + 1)
}

#let equation(equation, caption: "") = {
  figure(
    equation,
    caption: caption,
    supplement: [公式],
    numbering: equation_num,
    kind: "equation",
  )
}

#let tbl(tbl, caption: "") = {
  figure(
    tbl,
    caption: caption,
    supplement: [表],
    numbering: table_num,
    kind: "table",
  )
}

#let img(img, caption: "") = {
  figure(
    img,
    caption: caption,
    supplement: [图],
    numbering: image_num,
    kind: "image",
  )
}

#let code(code, caption: "") = {
  figure(
    align(left)[
      #code <hdu-report-code-block>
    ],
    caption: caption,
    supplement: [代码],
    numbering: code_num,
    kind: "code",
  )
}
